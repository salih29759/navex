/* Navex Capital - interactions (deliberate, restrained) */
(function () {
  "use strict";

  /* mark JS active so CSS can safely hide-then-reveal */
  document.documentElement.classList.add("js");

  var reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  /* Header solidifies on scroll */
  var header = document.getElementById("header");
  var onScroll = function () {
    if (window.scrollY > 40) header.classList.add("is-scrolled");
    else header.classList.remove("is-scrolled");
  };
  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();

  /* Mobile nav */
  var toggle = document.getElementById("navToggle");
  if (toggle) {
    toggle.addEventListener("click", function () {
      var open = header.classList.toggle("nav-open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
      toggle.setAttribute("aria-label", open ? "Close menu" : "Open menu");
    });
    header.querySelectorAll(".nav-links a").forEach(function (a) {
      a.addEventListener("click", function () {
        header.classList.remove("nav-open");
        toggle.setAttribute("aria-expanded", "false");
      });
    });
  }

  /* Scroll reveal with subtle stagger within sibling groups */
  var items = document.querySelectorAll(".reveal");
  if (!reduce) {
    items.forEach(function (el) {
      var sibs = Array.prototype.filter.call(el.parentNode.children, function (c) {
        return c.classList && c.classList.contains("reveal");
      });
      var idx = sibs.indexOf(el);
      if (idx > 0) el.style.transitionDelay = Math.min(idx * 80, 320) + "ms";
    });
  }
  if (reduce || !("IntersectionObserver" in window)) {
    items.forEach(function (el) { el.classList.add("is-visible"); });
  } else {
    var io = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add("is-visible");
            io.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12, rootMargin: "0px 0px -8% 0px" }
    );
    items.forEach(function (el) { io.observe(el); });
  }

  /* Count-up stats (when the band enters view) */
  var nums = document.querySelectorAll(".stat__num[data-count]");
  var unit = function (s) { return s ? "<span>" + s + "</span>" : ""; };
  var renderNum = function (el, val) {
    el.innerHTML = unit(el.dataset.prefix) + val + unit(el.dataset.suffix);
  };
  var countUp = function (el) {
    var target = parseInt(el.dataset.count, 10) || 0;
    if (target <= 1) { renderNum(el, target); return; }
    var dur = 1400, start = null;
    var step = function (ts) {
      if (!start) start = ts;
      var p = Math.min((ts - start) / dur, 1);
      var eased = 1 - Math.pow(1 - p, 3); /* easeOutCubic */
      renderNum(el, Math.round(eased * target));
      if (p < 1) requestAnimationFrame(step);
    };
    requestAnimationFrame(step);
  };
  if (nums.length && !reduce && "IntersectionObserver" in window) {
    nums.forEach(function (el) { renderNum(el, 0); });
    var nio = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) { countUp(entry.target); nio.unobserve(entry.target); }
        });
      },
      { threshold: 0.6 }
    );
    nums.forEach(function (el) { nio.observe(el); });
  }
  /* (no-JS / reduced-motion: HTML already shows the final figures) */

  /* Subtle parallax on full-bleed photo bands */
  if (!reduce) {
    var pbImgs = document.querySelectorAll(".photoband__img");
    if (pbImgs.length) {
      var ticking = false;
      var parallax = function () {
        pbImgs.forEach(function (img) {
          var band = img.parentNode;
          var rect = band.getBoundingClientRect();
          if (rect.bottom < -50 || rect.top > window.innerHeight + 50) return;
          var prog = (rect.top + rect.height / 2 - window.innerHeight / 2) / window.innerHeight;
          var y = (prog * -22).toFixed(1);
          img.style.transform = "translate3d(0," + y + "px,0) scale(1.14)";
        });
        ticking = false;
      };
      window.addEventListener("scroll", function () {
        if (!ticking) { requestAnimationFrame(parallax); ticking = true; }
      }, { passive: true });
      parallax();
    }
  }

  /* Back to top (created in JS, so no per-page markup needed) */
  var toTop = document.createElement("button");
  toTop.className = "to-top";
  toTop.type = "button";
  toTop.setAttribute("aria-label", "Back to top");
  toTop.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 19V5M6 11l6-6 6 6"/></svg>';
  document.body.appendChild(toTop);
  toTop.addEventListener("click", function () {
    window.scrollTo({ top: 0, behavior: reduce ? "auto" : "smooth" });
  });
  var toggleTop = function () {
    if (window.scrollY > 600) toTop.classList.add("show");
    else toTop.classList.remove("show");
  };
  window.addEventListener("scroll", toggleTop, { passive: true });
  toggleTop();

  /* Smooth in-page anchor scrolling (respects reduced-motion + fixed header) */
  document.querySelectorAll('a[href^="#"]').forEach(function (a) {
    a.addEventListener("click", function (e) {
      var href = a.getAttribute("href");
      if (!href || href === "#") return;
      var target = document.querySelector(href);
      if (!target) return;
      e.preventDefault();
      var top = target.getBoundingClientRect().top + window.pageYOffset - 72;
      window.scrollTo({ top: top, behavior: reduce ? "auto" : "smooth" });
    });
  });
})();
