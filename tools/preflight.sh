#!/bin/bash
# Pre-deploy content guard. Run before pushing: tools/preflight.sh
# Fails (exit 1) if placeholder text, em dashes, or a stray noindex ship to production.
cd "$(dirname "$0")/../site"
fail=0

echo "== placeholders =="
if grep -rn --include='*.html' -E '\[to confirm|TODO|lorem|XXX' .; then fail=1; else echo "  clean"; fi

echo "== 'placeholder' outside input attributes =="
if grep -rn --include='*.html' 'placeholder' . | grep -v 'placeholder='; then fail=1; else echo "  clean"; fi

echo "== em dashes in content (site copy rule) =="
if grep -rn --include='*.html' -- '—' .; then fail=1; else echo "  clean"; fi

echo "== stray noindex on indexable pages (404 is allowed) =="
if grep -ln 'noindex' *.html | grep -v '^404.html$'; then fail=1; else echo "  clean"; fi

echo "== mailto sanity (only info@navexcapital.com) =="
if grep -rhoE 'mailto:[^"]+' *.html | grep -v 'info@navexcapital.com'; then fail=1; else echo "  clean"; fi

if [ "$fail" -eq 1 ]; then echo "PREFLIGHT FAILED"; exit 1; fi
echo "PREFLIGHT OK"
