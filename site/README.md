# Navex Capital - Website

Operator-led maritime, transport &amp; logistics advisory. Custom-coded marketing site.
Plain HTML + CSS + vanilla JS, no build step. Deploy anywhere (Netlify / Vercel / GitHub Pages).

## Run / preview
No build step. Open `index.html`, or serve statically:
`python3 -m http.server 8000 --directory site` then visit http://localhost:8000

## Pages
```
index.html         Home (video hero, wedge, stats, services, photo band, sectors, proof)
services.html      5 services + 4-step delivery approach
industries.html    4 maritime sectors (alternating image/text)
about.html         who/mission/vision, 6 core values, founder bio
insights.html      article card grid
contact.html       form (Name/Company/Title/Email/Message) + details
case-studies.html  stat band + Situation/Role/Result cards (engagement scaffold)
terms.html         terms of use + disclaimer
css/style.css      design system + all components
js/main.js         nav, header scroll state, staggered reveal, count-up, parallax
assets/            real maritime photography + hero video loop + favicon/OG
```

## Design system: "Ink & Tide"
Sector/competitor-driven (Pareto/EQT feel), independent of the old navy+gold logo. Sans-dominant,
white-dominant, near-zero ornament, photography-forward.

- **Ink (primary)** `#13293C` deep marine blue. Dark sections, footer, headings.
- **Ink-deep** `#0D1F2E` (CTA band). **Text** `#20303A`. **Muted** `#566570`.
- **Accent (teal)** `#1C7E96` (+ on-dark `#4FA6BE`). Hairlines, icons, links, one button, trident.
  Accent only, never a background block.
- **Backgrounds** white `#FFFFFF` / cool off-white `#EFF2F3` / ink. Photography carries the contrast.
- **Type** Hanken Grotesk (single family), weight-driven hierarchy. No serif, no mono.
- Tokens live in `:root` of `css/style.css` (names `--navy` / `--gold` kept for stability; values are
  the Ink & Tide palette).

## Motion (progressive enhancement)
Hero is a real compressed video loop with a poster fallback. Scroll reveals are staggered; the stat
band counts up; photo bands have a subtle parallax. All disabled under `prefers-reduced-motion`, and
content is fully visible without JS.

## Copy rules
- English (clients are US/EU PE). Operator-led, honest, owner-centric. No generic-consultant glossy.
- **Realism rule:** all track record is framed as "our founding team's operator experience, prior to
  Navex." Never "Navex did X." Soften unverified claims.
- **No em dashes (-) in site content.** Use commas, periods, or colons. (Run `grep -rn "—" .` to check.)
- Maritime only. No road-freight / truck imagery.

## Still to finalize
- Real (anonymized) figures for two Case Studies cards, plus a permissioned testimonial (from Harun).
- Contact form backend: set the form `action` to a Formspree endpoint, or add `data-netlify="true"`.
- Optional: Harun's real founder photo on About, seamless boomerang hero loop, per-article Insights pages.
