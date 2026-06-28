# Navex Capital — Design Direction & Build Brief

> This is the canonical brief for building the Navex Capital website. Any coding agent
> (Claude Code, Codex, etc.) working in this repo should read this file **and** the
> documents in `/docs` before writing or restyling anything.

---

## 1. What we are building

A custom-coded marketing site for **Navex Capital** — an **operator-led** advisory boutique
for **maritime, transport & logistics** private equity deals (sub-$200M; US / Canada / Europe).

- **Audience:** mid-market PE sponsors, business owners/founders, lenders. Sophisticated, US/EU.
- **The wedge (the one thing no competitor has):** *"We advise on the deal — and help run the
  business after."* Most advisors stop at the transaction; we do the commercial & operational
  work before the deal and run value-creation / interim leadership after the close.
- **Stack:** plain HTML + CSS + vanilla JS. **No build step.** Deploy anywhere.

---

## 2. Brand constants (do not change)

- **Navy** `#1B2150` (primary) · **Navy-deep** `#141936` · **Navy-700/text** `#2A2E45`
- **Gold** `#C2A063` — **accent ONLY** (hairlines, small marks, one button, the trident). Never a full background block.
- **Backgrounds:** white `#FFFFFF` / light-gray `#F4F4F2` / navy. The site alternates light and navy; gold is never a background.
- **Mark:** a trident (Navex = navigation / command of the sea). Keep it; refine it.

Everything else — typeface, layout, photography, ornament — is open and should be chosen
against a real reference (see §4).

---

## 3. HARD RULES (non-negotiable)

1. **Realism rule.** Navex is a newly founded boutique about to do its first deals. **Never** say
   "Navex did X." All track record is **"our founding team's operator experience, prior to Navex."**
   Soften unverified claims ("generally", "largely"). No inflated consultant language. Cite sources where used.
2. **Voice.** English. Operator-led, honest, owner-centric, plain. The tone of Carter Morse (warm,
   owner-focused) + Poten ("advise with honesty, even if it doesn't result in a transaction").
   **No** generic management-consultant glossy ("leverage synergies to unlock holistic value").
3. **Do not clone competitor code or brand.** Competitors (Mercator, Carter Morse, AMA, Marsoft,
   McLean, Poten) are references for *structure and proof patterns* — see `/docs/02`. Do not copy
   their CSS, fonts, or identity. We borrow direction, not assets.
4. **Quality floor.** Responsive to mobile; visible keyboard focus; `prefers-reduced-motion`
   respected; content visible without JS (animation is progressive enhancement only).

---

## 4. THE DESIGN PROBLEM TO SOLVE: stop looking "AI-generated"

The first design pass and three alternate directions were **rejected by the client for looking
AI-generated.** Fixing this is the whole job. Read this section carefully.

### 4a. Why AI designs look AI — the tells to AVOID
Do **not** reach for any of these (they are the current AI-design clichés):
- **Fonts:** Fraunces, Cormorant Garamond, Playfair, Inter, Space Grotesk, Manrope, and a
  **monospace font used for eyebrows/labels with wide letter-spacing**. This trio (elegant-serif +
  Inter + mono-eyebrow) is the #1 AI tell. Avoid it.
- **Moves:** a headline with **one word emphasized in an accent-color italic**; a navy/dark hero
  with a **corner glow gradient**; **decorative coordinate labels** (12°/24°) or other "theme-y"
  flourishes; **01 / 02 / 03 numbered cards** used as decoration; diamond/✦ bullet rows; oversized
  generic stat blocks "with a small label and a gradient accent."
- **The three AI default looks** (avoid all three): (1) warm cream background `#F4F1EA` + high-contrast
  serif + terracotta accent; (2) near-black background + one acid-green/vermilion accent;
  (3) broadsheet layout with hairline rules, zero radius, dense newspaper columns.

### 4b. What actually kills the AI look (in priority order)
1. **Real photography.** The single biggest lever. Authentic, specific maritime/operator images
   (night port, container-ship aerial, terminal, shipyard, harbor tug, offshore, hi-vis operators
   on the ground). The client's old site was praised specifically for its real night-port hero.
   Until real photos are in, the design cannot be fairly judged. **Get real photos in early.**
