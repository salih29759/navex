# Navex Capital — Website

Operator-led maritime, transport & logistics advisory. Custom-coded marketing site.
Plain HTML + CSS + vanilla JS — no build step. Deploy anywhere (Netlify / Vercel / GitHub Pages).

## Structure
```
navex-site/
  index.html        Home (built)
  services.html     (todo)
  industries.html   (todo)
  case-studies.html (todo)
  about.html        (todo)
  insights.html     (todo)
  contact.html      (todo)
  css/style.css     Design system + page styles
  js/main.js        Nav toggle, header scroll state, scroll-reveal
  assets/           Images (swap placeholders for authentic maritime photos)
```

## Design system (CSS custom properties in css/style.css)
- **Navy** `#1B2150` (primary deep) · **Navy-deep** `#141936` · **Navy-700** `#2A2E45` (text)
- **Gold** `#C2A063` (accent only — hairlines, icons, button, trident) · **Gold-soft** `#D4B985`
- **White** `#FFFFFF` · **Light gray** `#F4F4F2` (section break) · **Muted** `#6B6E80`
- Type: **Fraunces** (display) · **Inter** (body) · **Spline Sans Mono** (eyebrows / coordinates / data)
- Aesthetic: maritime chart — navy water, gold instrument, bathymetric hairlines, trident signature.
- Rule: gold is an **accent**, never a background block. Backgrounds = white / light-gray / navy.

## Section pattern (reusable)
`.section.section--light | --gray | --dark` + `.container` + `.eyebrow` + heading.
`.reveal` = progressive scroll-in (visible without JS).

## Home sections (built)
Hero → Why Navex (wedge) → Our edge (stats) → What we do (5 services) → Proof (engagement) → Who we serve → CTA band → Footer.

## Copy rules
- English (clients are US/EU PE). Operator-led, honest, owner-centric voice. No generic-consultant language.
- **Realism rule:** all track record framed as "our founding team's operator experience, prior to Navex." Never "Navex did X." Soften unverified claims; cite sources.

## Next
Build remaining pages reusing the design system: Services (+ delivery approach 4-step), Industries (sector grid), Case Studies (stat band + 2-3 engagement cards + testimonial), About (team + values as icon grid), Insights (card grid), Contact (form: Name/Company/Title/Email/Message). Then swap placeholder visuals for authentic maritime photography.
