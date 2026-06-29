#!/bin/bash
# =============================================================================
#  DOMAIN SWITCH — run this ONCE when navexcapital.com is connected in Vercel.
#  It flips the single base URL + turns indexing on, then regenerates every
#  absolute og:url / og:image / twitter:image / canonical / sitemap / manifest.
#  (Equivalent to: edit the $BASE + $NOINDEX lines at the top of build-meta.pl
#   and re-run it. THE one line that matters is $BASE.)
# =============================================================================
set -e
cd "$(dirname "$0")/.."
sed -i '' "s#^my \$BASE *=.*#my \$BASE    = 'https://navexcapital.com';   # switched to production domain#" tools/build-meta.pl
sed -i '' "s#^my \$NOINDEX *=.*#my \$NOINDEX = 0;                                  # live / indexable#" tools/build-meta.pl
perl tools/build-meta.pl
echo "==> Switched to https://navexcapital.com and made the site indexable."
echo "==> Review, then: git add -A && git commit -m 'Go live on navexcapital.com' && git push"
