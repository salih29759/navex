# Navex Capital — Build Package

Bu klasör, Navex web sitesini **Claude Code ve Codex ile (aynı anda)** kurmak için hazırlanmış
tam devir paketidir. İkisi de açılışta kendi talimat dosyasını okur ve bağlamı otomatik alır.

## İçerik
```
navex-build/
  CLAUDE.md          → Claude Code otomatik okur (talimat + kurallar)
  AGENTS.md          → Codex otomatik okur (aynı içerik)
  README.md          → bu dosya
  docs/
    00_DESIGN_DIRECTION.md   → EN ÖNEMLİ. AI-görünümünden çıkma yönergesi, kurallar, font/foto.
    02_competitor_web_analysis_TR.md   → 7 rakip web/proof analizi
    03_master_build_plan_TR.md         → sayfa sayfa inşa planı
    04_visual_logo_brief_TR.md         → palet/logo brief
  site/
    index.html, css/, js/, assets/     → başlangıç repo'su (Home kurulu)
```

## Nasıl başlarsın

**Önce:** istersen `git init && git add -A && git commit -m "init"` — iki agent'la çalışırken
branch kullanmak işini kolaylaştırır.

**Claude Code:** bu klasörü aç, sadece şunu yaz:
> "Read CLAUDE.md and docs/00, then let's restyle the Home page against the reference I'll give you."

**Codex:** aynı klasörde, aynı şekilde `AGENTS.md` + `docs/00`'ı okuttur.

## İki agent'ı aynı anda kullanırken
- **Git şart.** Çakışmamak için ya ayrı **branch**, ya da agent başına **ayrı sayfa** ver
  (ör. Claude → Home + Services, Codex → Case Studies + About).
- `docs/00_DESIGN_DIRECTION.md` ikisinin de **ortak doğruluk kaynağı** — yön değişirse orayı güncelle,
  iki agent da oradan beslensin.
- İstersen birini **kurucu**, diğerini **gözden geçiren/críticim** olarak kullan.

## AI-görünümünden çıkmanın anahtarı (özet — detay docs/00 §4)
1. **Gerçek fotoğraf** (`site/assets/`e koy) — en büyük fark.
2. **Beğendiğin bir referans siteye doğru tasarla** — sıfırdan üretme. (Henüz referans vermediysen,
   ilk iş onu ver; agent'a "şuna benzet" de.)
3. Beğendiğin bir **font** (gerekirse lisanslı).
4. **Sadelik** + gerçek proof.

> Mevcut `site/` koddaki HTML yapısı ve metin iyi, tekrar kullan; ama CSS'teki **görsel dil
> (font/hero/süsler) reddedilen AI-pass'i** — onu referansa göre sıfırla. (Bkz. docs/00 §5.)
