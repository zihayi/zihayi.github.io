(function () {
  "use strict";

  var layout = document.querySelector(".post-layout");
  var body = document.querySelector(".article-body");
  var toc = document.querySelector(".post-toc");
  if (!layout || !body || !toc) return;

  // Keep wide code samples and tables scrollable without widening the article.
  body.querySelectorAll("pre, table").forEach(function (element) {
    var scrollArea = element;
    if (element.tagName === "TABLE") {
      scrollArea = document.createElement("div");
      scrollArea.className = "table-scroll";
      element.parentNode.insertBefore(scrollArea, element);
      scrollArea.appendChild(element);
    }
    scrollArea.tabIndex = 0;
    scrollArea.setAttribute("role", "region");
    scrollArea.setAttribute("aria-label", element.tagName === "TABLE" ? "表格，可横向滚动" : "代码或预格式文本，可横向滚动");
  });

  var headings = Array.from(body.querySelectorAll("h1, h2, h3"));
  if (!headings.length) return;

  var list = toc.querySelector(".post-toc-list");
  var links = [];
  headings.forEach(function (heading, index) {
    if (!heading.id) {
      var id = "section-" + (index + 1);
      while (document.getElementById(id)) id += "-heading";
      heading.id = id;
    }
    heading.tabIndex = -1;

    var item = document.createElement("li");
    var link = document.createElement("a");
    item.className = "post-toc-item post-toc-item--" + heading.tagName.toLowerCase();
    link.href = "#" + encodeURIComponent(heading.id);
    link.textContent = heading.textContent;
    item.appendChild(link);
    list.appendChild(item);
    links.push(link);
  });

  toc.hidden = false;
  layout.classList.add("has-toc");

  var desktop = window.matchMedia("(min-width: 1041px)");
  var disclosure = toc.querySelector("details");
  function setDisclosure() {
    disclosure.open = desktop.matches;
  }
  setDisclosure();
  desktop.addEventListener("change", setDisclosure);

  var current = -1;
  var scheduled = false;
  function updateCurrentHeading() {
    var next = 0;
    headings.forEach(function (heading, index) {
      // Match the 36px anchor offset without skipping a nearby subheading.
      if (heading.getBoundingClientRect().top <= 64) next = index;
    });
    if (next !== current) {
      if (current >= 0) links[current].removeAttribute("aria-current");
      links[next].setAttribute("aria-current", "location");
      current = next;
    }
    scheduled = false;
  }
  function scheduleUpdate() {
    if (scheduled) return;
    scheduled = true;
    window.requestAnimationFrame(updateCurrentHeading);
  }
  window.addEventListener("scroll", scheduleUpdate, { passive: true });
  window.addEventListener("resize", scheduleUpdate);
  body.addEventListener("toggle", scheduleUpdate, true);
  updateCurrentHeading();
})();
