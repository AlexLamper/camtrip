// Run with `npm test` (node --experimental-strip-types --test).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { CAMERA_STYLES, DEFAULT_STYLE, FREE_STYLES, PHOTO_STYLES } from '../src/lib/models.ts';

test('the Flash 400 look is a known, free style and the default for new groups', () => {
  assert.equal(DEFAULT_STYLE, 'flash');
  assert.ok(CAMERA_STYLES.includes('flash'));
  assert.ok(PHOTO_STYLES.includes('flash'));
  assert.ok(FREE_STYLES.includes('flash'));
});

test('every free style is a camera style', () => {
  for (const s of FREE_STYLES) assert.ok(CAMERA_STYLES.includes(s), s);
});