2. **A chosen typeface with a point of view** — selected *against the reference* (§4c), not a trendy
   free default. If budget allows, a **licensed typeface** is the fastest premium differentiator
   (part of why real firms don't look AI). Free, non-cliché candidate pools (pick to match the
   reference, don't just grab one):
   - Heritage/institutional serif: Libre Caslon, Source Serif 4, Newsreader, Spectral, Lora-not.
   - Workhorse/grotesque sans: Archivo, Hanken Grotesk, Schibsted Grotesk, Public Sans, or a
     licensed grotesque (Söhne, Neue Haas, Founders Grotesk).
   - Avoid the §4a list regardless.
3. **Restraint.** Real finance sites are quieter than AI output. Spend boldness in ONE place; keep
   everything else disciplined. Cut ornament that doesn't carry meaning.
4. **Specific content & proof** — real names, real (anonymized) engagements, concrete numbers.

### 4c. The method: anchor to a reference, don't generate from scratch
Five from-scratch directions were rejected. **Do not keep generating blind variations.** Instead:
- The client will provide **1–2 reference sites whose look they genuinely love** (maritime, a private
  bank, a luxury brand, or anything premium — doesn't have to be in-sector).
- **Design Navex's content *toward the feel of that reference*** — its type choices, spacing logic,
  color treatment, layout rhythm, use of photography — without copying its code or brand.
- Confirm the type + one hero treatment with the client **before** building all pages.

> If no reference has been provided yet, **ask the client for it first.** Do not restyle from scratch
> without it — that is what produced the rejected results.

---

## 5. Current repo status

- `site/index.html` — Home page. **Structure, content, copy, semantics, and accessibility are
  reusable and good.** The **visual styling in `site/css/style.css` was the rejected AI-looking pass**
  (Fraunces/Inter/mono-eyebrow, gradient-glow hero, accent-italic word, coordinate labels, 01–05).
  **Keep the HTML structure and copy; reset the visual layer** against the chosen reference (§4).
- `site/css/style.css` — design-token + section system is a fine architecture; the *aesthetic values*
  (fonts, the hero gradient, ornaments) are to be replaced, not preserved.
- `site/js/main.js` — nav toggle, header scroll state, reduced-motion-aware reveal. Fine to keep.

---

## 6. Site map & build order

Pages (reuse one shared design system): **Home · Services · Industries · Case Studies · About ·
Insights · Contact.**

- **Home** (built, needs restyle): Hero → Why-Navex (the wedge) → Our edge (team track-record stats)
  → What we do (5 services) → Proof (one engagement) → Who we serve → CTA → Footer.
- **Services:** 5 services as clean cards + a 4-step "delivery approach" (this *is* a real sequence,
  so numbering is honest here) → each service links to a case study.
- **Industries:** sector pages — Maritime & Shipping · Marine Services · Port & Terminal Logistics ·
  Transport & Freight · Infrastructure-Adjacent.
- **Case Studies (highest-value gap):** team track-record stat band + 2–3 anonymized engagements in
  *Situation → Role → Result* format + (if available) a testimonial. All "prior to Navex."
- **About:** team + founder bio (real photo) + values as an icon grid (not over a photo).
- **Insights:** card grid; seed with 2–3 real "maritime PE" posts (not an empty blog).
- **Contact:** form with Name · Company · Job Title · Email · Message. (Delete any leftover
  "venture capitalist / entrepreneurial journey" copy — wrong audience.)

The 5 services (lead with the differentiators — DD, value creation, interim — first):
Commercial & Operational Due Diligence · Value Creation & Growth Planning · Board & Interim
Leadership · Strategic Advisory for PE Firms · Investment Readiness for Owners.

---

## 7. Assets still needed from the client
- **Reference site(s)** they love (drives the whole visual direction — §4c).
- **Real maritime photography** (or budget to license).
- **Real (anonymized) engagement details + a testimonial** for Case Studies (the #1 credibility gap).
- **A chosen/licensed typeface** (optional but high-impact).

---

## 8. Deeper context (read these)
- `/docs/02_competitor_web_analysis_TR.md` — 7 competitors' web/design/proof patterns (what to borrow).
- `/docs/03_master_build_plan_TR.md` — full page-by-page build plan, sequencing, asset plan.
- `/docs/04_visual_logo_brief_TR.md` — palette/logo brief (note: its earlier font picks, e.g. Cormorant,
  are now superseded by §4 here — avoid the AI-cliché fonts).
- *(Docs 02–04 are in Turkish; the client's working language. This brief and the agent files are in English.)*
