#!/usr/bin/perl
use strict; use warnings;
# Stamps ONE canonical primary nav into every page, so the nav is identical site-wide.
# Only "Who We Serve" is a dropdown; Services and Industries are plain links.
# Clean (extension-less) URLs. Re-run after adding pages. Idempotent.

my $SITE = "/Users/salihdurmus/Desktop/navex-build/site";
my $caret = '<svg class="caret" width="10" height="6" viewBox="0 0 10 6" fill="none" aria-hidden="true"><path d="M1 1l4 4 4-4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';

my $NAV = <<"HTML";
      <nav class="nav-links" aria-label="Primary">
        <div class="nav-item has-menu">
          <button type="button" class="nav-parent" aria-haspopup="true" aria-expanded="false">Who We Serve $caret</button>
          <div class="nav-menu">
            <a href="/for-private-equity">Private Equity</a>
            <a href="/for-owners">Business Owners &amp; Founders</a>
            <a href="/for-lenders">Lenders &amp; Credit Funds</a>
          </div>
        </div>
        <a href="/services">Services</a>
        <a href="/industries">Industries</a>
        <a href="/case-studies">Case&nbsp;Studies</a>
        <a href="/about">About</a>
        <a href="/contact">Contact</a>
        <a href="/contact" class="btn btn--primary nav-cta-m">Talk to us</a>
      </nav>
HTML
chomp $NAV;

opendir(my $dh, $SITE) or die $!;
my @pages = grep { /\.html$/ } readdir $dh;
closedir $dh;

for my $file (sort @pages) {
  my $fp = "$SITE/$file";
  open my $fh,'<',$fp or die $!; local $/; my $c=<$fh>; close $fh;
  my $before = $c;
  $c =~ s{[ \t]*<nav class="nav-links" aria-label="Primary">.*?</nav>}{$NAV}s;
  if ($c ne $before) {
    open my $out,'>',$fp or die $!; print $out $c; close $out;
    print "nav: $file\n";
  } else {
    print "skip (no change): $file\n";
  }
}
