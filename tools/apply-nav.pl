#!/usr/bin/perl
use strict; use warnings;
# Stamps ONE canonical primary nav (with dropdowns) into every page, so the nav is
# identical site-wide. Replaces the whole <nav class="nav-links">...</nav> block.
# Re-run after adding pages. Idempotent.

my $SITE = "/Users/salihdurmus/Desktop/navex-build/site";
my $caret = '<svg class="caret" width="10" height="6" viewBox="0 0 10 6" fill="none" aria-hidden="true"><path d="M1 1l4 4 4-4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';

my $NAV = <<"HTML";
      <nav class="nav-links" aria-label="Primary">
        <div class="nav-item has-menu">
          <button type="button" class="nav-parent" aria-haspopup="true" aria-expanded="false">Who We Serve $caret</button>
          <div class="nav-menu">
            <a href="for-private-equity.html">Private Equity</a>
            <a href="for-owners.html">Business Owners &amp; Founders</a>
            <a href="for-lenders.html">Lenders &amp; Credit Funds</a>
          </div>
        </div>
        <div class="nav-item has-menu">
          <button type="button" class="nav-parent" aria-haspopup="true" aria-expanded="false">Services $caret</button>
          <div class="nav-menu">
            <a href="services.html">All services</a>
            <a href="service-due-diligence.html">Commercial &amp; Operational Due Diligence</a>
            <a href="service-value-creation.html">Value Creation &amp; Growth</a>
            <a href="services.html#board-interim-leadership">Board &amp; Interim Leadership</a>
            <a href="services.html#strategic-advisory">Strategic Advisory for PE Firms</a>
            <a href="services.html#investment-readiness">Investment Readiness for Owners</a>
            <a href="services.html#transformation-management">Transformation Management</a>
            <a href="services.html#integration-management">Integration Management</a>
          </div>
        </div>
        <div class="nav-item has-menu">
          <button type="button" class="nav-parent" aria-haspopup="true" aria-expanded="false">Industries $caret</button>
          <div class="nav-menu">
            <a href="industries.html#maritime-shipping">Maritime &amp; Shipping</a>
            <a href="industries.html#marine-services">Marine Services</a>
            <a href="industries.html#port-terminal">Port &amp; Terminal Logistics</a>
            <a href="industries.html#transport-freight">Transport &amp; Logistics</a>
          </div>
        </div>
        <a href="case-studies.html">Case&nbsp;Studies</a>
        <a href="about.html">About</a>
        <a href="contact.html">Contact</a>
        <a href="contact.html" class="btn btn--primary nav-cta-m">Talk to us</a>
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
    print "skip (no match): $file\n";
  }
}
