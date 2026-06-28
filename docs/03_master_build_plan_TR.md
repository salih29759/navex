# Navex Capital — Web Sitesi Master İnşa Planı

*Siteyi sıfırdan keskinleştirip bitirene kadar izleyeceğimiz tek yol haritası. İki dosyanın üstüne kurulur: **Tasarım Yönü & Logo Brief** (kabuk nasıl görünmeli) + **Genişletilmiş Rakip Web Analizi** (hangi mekanikler kopyalanmalı). Bu doküman onları uygulanabilir, sıralı bir inşa planına çevirir.*

*Dil notu: iç iletişim Türkçe; sitenin kendisi İngilizce (müşteri ABD/AB PE firmaları). Aşağıda web copy örnekleri ve key terms İngilizce.*

---

## 0. Bu plan nasıl çalışır

İki katman var:

- **Plan (bu doküman):** ne, nerede, nasıl, hangi sırayla. Bir kez kuruyoruz, referans kalıyor.
- **Yürütme (sonraki oturumlar):** Bölüm 10'daki sırayla adım adım üretip uyguluyoruz. Her adım küçük ve gözden geçirilebilir.

Üç tür iş var, plan boyunca etiketliyorum:
- **[BEN]** — Claude üretir (copy, yapı, görsel spec, proof taslakları, mockup).
- **[ESRA]** — Squarespace'te uygular (veya hangi ortama karar verirsek).
- **[HARUN]** — sadece Harun'un sağlayabileceği girdi (gerçek engagement detayları, testimonial izni, board geçmişi onayı).

---

## 1. İnşa felsefesi & yöntem

Harun'un sıralama felsefesi yönetir: **housekeeping → web kabuğu → proof → lead gen.** "Overengineer etme, base'i sağlam kur."

Üç ilke:
1. **İçerik zaten büyük ölçüde var.** Services/Industries/About sayfalarındaki metin güçlü. Sıfırdan yazmıyoruz; topluyor, İngilizce'yi keskinleştiriyor, doğru kabuğa ve proof'a bağlıyoruz.
2. **Gerçekçilik kuralı (Salih kuralı, taviz yok).** Navex yeni kurulan, ilk deal'ını yapmak üzere bir butik. Hiçbir şey "Navex yaptı" diye sunulamaz — her track record "ekibimizin operatör geçmişi" / "prior to Navex" çerçevesinde. Doğrulanamayan iddia yumuşatılır ("genelde", "büyük ölçüde"). Generalist-consultant dili yok, insani ses var.
3. **Küçük, gözden geçirilebilir adımlar.** Her oturumda bir sayfa veya bir sistem; sen onaylarsın, devam ederiz.

---

## 2. İnşa ortamı kararı (kilitlenecek tek şey)

Önceki karar: **Squarespace'te kal, sıfırdan kodlama/Claude Code'a geçme.** Bu hâlâ doğru — Harun'un felsefesine uyuyor, hızlı, bakım yükü yok, Esra uygulayıcı, maliyet düşük.

Ama "sıfırdan bitirelim" demen iki yolu açıyor. Önerim, ikisinin en iyisini alan bir orta yol:

- **Canlı site → Squarespace** (önceki karar korunur; Esra uygular, bakım kolay).
- **[BEN] kodlu referans mockup → hedef görseli** olarak ben gerçek bir HTML prototip üretirim; Esra onu Squarespace'te birebir aynalar.

**Neden bu yol:** Hem canlı stack'i overengineer etmemiş oluruz (Harun memnun), hem de "şuna benzeyecek" diye tahmine bırakmadan elimizde somut, tıklanabilir bir hedef olur. Mockup pazarlık payını sıfırlar.

> **Karar gerekiyor:** (A) Sadece Squarespace planı + Esra'ya spec/copy (mockup yok), yoksa (B) Önce kodlu referans mockup, sonra Squarespace'e aktarım. Bunu yürütmeye başlarken kilitleyeceğiz (sonda soruyorum).

---

## 3. Site mimarisi & sitemap

