#!/usr/bin/env python3
"""Keeps the ARB files in lib/l10n in sync with the template (app_en.arb).

  python3 tool/l10n_sync.py missing [--values]
      Lists, per ARB, the keys that app_en.arb has and the file lacks (and
      keys the file has that the template no longer has). With --values the
      English text is printed too, ready to translate. Exit code 1 if
      anything is missing.

  python3 tool/l10n_sync.py merge <locale> <file>
      Merges translations into app_<locale>.arb (created if needed). <file>
      has one "key=value" per line ("\\n" for a line break, # for comments).
      Existing translations are replaced by the ones in <file>; keys are
      written in the template's order, keys unknown to the template are
      dropped. The ARB is read right before it is written, so translations
      that other people added in the meantime are kept.

  python3 tool/l10n_sync.py add-template <file>
      Adds new keys to app_en.arb: "key=value" lines; placeholders ({name})
      get a String placeholder entry, plurals ({count, plural, ...}) an int.

Rules checked on merge: every placeholder of the template is used and no
unknown ones (except dateRangeSameMonth, see test/l10n_test.dart), plurals
have an "other" case, no long dashes.
"""

import json
import os
import re
import sys
from collections import OrderedDict

HERE = os.path.dirname(os.path.abspath(__file__))
L10N = os.path.join(HERE, '..', 'lib', 'l10n')
TEMPLATE = 'app_en.arb'


def load(path):
    with open(path, encoding='utf-8') as f:
        return json.load(f, object_pairs_hook=OrderedDict)


def save(path, data):
    tmp = path + '.tmp'
    with open(tmp, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        f.write('\n')
    os.replace(tmp, path)


def arbs():
    return sorted(f for f in os.listdir(L10N) if f.startswith('app_') and f.endswith('.arb'))


def keys_of(data):
    return [k for k in data if not k.startswith('@')]


def placeholders(message):
    """Placeholder names in an ICU message, including inside plural branches."""
    found = set()

    def groups(text):
        depth, start = 0, -1
        for i, ch in enumerate(text):
            if ch == '{':
                if depth == 0:
                    start = i + 1
                depth += 1
            elif ch == '}':
                depth -= 1
                if depth == 0:
                    yield text[start:i]

    def scan(text):
        for g in groups(text):
            simple = re.match(r'^\s*(\w+)\s*$', g)
            complex_ = re.match(r'^\s*(\w+)\s*,\s*(?:plural|select)\s*,(.*)$', g, re.S)
            if simple:
                found.add(simple.group(1))
            elif complex_:
                found.add(complex_.group(1))
                for inner in groups(complex_.group(2)):
                    scan(inner)

    scan(message)
    return found


def declared(template, key):
    return set(((template.get('@' + key) or {}).get('placeholders') or {}).keys())


def check(template, key, message):
    problems = []
    used = placeholders(message)
    want = declared(template, key)
    if key == 'dateRangeSameMonth':
        if 'startDay' not in used or not used & {'endDay', 'endDate'} or used - want:
            problems.append('date range placeholders')
    elif used != want:
        problems.append('placeholders %s, expected %s' % (sorted(used), sorted(want)))
    if ', plural,' in message and 'other{' not in message:
        problems.append('plural without other')
    if re.search('[–—]', message):
        problems.append('long dash')
    if message.count('{') != message.count('}'):
        problems.append('unbalanced braces')
    return problems


def read_lines(path):
    out = OrderedDict()
    with open(path, encoding='utf-8') as f:
        for n, line in enumerate(f, 1):
            line = line.rstrip('\n')
            if not line.strip() or line.lstrip().startswith('#'):
                continue
            if '=' not in line:
                sys.exit('%s:%d: no "=" in line' % (path, n))
            k, v = line.split('=', 1)
            out[k.strip()] = v.replace('\\n', '\n')
    return out


def cmd_missing(values):
    template = load(os.path.join(L10N, TEMPLATE))
    tkeys = keys_of(template)
    any_missing = False
    for name in arbs():
        if name == TEMPLATE:
            continue
        data = load(os.path.join(L10N, name))
        own = set(keys_of(data))
        missing = [k for k in tkeys if k not in own]
        extra = [k for k in own if k not in template]
        if not missing and not extra:
            continue
        any_missing = any_missing or bool(missing)
        print('%s: %d missing, %d extra' % (name, len(missing), len(extra)))
        for k in missing:
            print('  - %s' % k + ('=' + template[k].replace('\n', '\\n') if values else ''))
        for k in extra:
            print('  + %s (not in template)' % k)
    if not any_missing:
        print('All ARB files have every key of %s (%d keys).' % (TEMPLATE, len(tkeys)))
    return 1 if any_missing else 0


def cmd_merge(locale, src):
    template = load(os.path.join(L10N, TEMPLATE))
    new = read_lines(src)
    bad = False
    for k, v in new.items():
        if k not in template:
            print('unknown key (dropped): %s' % k)
            continue
        for p in check(template, k, v):
            print('%s: %s' % (k, p))
            bad = True
    if bad:
        return 1
    path = os.path.join(L10N, 'app_%s.arb' % locale)
    current = load(path) if os.path.exists(path) else OrderedDict()
    out = OrderedDict([('@@locale', locale)])
    for k in keys_of(template):
        if k in new:
            out[k] = new[k]
        elif k in current:
            out[k] = current[k]
    save(path, out)
    missing = [k for k in keys_of(template) if k not in out]
    print('app_%s.arb: %d keys%s' % (locale, len(out) - 1, ', %d still missing' % len(missing) if missing else ''))
    return 0


def cmd_add_template(src):
    path = os.path.join(L10N, TEMPLATE)
    template = load(path)
    for k, v in read_lines(src).items():
        template[k] = v
        names = placeholders(v)
        if names:
            plural = {m.group(1) for m in re.finditer(r'\{\s*(\w+)\s*,\s*plural\s*,', v)}
            template['@' + k] = {'placeholders': {n: {'type': 'int' if n in plural else 'String'} for n in sorted(names)}}
    save(path, template)
    return 0


def main(argv):
    if len(argv) >= 1 and argv[0] == 'missing':
        return cmd_missing('--values' in argv)
    if len(argv) == 3 and argv[0] == 'merge':
        return cmd_merge(argv[1], argv[2])
    if len(argv) == 2 and argv[0] == 'add-template':
        return cmd_add_template(argv[1])
    print(__doc__)
    return 2


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
