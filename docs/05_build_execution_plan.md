# Navex Capital — Sıfırdan İnşa & Yürütme Planı (Foto-First)

> **Bu dokümanın işi:** docs/00 (yön) + docs/02 (rakip) + docs/03 (master plan) + docs/04 (logo/palet)
> dokümanlarını, *gerçekten uygulanacak* adım-adım bir inşa planına çevirmek. Önceki 4 tasarım
> denemesi reddedildi; bu plan **neden reddedildiklerini kök nedene indirip** onu çözmek üzerine kurulu.
> Dil: iç çalışma Türkçe; site copy'si İngilizce.

---

## 0. Kök neden: neden önceki 4 deneme "AI yapımı" göründü?

Reddedilen denemeleri tek tek incelediğimde ortak payda net:

1. **Hepsi fotoğrafsızdı.** Hero ve bölümler CSS gradient / SVG silüet / "batimetri çizgisi" gibi
   *sentetik* görsellerle doldurulmuştu. Gerçek finans/maritime sitelerinin premium hissi büyük
   ölçüde **gerçek, özgül fotoğraftan** gelir. docs/00 §4b bunu "en büyük tek kaldıraç" diyor.
2. **AI-klişe font üçlüsü:** Fraunces + Inter + mono-eyebrow. Bu kombinasyon şu an "model üretti"
   sinyalinin kendisi.
3. **Süs enflasyonu:** koordinat etiketleri (12°/24°), accent-italic vurgulu kelime, köşe-glow
   gradient hero, 01–05 numaralı kartlar, ◆ bullet'lar. Tek tek "konsept", toplamı "AI klişesi".

Mevcut [`site/css/style.css`](../site/css/style.css) **tam olarak bu reddedilen pass** — yani elimizde
"ne yapılMAYacağının" birebir kod örneği var. Bu bir avantaj: kaçınılacak her şey önümüzde.