### Ana navigasyon (6 sekme — sade tut)
```
Home  |  Services  |  Industries  |  Case Studies  |  About  |  Insights        [Contact ▸ buton]
```
- Contact ayrı bir nav linki değil, sağda **buton** (her sayfada görünür CTA).
- "Case Studies" = 1 numaralı eksiği dolduran yeni sekme.

### Slug planı (default Squarespace slug'larını düzelt)
| Sayfa | Slug |
|---|---|
| Home | `/` |
| Services | `/services` *(şu an `/home-1-1` — düzelt)* |
| Industries | `/industries` |
| Case Studies | `/case-studies` |
| About | `/about` |
| Insights | `/insights` *(şu an `/blog-1-1` — düzelt)* |
| Contact | `/contact` |

### Footer (Mercator + Carter Morse modeli — her sayfada, lacivert)
- Sol: logo (açık-zemin versiyonu) + tek cümle konumlanma.
- Orta: hızlı linkler (sayfalar) + **Client Sectors** listesi.
- Sağ: Location + Contact (mevcut: 2645 Edgewater Drive, Weston FL; +1 786-717-2128; info@navexcapital.com) + LinkedIn.
- Alt şerit: Terms of Service · © Navex Capital 2026.

---

## 4. Global tasarım sistemi

Tüm sayfalarda aynı. (Brief'ten gelir, burada inşa-için netleştirilmiş.)

### 4.1 Renk paleti
| Rol | Renk | Hex | Kullanım |
|---|---|---|---|
| Primary | Navy | `#1B2150` | Koyu bölümler, footer, başlıklar, ana metin |
| Accent | Gold | `#C2A063` | İnce çizgi, ikon, buton kenarı/hover, trident, küçük vurgu |
| BG 1 | White | `#FFFFFF` | Ana zemin |
| BG 2 | Light gray | `#F4F4F2` | Bölüm ayrımı için hafif gri |
| Text | Navy-gray | `#2A2E45` | Gövde (saf siyah değil) |
| Muted | Gray | `#6B6E80` | Alt başlık, caption |

**Altın kuralı:** altın asla açık/altın zemine metin olarak yazılmaz. Koyu zeminde → metin/grafik olabilir; açık zeminde → sadece çizgi/ikon. *(Kodlar referans; Esra mevcut marka tonlarını ölçüp yakınsayabilir — kritik olan rollerin değişmesi, altının zeminden aksana inmesi.)*

### 4.2 Tipografi
- **Başlıklar (H1–H3):** zarif serif — **Cormorant Garamond** veya **Marcellus** (Squarespace'te var). Premium-sakin.
- **Gövde:** temiz sans — **Inter** / **Source Sans** / **Karla**.
- **Kural:** başlık serif, gövde sans; karıştırma. Gövde 16–18px, satır yüksekliği 1.6.
- **Hiyerarşi:** H1 (hero) ~48–60px · H2 (bölüm) ~32–40px · H3 (kart başlığı) ~20–24px · body ~17px · caption ~14px.

### 4.3 Zemin ritmi & layout
- **Zemin ritmi:** koyu → açık → koyu sırayla. Altın koca blok **yok**.
- **Grid:** 12-kolon, geniş kenar boşluğu (içerik max ~1200px ortalanmış).
- **Whitespace:** cömert; bölümler arası nefes payı. Carter Morse/Marsoft gibi ferah.
- **Bölüm yüksekliği:** her bölüm tek bir fikir; sıkıştırma.

### 4.4 Butonlar & linkler
- **Primary buton:** lacivert dolu, beyaz metin (örn. "Get in touch").
- **Secondary buton:** şeffaf, altın/lacivert ince kenar, hover'da dolar.
- **Inline link:** lacivert metin, altın alt-çizgi hover.
- "VIEW PROJECTS" mantığı: servis/sektör → ilgili case study'ye link.

### 4.5 İkonografi
- **Stil:** ince çizgi (line) ikon, tek renk (lacivert veya altın). Carter Morse "Other Services" kartlarındaki gibi.
- **Set:** tutarlı tek aile (örn. Lucide / Feather tarzı). Dolu/renkli ikon karıştırma.
- Kullanım: servis kartları, core values, delivery approach adımları.

### 4.6 Görsel kuralları
- **Oval/elips kırpma tamamen yasak.** Tam genişlik (full-bleed) veya temiz dikdörtgen.
- **Otantik maritime, soyut stok değil:** limanlar, konteyner gemileri, terminal, tersane, köprü üstü, offshore. Gece liman hero'su ve konteyner gemisi aerial'ı doğru ton — bunları çoğalt. Glass-building/bokeh stoklardan uzak.
- **İnsan/operatör görseli değerli:** hi-vis yelekli saha operatörü "biz bu işin içindeydik" hissi verir (Mercator dersi).
- **Tutarlı işleme:** hafif lacivert tonlama/overlay ile marka birliği; başlık okunurluğu için koyu gradient.

### 4.7 Video & motion politikası
- **Hero:** opsiyonel sessiz, loop, hafif **konteyner gemisi / liman video** arka planı (8–12 sn, otomatik oynar, kontrolsüz). Yoksa yüksek kaliteli statik foto — ikisi de iyi. *(Overengineer etme: video performansı düşürürse statik kal.)*
- **Mikro-animasyon:** scroll'da hafif fade-in; abartı yok. Hız ve sakinlik önemli.
- **Otomatik ses yok, otomatik popup yok.**

---

## 5. Sayfa sayfa blueprint

Her sayfa için: amaç · bölümler (sırayla) · copy planı · görsel/asset · proof · CTA.

### 5.1 HOME
**Amaç:** 10 saniyede "ne yapıyoruz + neden farklıyız + kanıt" ver, Contact'a it.

Bölümler (sırayla):
1. **Hero** *(koyu)* — gece liman foto/video. **[mevcut, güçlü, koru]**
   - H1: *"Unlocking long-term value for private equity firms and business owners in the maritime, transport, and logistics sectors."*
   - Alt: *"Navigate with insight. Execute with precision."*
   - CTA butonu: "Get in touch".
2. **Why Navex / wedge** *(açık zemin — YENİ, en kritik mesaj)* — tek güçlü cümle + 3 destek noktası.
   - Mesaj: *"We advise on the deal — and help run the business after."* (Yedi rakipte olmayan tek şey.)
   - 3 nokta: Operator-led · PE-fluent · From diligence to value creation.
3. **Our edge** *(lacivert — mevcut, güçlü, koru)* — altın trident + 5 edge bullet (25+ yrs, 7 PE sponsors, 5 exits, 10+ bolt-ons, >$1bn EV — **"our team's" çerçevesinde**). [BEN: etiketi "our founding team's operator track record" yap.]
4. **What we do** *(açık zemin — altından beyaza çevir)* — 5 servis, her biri ikon + başlık + **1-2 cümle** + Services'e link. (Şu an sadece foto+başlık; açıklama ekle.)
5. **Proof bandı** *(lacivert — YENİ)* — "Our team's track record" rakam bandı + 1-2 anonim engagement kartı + "See case studies" linki. (Bölüm 6.)
6. **Who we serve** *(açık zemin)* — PE sponsors / business owners / lenders — kısa.
7. **Footer** *(lacivert).*

Görsel: hero (gece liman) · what-we-do ikonları · proof bandı sade lacivert · 1 destekleyici maritime foto.
CTA: hero + footer "Get in touch".

### 5.2 SERVICES
**Amaç:** 5 servisi net göster, her birini proof'a bağla, delivery approach'u öne çıkar.

Bölümler:
1. **Başlık + çerçeve** *(açık)* — "How we help" + Mercator tarzı tek güçlü açılış cümlesi.
   - Mevcut güçlü çerçeve: *"Navex Capital delivers tailored strategic advisory and investment consulting... across the full investment lifecycle."*
2. **5 servis = ikon-kart grid** *(beyaz — oval fotoları KALDIR, Carter Morse ikon-kartına çevir)*:
   - Strategic Advisory for PE Firms
   - Investment Readiness for Business Owners
   - Commercial & Operational Due Diligence
   - Value Creation & Growth Planning
   - Board Representation & Interim Leadership
   - Her kart: line-icon + başlık + mevcut güçlü gövde metni + "See how this works ▸" (case study linki — Mercator mantığı).
3. **Our delivery approach** *(lacivert — MEVCUT, MÜKEMMEL, DOKUNMA)* — 4 numaralı adım + konteyner gemisi aerial.
4. **CTA** *(açık)* — "Discuss your situation".

Görsel: konteyner gemisi aerial (mevcut, koru) · servis ikonları. **Oval glass-building stokları sil.**
Proof: her servis → case study linki.

### 5.3 INDUSTRIES
**Amaç:** sektör derinliğini göster (McLean sektör-grup mimarisi).

Bölümler:
1. **Başlık + hero** *(koyu — offshore rig foto mevcut, iyi)*.
2. **Sektör grid** *(açık zemin — altın zemini beyaza çevir, dikdörtgen görseller)* — her biri başlık + 2-3 cümle (içerik mevcut):
   - Maritime & Shipping · Marine Services · Port & Terminal Logistics · Transport & Freight · Infrastructure-Adjacent Services
3. **Why it matters** *(lacivert)* — mevcut metin ("capital-intensive, operationally nuanced sectors are often mispriced...").
4. **CTA.**

Görsel: her sektör için 1 otantik maritime dikdörtgen foto. **Core Values'ı buraya değil About'a, fotoğraf üstünden kaldırarak.**

### 5.4 CASE STUDIES *(YENİ — 1 numaralı eksik)*
**Amaç:** proof. "Söylüyoruz" yerine "yaptık" (ekip çerçevesinde).

Bölümler:
1. **Başlık + çerçeve** *(açık)* — *"Our team's track record"* + gerçekçilik notu: bu vakalar kurucu ekibin Navex öncesi operatör deneyimi.
2. **Rakam bandı** *(lacivert — Carter Morse "by the Numbers" formatı)*: `25+ Years · 7 PE Sponsors · 5 Exits · 10+ Bolt-ons`.
3. **Engagement kartları** *(beyaz/açık — Marsoft formatı: ihtiyaç → rol → ölçülebilir sonuç)* — 2-3 anonim vaka (Bölüm 6).
4. **Testimonial** *(varsa — lacivert, isim/ünvanla)*.
5. **CTA** — "Bring us your next deal".

Görsel: sade; rakamlar ve metin öne çıksın. İsteğe bağlı anonim sektör görselleri.
[HARUN]: gerçek vaka detayları + testimonial izni.

### 5.5 ABOUT / TEAM
**Amaç:** güven; operatör kimliği; Harun'un geçmişi (AMA board-seat mantığı).

Bölümler:
1. **Who we are / Mission / Vision** *(açık zemin — altın zemini çevir)* — mevcut metin.
2. **Core Values** *(beyaz — ikon grid, FOTOĞRAF ÜSTÜNDEN KALDIR)* — okunaklı, düz zemin.
3. **Why Navex / Value Proposition** *(lacivert)* — wedge'i tekrar et.
4. **Meet the team / founder** *(açık — Harun gerçek foto + bio, MEVCUT, koru)* — board ve interim CXO geçmişini görünür yap (güven sinyali).
5. **CTA.**

Görsel: Harun foto (mevcut) · değerler için ikonlar (foto değil).

### 5.6 INSIGHTS
**Amaç:** content engine başlangıcı (Poten/Marsoft modeli); boş blog'u doldur.

Bölümler:
1. **Başlık** *(açık)* — "Insights" + tek cümle: data-driven perspectives for investors and operators.
2. **Kart grid** *(beyaz — Mercator News modeli)* — her yazı: görsel + başlık + 2 satır + "Read more".
3. **CTA / newsletter** *(opsiyonel).*

Görsel: yazı başına 1 maritime foto.
[BEN+HARUN]: ilk 2-3 gerçek "maritime PE insight" yazısı (boş bırakma). İleride Claude Code proprietary data hub'a bağlanır.

### 5.7 CONTACT
**Amaç:** lead yakala; sürtünmeyi azalt.

Bölümler:
1. **Başlık + tek cümle** *(açık — altın/oval foto KALDIR)*.
2. **Form** *(beyaz)* — Name · **Company** · **Job Title** · Email · Message (Mercator: Company+Title lead'i niteler).
3. **İletişim bilgisi** — adres, telefon, e-posta, LinkedIn.
4. **ACİL:** mevcut "esteemed venture capitalists / entrepreneurial journey" metnini **tamamen sil** (yanlış kitle, template kalıntısı).

---

## 6. Proof sistemi (detay — 1 numaralı eksik)

Üç bileşen, hepsi gerçekçilik kuralında:

**(a) Rakam bandı** — Carter Morse formatı, dürüst içerik:
`25+ Years · 7 PE Sponsors · 5 Exits · 10+ Bolt-ons` — etiket: *"Our founding team's operator track record"* (firmanın değil).

**(b) Anonim engagement kartları (2-3)** — Marsoft formatı: **Situation → Role → Result**. Örnek iskelet (Harun dolduracak):
> **Interim leadership — maritime services operator (PE-backed)**
> *Situation:* Value-creation phase, margin underperformance.
> *Role:* Stepped in as interim CXO bridging founders, management, and sponsor.
> *Result:* ~10% EBITDA uplift over ~6 months. *(Team engagement, prior to Navex.)*

İkinci/üçüncü vaka adayları (Harun'un gerçek geçmişinden): bolt-on entegrasyon vakası, turnaround/EBITDA iyileştirme, exit hazırlığı. Her biri tek paragraf, ölçülebilir sonuç, "prior to Navex".

**(c) Testimonial (mümkünse)** — Harun'un geçmiş PE sponsoru/CEO'sundan 1-2 alıntı, izinle, isim + ünvan (Carter Morse Dinex modeli).

> Tüm proof "ekibin operatör geçmişi" olarak yumuşatılır. Doğrulanamayan rakam yok. Kaynak gerektiğinde belirtilir.

---

## 7. Asset üretim planı

### 7.1 Görseller
- **Stil:** otantik maritime, dikdörtgen/full-bleed, hafif lacivert tonlama. Oval/glass-building/bokeh **yasak**.
- **Kaynak:** ücretsiz yüksek kalite (Unsplash, Pexels) — "container ship aerial", "port terminal night", "shipyard", "offshore platform", "harbor tug". İleride mümkünse Harun'un gerçek saha/operatör fotoları (en güçlüsü).
- **Lisans:** ticari kullanım serbest kaynaklardan; attribution gerekiyorsa not.
- **Sayfa başına shot list (özet):** Home hero (gece liman) + 1 destek · Services (konteyner aerial, mevcut) · Industries (sektör başına 1: shipping, marine services, port, transport, infrastructure) · Insights (yazı başına 1) · About (Harun, mevcut).
- **[BEN]:** mockup'ta yerleşimi ve tam shot list'i veririm; **[ESRA]:** finalleri yerleştirir.

### 7.2 Logo
- **2 versiyon:** (a) koyu zeminde altın, (b) açık zeminde lacivert. Kontrast sorununu çöz.
- **Sadeleştir:** trident + "NAVEX CAPITAL" koru; gradient/efekt varsa düz tek renge indir.
- **Descriptor:** "Operator-led maritime advisory" (Carter Morse'un "Since 1987" karşılığı — dürüst kimlik sinyali; logoya gömmek şart değil, tagline olur).
- **[ESRA]:** iki versiyon + favicon üretir.

### 7.3 İkon seti
- Tek aile ince-çizgi (Lucide/Feather tarzı), tek renk. 5 servis + 6 core value + 4 delivery adımı için ikon. **[BEN]** önerir, **[ESRA]** uygular.

### 7.4 Video
- Opsiyonel hero loop (konteyner gemisi/liman, sessiz, 8-12 sn). Performans düşürürse statik foto. **[ESRA]** karar/uygulama.

---

## 8. Copy üretim planı

- **Dil:** İngilizce (müşteri ABD/AB PE).
- **Ses:** operatör-liderliğinde, dürüst, owner-merkezli, butik. Poten'in "advising with honesty" + Carter Morse'un sıcaklığı. **Generalist-consultant dili yok** (Big Four glossy değil).
- **Gerçekçilik:** "team's track record", "prior to Navex", yumuşatma ("generally", "largely").
- **Uzunluk:** kısa, net; her bölüm tek fikir. Hero tek cümle; servis 1-2 cümle; case study tek paragraf.
- **Kaynak:** mevcut Services/Industries/About metni güçlü — topla, keskinleştir, yeniden kullan. Sıfırdan yazma.
- **[BEN]** tüm copy'yi üretir; **[HARUN]** proof/testimonial gerçek detaylarını verir.

---

## 9. Teknik & SEO housekeeping

- **Slug'lar:** `/services`, `/insights` (default `/home-1-1`, `/blog-1-1` düzelt).
- **Page titles + meta descriptions:** her sayfa için (örn. "Navex Capital — Operator-led maritime & transport advisory for private equity").
- **Favicon:** sade trident.
- **Mobil:** her bölüm responsive; hero metni mobilde okunur; nav hamburger.
- **Performans:** görseller optimize (web boyutu), hero video hafif veya statik.
- **Form:** çalışır, info@navexcapital.com'a düşer; spam koruması.
- **Analytics:** Google Analytics / Squarespace yerleşik.
- **ACİL fix (hemen):** (1) "esteemed venture capitalists" metnini sil, (2) slug'ları düzelt, (3) logo açık-zemin versiyonu.

---

## 10. Yürütme yol haritası (adım adım — bunu uygulayacağız)

Harun sıralaması: housekeeping → kabuk → proof → lead gen. Önerilen oturum sırası:

**Faz 0 — Acil housekeeping [ESRA, hızlı]**
1. "Esteemed venture capitalists" metnini sil · slug'ları düzelt · logo açık-zemin versiyonu.

**Faz 1 — İskelet & sistem [BEN]**
2. Ortam kararını kilitle (Squarespace-only vs kodlu mockup — Bölüm 2).
3. Sitemap + global tasarım sistemini sonlandır (renk/font/ikon/spacing net).

**Faz 2 — Sayfa sayfa copy + yapı [BEN, sayfa başına bir oturum]**
4. Home copy + bölüm yapısı (hero, why-navex wedge, what-we-do açıklamaları).
5. Services copy + ikon-kart yapısı.
6. Industries copy + sektör grid.
7. About copy + core values ikon grid.
8. Contact copy + form alanları.

**Faz 3 — Proof [BEN + HARUN, en kritik]**
9. Case Studies sayfası: rakam bandı + 2-3 anonim engagement (Harun'un gerçek vakalarından) + testimonial.

**Faz 4 — Content engine [BEN + HARUN]**
10. Insights: ilk 2-3 "maritime PE insight" yazısı.

**Faz 5 — Görsel & uygulama [BEN spec → ESRA uygular]**
11. Tam shot list + ikon set + logo versiyonları → Squarespace'te yerleştirme.
12. Zemin kuralı uygulaması (altın blokları beyaz/açık-griye), oval kırpma temizliği, tipografi standardizasyonu.

**Faz 6 — Cila & yayın [ESRA + kontrol]**
13. Mobil/performans/SEO/meta · form testi · son göz.

*(Eğer kodlu mockup yolunu seçersek, Faz 2-3-5 mockup olarak bende üretilir; Esra Squarespace'te aynalar.)*

---

## 11. Bugün başlıyoruz

Mantıklı ilk hamle iki şeyi kilitlemek: **(1) ortam kararı** (Bölüm 2) ve **(2) hangi fazdan başlayacağımız.** İkisi netleşince sıradaki oturumda doğrudan üretime gireriz.

İçeriğin büyük kısmı zaten var; bu yüzden hızlı ilerleyeceğiz. Tahmini: copy fazları (4-8) birkaç oturumda biter, proof (9) Harun'un girdisine bağlı, görsel uygulama (11-12) Esra'nın temposuna.

---

*Bu plan + Tasarım Yönü & Logo Brief + Genişletilmiş Rakip Web Analizi = sıfırdan inşa için tam paket. Sıradaki adım: ortam kararını ver ve ilk fazı seç.*
