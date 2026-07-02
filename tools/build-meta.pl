#!/usr/bin/perl
use strict; use warnings;

# ============================================================================
#  SINGLE SOURCE OF TRUTH for the canonical base URL.
#  >>> AT DOMAIN-SWITCH TIME: change ONLY the $BASE line below to
#  >>> 'https://navexcapital.com' and set $NOINDEX = 0, then re-run:  perl tools/build-meta.pl
#  Every absolute og:url / og:image / twitter:image / canonical / sitemap / manifest
#  URL on the whole site is regenerated from $BASE. Nothing else to touch.
# ============================================================================
my $BASE    = 'https://www.navexcapital.com';    # <-- THE ONE LINE. Always the www host: the apex 308-redirects to www.
my $NOINDEX = 0;                                  # live / indexable

my $SITE = "/Users/salihdurmus/Desktop/navex-build/site";
my $OGALT = "Navex Capital, operator-led maritime, transport and logistics advisory";

# ---- CONSENT LAYER (CookieYes). Kept as the FIRST script in <head>; official tag used
# ---- verbatim (synchronous by design so the banner/gate is ready before anything else).
# ---- Remove this heredoc (and the gated trackers below) to remove the whole stack.
my $CONSENT_LOADER = <<'EOT';
  <!-- Start cookieyes banner (consent layer; must stay the FIRST script in <head>) -->
  <script id="cookieyes" type="text/javascript" src="https://cdn-cookieyes.com/client_data/e100fffb3d7c47f7a80d50e8d5fb3951/script.js"></script>
  <!-- End cookieyes banner -->
EOT

