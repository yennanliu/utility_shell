# ByteByteGo PDF Downloader — Debugging Notes

Notes from debugging the PDF download script (`download_courses.js` / `test_download.js`).

---

## Problem

PDFs were being generated but contained no article content. Files were ~795 bytes
(essentially empty PDFs with just the header/banner) instead of containing the
chapter text.

## Root Cause

The CSS selector used to hide the sidebar was too broad:

```js
document.querySelectorAll('aside, .ant-layout-sider, [class*="sider"], [class*="Sider"]')
  .forEach(el => el.style.display = 'none');
```

The substring selector `[class*="sider"]` matched the **layout container** itself:

```html
<div class="ant-layout ant-layout-has-sider style_learn__wJdK1 css-133v4sd">
  <aside class="ant-layout-sider ...">...</aside>   <!-- sidebar -->
  <div>...<article>...</article>...</div>           <!-- article -->
</div>
```

The `ant-layout-has-sider` class on the parent contains the substring `sider`,
so `display: none` was applied to the entire layout — hiding the article along
with the sidebar.

## Fix

Use exact class names instead of substring matches:

```js
// Sidebar only
document.querySelectorAll('aside.ant-layout-sider').forEach(el => {
  el.style.display = 'none';
});
// Page header only — never the <header> inside <article>
document.querySelectorAll('body > header, #__next > header').forEach(el => {
  el.style.display = 'none';
});
```

Also removed `[class*="banner"]` and `[class*="Header"]` — both were either
overly broad (risk of matching wrappers) or matched nothing useful.

---

## Other Issues Hit Along the Way

### 1. Playwright headless shell does not support PDF generation

`npx playwright install chromium` installs `chromium_headless_shell` by default,
which silently produces tiny/empty PDFs. To generate PDFs you must launch the
**full** Chromium binary:

```js
const browser = await chromium.launch({
  headless: true,
  executablePath: '/Users/.../chromium-1217/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing',
});
```

(The full Chromium gets installed alongside the headless shell — just point at
it explicitly.)

### 2. `@media print` CSS hides content

The bytebytego site (like many React apps) doesn't render content under
`@media print`. Force screen media before calling `page.pdf()`:

```js
await page.emulateMedia({ media: 'screen' });
```

### 3. `networkidle` times out in headless mode

Single-page React apps keep network connections open (websockets, analytics
beacons, etc.), so `waitUntil: 'networkidle'` often hits the 30s timeout.
Switched to:

```js
await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 30000 });
await page.waitForSelector('article h1, article p, main article', { timeout: 15000 });
await page.waitForTimeout(2000);
```

### 4. Authentication via cookie injection

The MCP Playwright browser session is independent from a Node.js Playwright
script. To reuse the logged-in session, grab `document.cookie` from the MCP
browser and inject via `context.addCookies()`. The relevant cookie is `token`
(Firebase JWT, ~1 hour TTL — expires fast, refresh if downloads take long).

### 5. Don't hide `<header>` globally

The article markup wraps its `<h1>` in a `<header>`:

```html
<article><header><h1>Introduction</h1></header><p>...</p></article>
```

Using `document.querySelector('header').style.display = 'none'` (the original
script's behavior) would hide the article title. Scope it to page-level headers
only: `body > header, #__next > header`.

### 6. Hiding the sidebar doesn't reclaim its horizontal space

After `display: none` on the sidebar, the article appeared shifted right and
its right edge was clipped off the PDF page. The Ant Design layout sets
margin/padding/max-width on ancestor elements assuming a fixed-width sidebar
exists alongside the article — those constraints persist even after the
sidebar is hidden.

Fix: walk up from `<article>` and reset layout constraints, then center the
article:

```js
const article = document.querySelector('article');
let el = article;
while (el && el !== document.body) {
  const cs = window.getComputedStyle(el);
  if (parseFloat(cs.marginLeft) > 0) el.style.marginLeft = '0';
  if (parseFloat(cs.paddingLeft) > 50) el.style.paddingLeft = '0';
  el.style.maxWidth = 'none';
  el.style.width = 'auto';
  el = el.parentElement;
}
article.style.maxWidth = '780px';
article.style.margin = '0 auto';
article.style.padding = '0 20px';
article.style.boxSizing = 'border-box';
```

Result: text wraps within the printable area, no right-edge clipping, and the
article is centered on the page with comfortable margins.

---

## Verification

After the fix, PDFs for the first 3 chapters of "How to Write a Good Resume":

| File | Size | Content |
|---|---|---|
| 01_Acknowledgements.pdf | 138K | OK |
| 02_Introduction.pdf | 244K | OK (full intro text + instructor + who-this-book-is-for) |
| 03_PART 1_RESUMES AND THE HIRING PROCESS.pdf | 154K | OK |

Verified by running `pdftotext` and confirming article text is present.

## Outstanding

- The original `download_courses.js` still has the broken selectors. Apply the
  same fix before running the full download.
- Consider extracting the cookie-injection / browser-launch boilerplate into
  a shared helper so both scripts use it.
