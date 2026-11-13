"""Revoke the throwaway "Created via API" development certificates.

Every CI archive with automatic signing runs on a fresh macOS runner, so
Xcode has no development private key and asks Apple for a new development
certificate each time. Their private keys disappear with the runner, so the
certificates are useless afterwards, but they pile up until Apple refuses new
ones ("Your account has reached the maximum number of certificates").

This script revokes only certificates that are:
  - of type DEVELOPMENT (never distribution certificates), and
  - named "Created via API" (made by an API key, not by a person in Xcode).

It never fails the build: any error is logged as a warning.
"""

import json
import os
import sys
import urllib.error
import urllib.request

sys.path.insert(0, os.path.dirname(__file__))
from resolve_version import API, make_token  # noqa: E402


def request(method, path, token):
    req = urllib.request.Request(
        f"{API}/{path}", method=method, headers={"Authorization": f"Bearer {token}"}
    )
    with urllib.request.urlopen(req, timeout=60) as resp:
        body = resp.read()
        return json.loads(body) if body else {}


def main():
    try:
        token = make_token()
        certs = request(
            "GET",
            "certificates?filter[certificateType]=DEVELOPMENT,IOS_DEVELOPMENT&limit=200",
            token,
        )["data"]
    except Exception as exc:  # noqa: BLE001
        print(f"::warning::Could not list certificates: {exc}")
        return

    stale = [
        c for c in certs
        if (c["attributes"].get("displayName") or c["attributes"].get("name") or "").endswith("Created via API")
    ]
    print(f"Found {len(certs)} development certificate(s), {len(stale)} created via API.")
    for cert in stale:
        try:
            request("DELETE", f"certificates/{cert['id']}", token)
            print(f"Revoked {cert['id']}")
        except urllib.error.HTTPError as exc:
            print(f"::warning::Could not revoke {cert['id']}: HTTP {exc.code}")
        except Exception as exc:  # noqa: BLE001
            print(f"::warning::Could not revoke {cert['id']}: {exc}")


if __name__ == "__main__":
    main()