# ---- CONSENT-GATED TRACKERS. type="text/plain" keeps each script inert (never fetched,
# ---- never executed) until CookieYes activates its data-cookieyes category on consent.
# ---- Each block is independently removable.
my $GATED_TRACKERS = <<'EOT';
  <!-- Microsoft Clarity (heatmaps / session replay, input masked) - runs only after ANALYTICS consent. Remove this block to drop Clarity. -->
  <script type="text/plain" data-cookieyes="cookieyes-analytics">(function(c,l,a,r,i,t,y){c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);})(window, document, "clarity", "script", "xfzt0ookk0");</script>
  <!-- Leadfeeder (company-level visitor identification incl. form submissions) - runs only after ANALYTICS consent (category per Leadfeeder's GDPR guidance). Remove this block to drop Leadfeeder. -->
  <script type="text/plain" data-cookieyes="cookieyes-analytics">(function(ss,ex){window.ldfdr=window.ldfdr||function(){(ldfdr._q=ldfdr._q||[]).push([].slice.call(arguments));};(function(d,s){fs=d.getElementsByTagName(s)[0];function ce(src){var cs=d.createElement(s);cs.src=src;cs.async=1;fs.parentNode.insertBefore(cs,fs);};ce('https://sc.lfeeder.com/lftracker_v1_'+ss+(ex?'_'+ex:'')+'.js');})(document,'script');})('YEgkB8lbgvz4ep3Z');</script>
  <!-- RB2B (visitor identification) - runs only after MARKETING (advertisement) consent, per RB2B's CookieYes guidance + explicit blocking so nothing loads pre-consent. Remove this block to drop RB2B. -->
  <script type="text/plain" data-cookieyes="cookieyes-advertisement">!function(key) {if (window.reb2b) return;window.reb2b = {loaded: true};var s = document.createElement("script");s.async = true;s.src = "https://ddwl4m2hdecbv.cloudfront.net/b/" + key + "/" + key + ".js.gz";document.getElementsByTagName("script")[0].parentNode.insertBefore(s,document.getElementsByTagName("script")[0]);}("1N5W0H73VRO5");</script>
EOT

# page file => canonical path
my @pages = (
  ["index.html","/"],
  ["services.html","/services.html"],
  ["industries.html","/industries.html"],
  ["case-studies.html","/case-studies.html"],
  ["about.html","/about.html"],
  ["insights.html","/insights.html"],
  ["contact.html","/contact.html"],
  ["insight-operational-dd.html","/insight-operational-dd.html"],
  ["privacy.html","/privacy.html"],
  ["terms.html","/terms.html"],
  ["404.html","/404.html"],
);

for my $p (@pages) {
  my ($file,$path) = @$p;
  my $fp = "$SITE/$file";
  unless (-f $fp) { print "skip (missing): $file\n"; next; }
  open my $fh,'<',$fp or die $!; local $/; my $c=<$fh>; close $fh;

  my ($title) = $c =~ /<title>(.*?)<\/title>/s;  $title //= 'Navex Capital';
  my ($desc)  = $c =~ /<meta name="description" content="(.*?)"\s*\/?>/s; $desc //= '';

  # strip any previously-generated block + legacy managed tags
  $c =~ s/[ \t]*<!-- META:START.*?META:END -->\n?//s;
  $c =~ s/^[ \t]*<meta name="robots"[^>]*>\s*\n//mig;
  $c =~ s/^[ \t]*<link rel="canonical"[^>]*>\s*\n//mig;
  $c =~ s/^[ \t]*<meta property="og:[^>]*>\s*\n//mig;
  $c =~ s/^[ \t]*<meta name="twitter:[^>]*>\s*\n//mig;
  $c =~ s/^[ \t]*<link rel="icon"[^>]*>\s*\n//mig;
  $c =~ s/^[ \t]*<link rel="apple-touch-icon"[^>]*>\s*\n//mig;
  $c =~ s/^[ \t]*<link rel="manifest"[^>]*>\s*\n//mig;
  $c =~ s/^[ \t]*<meta name="theme-color"[^>]*>\s*\n//mig;

  my $noindex = ($NOINDEX || $file eq '404.html')
    ? "  <meta name=\"robots\" content=\"noindex\" />\n" : "";
  my $url = $BASE . $path;
  my $img = "$BASE/assets/og-image.jpg";

  my $block = "  <!-- META:START (generated by tools/build-meta.pl from \$BASE) -->\n"
    . $CONSENT_LOADER
    . $noindex
    . "  <link rel=\"canonical\" href=\"$url\" />\n"
    . "  <meta property=\"og:type\" content=\"website\" />\n"
    . "  <meta property=\"og:site_name\" content=\"Navex Capital\" />\n"
    . "  <meta property=\"og:locale\" content=\"en_US\" />\n"
    . "  <meta property=\"og:title\" content=\"$title\" />\n"
    . "  <meta property=\"og:description\" content=\"$desc\" />\n"
    . "  <meta property=\"og:url\" content=\"$url\" />\n"
    . "  <meta property=\"og:image\" content=\"$img\" />\n"
    . "  <meta property=\"og:image:width\" content=\"1200\" />\n"
    . "  <meta property=\"og:image:height\" content=\"630\" />\n"
    . "  <meta property=\"og:image:alt\" content=\"$OGALT\" />\n"
    . "  <meta name=\"twitter:card\" content=\"summary_large_image\" />\n"
    . "  <meta name=\"twitter:title\" content=\"$title\" />\n"
    . "  <meta name=\"twitter:description\" content=\"$desc\" />\n"
    . "  <meta name=\"twitter:image\" content=\"$img\" />\n"
    . "  <meta name=\"twitter:image:alt\" content=\"$OGALT\" />\n"
    . "  <link rel=\"icon\" href=\"/favicon.svg\" type=\"image/svg+xml\" />\n"
    . "  <link rel=\"icon\" href=\"/favicon.ico\" sizes=\"32x32\" />\n"
    . "  <link rel=\"apple-touch-icon\" href=\"/assets/apple-touch-icon.png\" />\n"
    . "  <link rel=\"manifest\" href=\"/site.webmanifest\" />\n"
    . "  <meta name=\"theme-color\" content=\"#13293C\" />\n"
    . "  <script>window.va = window.va || function () { (window.vaq = window.vaq || []).push(arguments); };</script>\n"
    . "  <script defer src=\"/_vercel/insights/script.js\"></script>\n"
    . "  <script defer src=\"/_vercel/speed-insights/script.js\"></script>\n"
    . $GATED_TRACKERS;

  if ($file eq 'index.html') {
    $block .= "  <script type=\"application/ld+json\">{\"\@context\":\"https://schema.org\",\"\@type\":\"Organization\",\"name\":\"Navex Capital\",\"url\":\"$BASE/\",\"logo\":\"$BASE/assets/apple-touch-icon.png\",\"description\":\"Operator-led maritime, transport and logistics advisory for private equity firms and business owners.\",\"email\":\"info\@navexcapital.com\",\"telephone\":\"+1-786-717-2128\",\"address\":{\"\@type\":\"PostalAddress\",\"streetAddress\":\"2645 Edgewater Drive\",\"addressLocality\":\"Weston\",\"addressRegion\":\"FL\",\"postalCode\":\"33332\",\"addressCountry\":\"US\"},\"sameAs\":[\"https://www.linkedin.com/company/navexcapital\"]}</script>\n";
  }
  $block .= "  <!-- META:END -->\n";

  # insert right after the description meta line
  $c =~ s/(<meta name="description" content="[^"]*"\s*\/?>\n)/$1$block/;

  open my $out,'>',$fp or die $!; print $out $c; close $out;
  print "ok: $file\n";
}

# ---- robots.txt (permissive so link-preview scrapers are never blocked; noindex meta handles search) ----
open my $r,'>',"$SITE/robots.txt" or die $!;
print $r "User-agent: *\nAllow: /\nSitemap: $BASE/sitemap.xml\n";
close $r; print "wrote robots.txt\n";

# ---- sitemap.xml ----
open my $sm,'>',"$SITE/sitemap.xml" or die $!;
print $sm qq{<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n};
for my $p (@pages) { next if $p->[0] eq '404.html'; print $sm "  <url><loc>$BASE$p->[1]</loc></url>\n"; }
print $sm "</urlset>\n"; close $sm; print "wrote sitemap.xml\n";

# ---- site.webmanifest ----
open my $wm,'>',"$SITE/site.webmanifest" or die $!;
print $wm qq({\n  "name": "Navex Capital",\n  "short_name": "Navex",\n  "theme_color": "#13293C",\n  "background_color": "#13293C",\n  "display": "standalone",\n  "start_url": "/",\n  "icons": [\n    { "src": "/assets/apple-touch-icon.png", "sizes": "180x180", "type": "image/png" },\n    { "src": "/favicon.svg", "type": "image/svg+xml", "sizes": "any" }\n  ]\n}\n);
close $wm; print "wrote site.webmanifest\n";

print "DONE (BASE=$BASE NOINDEX=$NOINDEX)\n";
