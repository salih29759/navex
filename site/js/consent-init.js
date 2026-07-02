/* Consent management: self-hosted vanilla-cookieconsent v3 (orestbida/cookieconsent).
   Loaded deferred after /vendor/cookieconsent.umd.js on every page (via tools/build-meta.pl).
   Gated trackers live in <head> as <script type="text/plain" data-category="analytics|marketing">;
   the library executes them on consent automatically, no page reload.
   Remove this file + /vendor/ + the loader lines in build-meta.pl to drop consent management. */
(function () {
  "use strict";
  if (!window.CookieConsent) return;

  /* Footer "Cookie Settings" links (.cc-settings-link) reopen the preferences modal */
  document.addEventListener("click", function (e) {
    var a = e.target && e.target.closest ? e.target.closest(".cc-settings-link") : null;
    if (!a) return;
    e.preventDefault();
    window.CookieConsent.showPreferences();
  });

  window.CookieConsent.run({
    cookie: { expiresAfterDays: 365 },
    guiOptions: {
      consentModal: { layout: "box", position: "bottom right", equalWeightButtons: false, flipButtons: false },
      preferencesModal: { layout: "box", equalWeightButtons: false, flipButtons: false }
    },
    categories: {
      necessary: { readOnly: true },
      analytics: {},
      marketing: {}
    },
    language: {
      default: "en",
      translations: {
        en: {
          consentModal: {
            title: "We value your privacy",
            description: "We use cookies to understand how our site is used and to recognise the companies that visit us, which helps us serve prospective clients better. See our <a href=\"privacy.html\">Privacy Policy</a> for details.",
            acceptAllBtn: "Accept all",
            acceptNecessaryBtn: "Reject all",
            showPreferencesBtn: "Manage preferences"
          },
          preferencesModal: {
            title: "Cookie preferences",
            acceptAllBtn: "Accept all",
            acceptNecessaryBtn: "Reject all",
            savePreferencesBtn: "Save preferences",
            closeIconLabel: "Close",
            sections: [
              {
                title: "Strictly necessary",
                description: "Required for the site to work. Always on.",
                linkedCategory: "necessary"
              },
              {
                title: "Analytics",
                description: "Usage analytics and session insights (Microsoft Clarity, Leadfeeder).",
                linkedCategory: "analytics"
              },
              {
                title: "Marketing",
                description: "Visitor identification to recognise prospective clients (RB2B).",
                linkedCategory: "marketing"
              },
              {
                title: "More information",
                description: "Details are in our <a href=\"privacy.html\">Privacy Policy</a>. Questions: <a href=\"mailto:info@navexcapital.com\">info@navexcapital.com</a>."
              }
            ]
          }
        }
      }
    }
  });
})();