**Sonuç:** Araç (Claude Code'a geçmek) tek başına çözmez; **girdileri** değiştireceğiz. Bu planın
tamamı 4 kaldıraç üzerine kurulu (docs/00 §4b sırasıyla):

| # | Kaldıraç | Bu planda nasıl uyguluyoruz |
|---|---|---|
| 1 | **Gerçek fotoğraf** | İLK adım. `site/assets/`'e gerçek maritime foto seti; hero ve bölümler foto etrafında kurulur (placeholder değil). |
| 2 | **Bakış açısı olan font** | AI-klişe üçlüsü atılır; sade, kurumsal, "gerçek firma" hissi veren bir pairing. Foto'lu hero üstünde kilitlenir. |
| 3 | **Sadelik (restraint)** | Tüm süsler sökülür. Cesaret tek yere harcanır (hero foto). Geri kalan disiplinli. |
| 4 | **Özgül içerik/proof** | Mevcut güçlü copy korunur; Harun'un anonim engagement'ları proof olarak girer. |

---

## 1. Anchor (referans) sorununu nasıl çözüyoruz

docs/00 "sıfırdan üretme, bir referansa doğru tasarla" diyor. Sen referans verme yasağını kaldırdın
("boşver, sen bil"). O zaman **kendi rakip analizimizi anchor olarak kullanıyoruz** — bu körlemesine
üretim değil; senin zaten beğendiğin somut sitelere yaslanmak:

- **Sadelik & zemin ritmi:** Pareto / Carter Morse → açık zemin hâkim, tek aksan, sessiz.
- **Fotoğraf dili:** Mercator → soyut stok değil, **sahadaki gerçek operatör/terminal** görselleri.
- **Proof formatı:** Carter Morse "by the numbers" bandı + Marsoft "ihtiyaç→rol→ölçülebilir sonuç".
- **Ton:** Poten ("advising with honesty") + Carter Morse sıcaklığı.

Yani estetik anchor = **"Pareto'nun disiplini + Mercator'ın gerçek-operatör fotoğrafı + Carter Morse'un proof'u."**
Bu plan boyunca her tasarım kararı bu üçüne karşı test edilir.

> **KİLİTLİ HİS (Salih kararı):** "Sade modern kurumsal" — **Pareto/EQT** hissi: **sans-dominant**
> tipografi, **beyaz hâkim** zemin, **neredeyse sıfır süs**, **fotoğraf ön planda**. En "ciddi kurum"
> ucu. Tüm §3 tasarım sistemi buna göre.

---

## 2. Palet & marka (GÜNCELLENDİ — müşteri kararı, 2026-06-27)

> **Önemli sapma:** Salih, eski logonun **navy+gold** sabitini bilinçli olarak kaldırdı — "logo beni
> yanıltıyor, AI/template hissi büyük ölçüde gold'dan geliyor. Sektöre + rakiplere göre, logodan
> bağımsız yeni palet seç." Bu, docs/00 §2 "brand constants" kuralını **geçersiz kılar** (sahip onayı).
> CLAUDE.md / docs/00 hâlâ eski kuralı yazıyor — iki agent da okuduğu için **güncellenmeli** (bkz. §11).

**Yeni palet — "Ink & Tide"** (maritime "derin su" tınısı, generic navy değil; EQT/Pareto sınıfı):
- **Ink (primary)** `#16252B` — derin petrol-charcoal. Koyu bölümler, footer, başlıklar.
- **Ink-deep** `#0F1B20` — CTA band.
- **Accent (teal)** `#1C7A6E` (+ hover/on-dark `#41A293`) — gold'un yerine; link, küçük mark, trident, tek buton. Asla zemin.
- **Zemin:** beyaz `#FFFFFF` hâkim / soğuk kırık-beyaz `#F0F2F1`. Açık↔ink alternatif.
- **Text** `#222B2E` · **Muted** `#5A6669` · **Line** `#E1E4E3`.
- **Mark:** trident korunuyor, rengi teal (gold değil).

Mavi blue-hour foto'larla uyumlu; gold'un metalik-lüks klişesi tamamen çıktı.

---

## 3. Global tasarım sistemi (kod seviyesinde net)

### 3.1 Tipografi — sans-dominant, AI üçlüsünü söküyoruz
Kilitli his "sade modern kurumsal" → **sans-dominant** (serif başlık yok). Tek güçlü grotesk aile,
disiplinli ağırlıklarla; "ciddi Nordic kurum" hissi.
- **AT:** Fraunces, Inter, Spline Sans Mono — ve Space Grotesk/Manrope. **Mono fontu tamamen kaldır.**
- **ÖNERİ (foto'lu hero üstünde kilitlenecek):**
  - **SEÇİLDİ:** tek aile **Hanken Grotesk** — sıcak humanist grotesk; operatör/owner-centric sese
    uygun, ciddi kalırken AI-klişe değil (Schibsted Grotesk'ten geçildi; müşteri "font'u da sektöre
    göre ayarla" dedi). Inter/Space Grotesk/Fraunces değil.
  - Alternatif: Schibsted Grotesk / Public Sans.
- **Kural:** tek aile; hiyerarşi ağırlık + boyutla (H1 ~clamp 3rem, H2 ~2rem, body 16–18px, line-height 1.6).
  Harf-aralığı fetişi yok (wide-tracking uppercase eyebrow YOK).
- **Not:** Font, foto girince **5 dakikalık bir swap.** Soyut mockup üstünde font tartışması (önceki
  döngünün hatası) yapmıyoruz — gerçek foto'lu hero'da görüp kilitliyoruz.

### 3.2 Renk & zemin ritmi — beyaz hâkim
- Token'lar §2'deki gibi. Mevcut CSS token mimarisi iyi — değerleri/rolleri koruyup süsleri çıkarıyoruz.
- **Beyaz/açık-gri hâkim** (Pareto/EQT); navy **seyrek** kullanılır — vurgu/proof bölümü ve footer.
  Foto'lar kontrastı taşır, navy bloklar değil.
- **Home zemin ritmi:** Hero (foto + koyu overlay) → Why Navex (beyaz) → Our edge (açık gri) →
  What we do (beyaz) → Proof (tek navy bölüm — vurgu) → Who we serve (beyaz) → CTA (navy-deep) →
  Footer (navy). Altın hiçbir blokta zemin değil; sadece ince aksan.

### 3.3 Bileşenler — süs sökme listesi
| Bileşen | Şu an (AI tell) | Yeni |
|---|---|---|
| Eyebrow | mono + `.22em` tracking + alt çizgi | Kaldır; ya da gövde fontunda küçük, sade etiket (tracking yok) |
| Hero başlık | `<em>` altın italik kelime | Düz başlık, vurgu yok |
| Hero zemin | radial corner-glow gradient | **Gerçek foto** + düz koyu navy overlay (okunurluk için) |
| Hero süs | batimetri SVG + 12°/24°/36° | Kaldır |
| Hero meta | ◆ diamond bullet'lı satır | Kaldır ya da sade ayraçlı ( · ) tek satır |
| Service card | `01–05` mono index | İndex kaldır; sade ikon + başlık + metin |
| Stat band | altın `+`/`$` vurgu + ince çizgi grid | Sade rakam + tek hairline; gösterişsiz |
| Genel | mono caption'lar | Hepsi gövde fontuna |

### 3.4 Butonlar / linkler
- Primary: navy dolu, beyaz metin. Secondary: ince kenarlı, hover'da dolar. Inline link: navy + altın
  hover alt-çizgi. "See how this works" tarz linkler sade — uppercase-mono değil.

### 3.5 Erişilebilirlik & kalite tabanı (docs/00 §3.4 — pazarlık yok)
- Mobil responsive; görünür klavye focus; `prefers-reduced-motion`; **JS'siz içerik görünür**
  (animasyon yalnız progressive enhancement). Mevcut [`js/main.js`](../site/js/main.js) bunu zaten
  doğru yapıyor — koru.

---

## 4. Fotoğraf planı (planın bel kemiği — İLK iş)

### 4.1 Kaynak & lisans
- **Ücretsiz, ticari kullanım, attribution-suz ideal:** Unsplash, Pexels.
- **İndirme:** Claude Code'dan `curl` ile `site/assets/`'e çekmeyi deneyeceğim. Sandbox ağı engellerse
  → sen 5–6 fotoyu indirip `site/assets/`'e bırak (Mac'te 2 dk); ben yerleştiririm.
- İleride en güçlüsü: Harun'un **gerçek saha/operatör** fotoğrafları.

### 4.2 Shot list (sayfa → görsel)
- **Home hero:** gece konteyner limanı (aydınlık vinçler) **veya** açık denizde konteyner gemisi aerial. Dramatik, özgül.
- **Why Navex / wedge:** terminalde hi-vis operatör / saha operasyonu ("biz bu işin içindeydik").
- **Services delivery:** konteyner gemisi top-down aerial (eski sitede beğenilen ton).
- **Industries (sektör başına 1):** shipping (gemi), marine services (römorkör/tug), port & terminal
  (vinç/terminal), transport & freight (kamyon/intermodal), infrastructure (köprü/liman altyapısı).
- **About:** Harun'un gerçek fotoğrafı (mevcut, koru).
- **Insights:** yazı başına 1 maritime görsel.

### 4.3 İşleme (tutarlılık)
- Tam-genişlik / temiz dikdörtgen. **Oval/elips kırpma yasak** (docs/04 §4).
- Hafif navy tonlama/overlay ile marka birliği; başlık okunurluğu için koyu gradient.
- Dosya adları: `assets/hero-port-night.jpg`, `assets/ind-shipping.jpg` … (anlamlı, kebab-case).
- Web boyutu optimize (uzun kenar ~2000px, sıkıştırılmış).

---

## 5. Anti-AI kontrol listesi (her commit'te geçilecek)

Her sayfa "bitti" demeden önce:
- [ ] Fraunces/Inter/Cormorant/Playfair/Space Grotesk/Manrope **yok**; mono font **yok**.
- [ ] Mono-eyebrow / wide-tracking uppercase etiket **yok**.
- [ ] Accent-italic vurgulu kelime **yok**.
- [ ] Corner-glow gradient hero **yok** — yerinde gerçek foto var.
- [ ] Koordinat/dekoratif tema süsü **yok**.
- [ ] 01/02/03 dekoratif numara **yok**; ◆/✦ bullet **yok**.
- [ ] Altın hiçbir yerde zemin bloğu değil.
- [ ] En az 1 gerçek fotoğraf bölümü taşıyor (sentetik değil).
- [ ] Realizm kuralı: tüm track record "founding team's experience, prior to Navex".
- [ ] JS kapalıyken içerik görünür; klavye focus görünür; reduced-motion saygılı.

---

## 6. Sayfa sayfa inşa spesifikasyonu

> Mevcut [`index.html`](../site/index.html) **yapısı ve copy'si iyi → tekrar kullan.** Diğer sayfalar
> aynı tasarım sistemini paylaşacak. Copy'nin büyük kısmı docs/03 §5'te ve mevcut HTML'de hazır.

### 6.1 Home (restyle — build order #1)
Bölümler (docs/03 §5.1): Hero → Why Navex (wedge) → Our edge (stats) → What we do (5 servis) →
Proof (1 engagement) → Who we serve → CTA → Footer.
- HTML/copy büyük ölçüde duruyor; **görsel katman sıfırlanıyor** (§3 + §4 + §5).
- Hero = gerçek foto + düz overlay + düz başlık ("...where most advisors stop short" — italik/altın vurgu YOK).
- Service grid'den `01–05` index'leri ve mono link stilini çıkar.

### 6.2 Case Studies (YENİ — #1 eksik, build order #2)
docs/03 §5.4: Başlık + çerçeve → **rakam bandı** (`25+ Years · 7 PE Sponsors · 5 Exits · 10+ Bolt-ons`,
etiket "founding team's operator track record") → **2–3 anonim engagement** (Marsoft formatı:
Situation → Role → Result) → testimonial (varsa) → CTA.
- **[HARUN gerekli]:** gerçek vaka detayları + testimonial izni. O gelene kadar mevcut "~10% EBITDA
  uplift" iskeletini + 2 placeholder vaka ile kurarım, etiketlerini netleştiririz.

### 6.3 Services (build order #3)
docs/03 §5.2: Başlık + tek güçlü çerçeve cümlesi → 5 servis **ikon-kart** grid (Carter Morse tarzı;
oval foto YOK) → **"Our delivery approach"** 4 adımlı navy bölüm (gerçek bir sıra olduğu için numara
burada dürüst) → CTA. Her servis → ilgili case study'ye link (Mercator "VIEW PROJECTS" mantığı).

### 6.4 Industries (build order #4)
docs/03 §5.3: Koyu hero → sektör grid (5 sektör, her biri dikdörtgen gerçek foto + 2–3 cümle) →
"Why it matters" navy → CTA. Core Values'ı buraya koyMA (About'a gider).

### 6.5 About (build order #5)
docs/03 §5.5: Who we are / Mission / Vision → **Core Values = ikon grid** (foto üstünde değil) →
Why Navex (wedge tekrar) → Meet the founder (Harun gerçek foto + bio; board/interim geçmişi görünür —
AMA board-seat güven sinyali) → CTA.

### 6.6 Insights (build order #6)
docs/03 §5.6: Başlık → kart grid (foto + başlık + 2 satır + Read more). **Boş bırakma:** 2–3 gerçek
"maritime PE insight" yazısı. **[BEN+HARUN]** ilk yazılar.

### 6.7 Contact (build order #7)
docs/03 §5.7: Başlık + tek cümle → form (Name · Company · Job Title · Email · Message) → iletişim
bilgisi. **ACİL:** "esteemed venture capitalists / entrepreneurial journey" template kalıntısı varsa
sil (yanlış kitle).

---

## 7. Proof sistemi (docs/03 §6 — #1 kredibilite açığı)
- **(a) Rakam bandı:** `25+ Years · 7 PE Sponsors · 5 Exits · 10+ Bolt-ons` — etiket "our founding
  team's operator track record" (firmanın değil).
- **(b) Anonim engagement kartları (2–3):** Situation → Role → Result, tek paragraf, ölçülebilir
  sonuç, "prior to Navex". Harun'un vakaları: interim leadership/EBITDA uplift, bolt-on entegrasyon,
  exit hazırlığı.
- **(c) Testimonial:** mümkünse izinli, isim + ünvan.
- Hepsi realizm kuralıyla yumuşatılmış; doğrulanamayan rakam yok.

---

## 8. Teknik / SEO / performans
- Build step yok; düz HTML+CSS+JS. `cd site && python3 -m http.server 8000`.
- Her sayfa: `<title>` + meta description. Sade trident favicon.
- Görseller optimize (web boyutu); hero foto lazy değil (above-the-fold) ama sıkıştırılmış.
- Form: çalışır, `info@navexcapital.com`'a düşer (statik site → Formspree/Netlify Forms gibi; build'de kararlaştırırız).
- Footer: Client Sectors + iletişim + LinkedIn (mevcut yapı iyi).

