#!/usr/bin/perl
use strict; use warnings;
# Moves the "LinkedIn" line out of the plain-text Contact <ul> and into its own
# icon+label social link right below it, identically on every page. Only the
# Contact footer-col block is touched; nothing else in the footer is rewritten.
# Re-run after any footer edit. Idempotent.

my $SITE = "/Users/salihdurmus/Desktop/navex-build/site";

my $SOCIAL = <<'HTML';
          <a href="https://www.linkedin.com/company/navexcapital" target="_blank" rel="noopener noreferrer" aria-label="Navex Capital on LinkedIn" class="footer-social">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zM7.119 20.452H3.554V9h3.565v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
            <span>LinkedIn</span>
          </a>
HTML

opendir(my $dh, $SITE) or die $!;
my @pages = grep { /\.html$/ } readdir $dh;
closedir $dh;

for my $file (sort @pages) {
  my $fp = "$SITE/$file";
  open my $fh,'<',$fp or die $!; local $/; my $c=<$fh>; close $fh;
  my $before = $c;

  # Drop any existing footer LinkedIn <li> (plain-text form, either entity or literal arrow)
  # and the standalone .footer-social block (so re-runs are idempotent), then re-insert
  # the social link right after the Contact list closes.
  $c =~ s{[ \t]*<li><a href="https://www\.linkedin\.com/company/navexcapital"[^>]*>LinkedIn[^<]*</a></li>\n}{}s;
  $c =~ s{[ \t]*<a href="https://www\.linkedin\.com/company/navexcapital"[^>]*class="footer-social".*?</a>\n}{}s;
  $c =~ s{(<div class="footer-col">\s*<h4>Contact</h4>\s*<ul>.*?</ul>\n)}{$1$SOCIAL}s;

  if ($c ne $before) {
    open my $out,'>',$fp or die $!; print $out $c; close $out;
    print "footer: $file\n";
  } else {
    print "skip (no change): $file\n";
  }
}
