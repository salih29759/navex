# Navex - Canlıya Alma Kılavuzu (Vercel + GitHub + Formspree)

Site tamamen statik (HTML/CSS/JS, build yok). Vercel statik dosyaları olduğu gibi servis eder;
`404.html` otomatik kullanılır. Tek dış ihtiyaç: formlar için Formspree (Vercel'de yerleşik form yok).

---

## Adım 1 - GitHub'a push
Repo zaten lokalde git (commit'li). GitHub'da boş bir repo açıp bağla:

```bash
cd /Users/salihdurmus/Desktop/navex-build
# GitHub CLI varsa (en kolay):
gh repo create navex-site --private --source=. --remote=origin --push
# ya da elle: GitHub'da repo aç, sonra:
# git remote add origin git@github.com:KULLANICI/navex-site.git
# git branch -M main && git push -u origin main
```

## Adım 2 - Vercel'e import
1. vercel.com → **Add New → Project → Import** (GitHub repo'sunu seç).
2. **Root Directory: `site`** (önemli - site dosyaları orada).
3. **Framework Preset: Other**, Build Command: boş, Output: boş (build yok).
4. **Deploy.** Birkaç saniyede `proje-adi.vercel.app` adresinde canlı olur.
5. Her `git push` → otomatik yeni deploy.

## Adım 3 - Formlar (Formspree, ücretsiz)
1. formspree.io → hesap aç → **2 form** oluştur: "Navex Contact" ve "Navex Newsletter".
2. Her formun endpoint'ini al: `https://formspree.io/f/XXXXXXX`.
3. Şu iki dosyada `action="https://formspree.io/f/your-form-id"` değerini gerçek ID ile değiştir:
   - `site/contact.html` (Contact formu)
   - `site/insights.html` (Newsletter formu)
   *(ID'leri bana ver, ben de koyabilirim.)*
4. İsteğe bağlı: forma `<input type="hidden" name="_subject" value="New Navex enquiry">` ekleyince
   gelen mailin konusu netleşir. Formspree gönderimleri info@navexcapital.com'a yönlendirilebilir.

## Adım 4 - Domain (navexcapital.com)
Şu an domain Squarespace'te. Yeni siteyi bağlamak:
1. Vercel proje → **Settings → Domains → Add** → `navexcapital.com` (ve `www`).
2. Vercel sana DNS kayıtlarını verir (genelde apex için `A 76.76.21.21`, www için `CNAME cname.vercel-dns.com`).
3. Domain'in DNS'ini yöneten yerde (Squarespace veya registrar) bu kayıtları gir.
4. HTTPS otomatik gelir. DNS yayılınca yeni site eski Squarespace sitesinin yerini alır.

> **Düşük riskli sıra:** önce `*.vercel.app` adresinde her şeyi test et (formlar dahil), beğenince
> Adım 4'teki DNS değişikliğini yap. Domain geçtikten ve birkaç gün sorunsuz çalıştıktan sonra
> Squarespace aboneliğini iptal edebilirsin.

---

## Notlar
- İç linkler `.html` uzantılı; Vercel bunları olduğu gibi servis eder (ekstra ayar gerekmez).
- Hero videosu (`assets/hero-loop.mp4`, ~7.5MB) Vercel CDN'den hızlı gelir; sorun olmaz.
- Bekleyen içerik: Case Studies'te Harun'un gerçek rakamları + testimonial; About'a Harun foto (ops.).