---

## 9. Codex ile koordinasyon (iki agent paralel)
- Git şart. Ayrı branch ya da **agent başına ayrı sayfa** (ör. Claude → Home + Services + Case Studies;
  Codex → Industries + About + Insights + Contact). docs/00 ortak doğruluk kaynağı.
- **Not:** repo şu an git değil. İlk adımlardan biri `git init` (paralel çalışma için).

---

## 10. Yürütme yol haritası (adım adım — her adım gözden geçirilebilir)

**Faz 0 — Hazırlık**
1. `git init` + ilk commit (mevcut hâli sabitle).
2. **Gerçek foto setini `assets/`'e indir** (§4). *Bu en kritik adım — döngüyü kıran şey.*

**Faz 1 — Home restyle (foto-first)**
3. Tasarım sistemini sıfırla: font swap (§3.1), süs sökme (§3.3/§5), gerçek foto'lu hero.
4. **DUR & GÖZDEN GEÇİR:** artık gerçek foto'lu, süssüz bir Home var. Burada font'u kilitliyoruz,
   yönü onaylıyorsun. (Önceki döngünün kırıldığı nokta tam burası.)

**Faz 2 — Proof (en kritik eksik)**
5. Case Studies sayfası (§6.2). Harun'un vaka girdisi paralelde.

**Faz 3 — Kalan sayfalar (kilitli sistemi tekrarla)**
6. Services → 7. Industries → 8. About → 9. Insights → 10. Contact.

**Faz 4 — Cila**
11. Meta/SEO/favicon, form, mobil/performans, son anti-AI checklist geçişi (§5), erişilebilirlik.

---

## 11. Senden gereken girdiler
- **Foto:** ya ben Unsplash/Pexels'ten çekerim (ağ açıksa), ya sen 5–6 foto bırakırsın (§4.1).
- **[HARUN]:** Case Studies için gerçek anonim vaka detayları + testimonial izni (#1 açık).
- **Font:** önerimi (**Schibsted Grotesk**, tek aile sans-dominant) foto'lu hero'da görüp onayla/değiştir — soyut tartışma yok.
- **Insights:** ilk 2–3 yazı için konu onayı.

---

## 12. İlk hamle
Faz 0 + Faz 1 step 3'e kadar tek oturumda gidebiliriz: git init → foto indir → Home'u foto-first sıfırla →
sana gerçek foto'lu, süssüz Home'u göster. **Asıl test orada:** gerçek fotoğrafla beraber görünce
"AI yapımı" hissinin gidip gitmediğini ilk kez adil biçimde değerlendirebileceğiz.
