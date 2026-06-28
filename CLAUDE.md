# CLAUDE.md — Navex Capital website

**Read `docs/00_DESIGN_DIRECTION.md` in full before writing or restyling anything.**
Then skim `docs/02`, `docs/03`, `docs/04` for deeper context.

## Project
Custom-coded marketing site for **Navex Capital** — operator-led advisory for maritime, transport &
logistics PE deals (sub-$200M). Plain HTML + CSS + vanilla JS, **no build step**.
Wedge: *"We advise on the deal — and help run the business after."*

## Run / preview
No build step. Open `site/index.html` directly, or serve statically:
`cd site && python3 -m http.server 8000` → http://localhost:8000

## Hard rules
- **Realism rule:** never "Navex did X." All track record = *"our founding team's experience, prior to
  Navex."* Soften unverified claims. No generic-consultant language.
- **Voice:** English, operator-led, honest, owner-centric.
- **Brand:** navy `#1B2150` primary · gold `#C2A063` **accent only, never a background** · backgrounds
  white / light-gray / navy. Keep the trident mark.
- **Quality floor:** responsive, keyboard focus, `prefers-reduced-motion`, content visible without JS.
- **Do not** copy competitor code/fonts/identity.

## The actual job: don't look AI-generated
The previous styling was rejected for looking AI-made. **Avoid the AI tells** (see `docs/00` §4a):
Fraunces / Cormorant / Playfair / Inter / Space Grotesk; **mono-eyebrow labels**; accent-italic
emphasized word; corner-glow gradient hero; decorative coordinate labels; 01/02/03 decorative cards;
the cream-serif-terracotta / near-black-acid / broadsheet-hairline default looks.
**Fix it by:** (1) real photography, (2) a typeface chosen *against the client's reference site*,
(3) restraint, (4) specific proof. **Anchor to the client's reference — do not generate blind variations.**
If no reference has been provided, **ask the client for it before restyling.**

## Repo
- `site/index.html` — Home. **HTML structure + copy are good; reuse them.** The CSS aesthetic is the
  rejected pass — **reset the visual layer** (fonts, hero, ornaments) against the reference.
- `site/css/style.css` — token/section architecture OK; aesthetic values to be replaced.
- `site/js/main.js` — fine to keep.

## Build order
Home (restyle) → Case Studies (highest-value gap) → Services → Industries → About → Insights → Contact.
Full plan in `docs/03`.

## Coordinating with another agent (Codex)
This repo may be worked by Codex in parallel (it reads `AGENTS.md`, which mirrors this file). Use git;
prefer separate branches or separate pages per agent to avoid conflicts. `docs/00` is the shared source
of truth — keep both agent files pointing to it; do not let the two diverge.
