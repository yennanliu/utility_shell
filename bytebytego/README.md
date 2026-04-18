# ByteByteGo Course PDF Downloader

Downloads ByteByteGo course chapters as individual PDFs using a standalone Node + Playwright script. Re-runnable, skips already-downloaded files, and supports per-course filtering.

---

## Quick Start

```bash
# 1. Install dependencies (one-time)
npm install playwright
npx playwright install chromium      # installs full Chromium (PDF support)
brew install poppler                 # optional, for pdftotext verification

# 2. Refresh the auth token in download_courses.js (see "Authentication" below)

# 3. Download
node download_courses.js             # all courses
node download_courses.js 0           # first course only
node download_courses.js 0,2,3       # selected courses by index
```

PDFs land in `pdfs/<Course_Name>/NN_<Chapter_Title>.pdf`.

---

## Authentication

The site auth uses a **Firebase JWT** in the `token` cookie. The script injects this cookie via Playwright's `context.addCookies()` so it doesn't need to log in itself.

### How to grab a fresh token

1. Log in to https://bytebytego.com in your normal browser (Google SSO works fine).
2. Open DevTools → Application → Cookies → `https://bytebytego.com`.
3. Copy the value of the `token` cookie (it's a long JWT starting with `eyJ...`).
4. Paste into `download_courses.js` at the `COOKIES` constant:
   ```js
   const COOKIES = [
     { name: 'token', value: 'PASTE_JWT_HERE', domain: '.bytebytego.com', path: '/' },
   ];
   ```

### Token expiry

The JWT expires **~1 hour** after login. If the script fails with "Not logged in!", refresh the token and re-run. The skip-if-exists logic means you only re-render PDFs that weren't completed.

---

## Course Index

Pass these numbers as the CLI arg to `download_courses.js`:

| Index | Course | Verified ✓ |
|-------|--------|-----------|
| 0 | How to Write a Good Resume | ✓ (19 chapters) |
| 1 | Coding Interview Patterns | ✓ (120 chapters) |
| 2 | System Design Interview | not yet verified |
| 3 | Object-Oriented Design Interview | not yet verified |
| 4 | Machine Learning System Design | not yet verified |
| 5 | Mobile System Design | not yet verified |
| 6 | Generative AI System Design | not yet verified |

> If a course returns 0 chapters or 404s, the start URL slug is probably wrong. Open the course in the browser, copy the URL of the first lesson from the address bar, and update `COURSES[i].startUrl` in the script.

---

## How It Works

1. Launches **full Chromium** (not the headless shell — see gotchas) with the cookie injected.
2. Verifies login by visiting `/my-courses`.
3. For each course:
   - Goes to `startUrl`, expands all collapsible submenus in the sidebar (some courses group lessons under topics like "Two Pointers", "Sliding Window" etc.).
   - Scrapes chapter URLs from `data-menu-id` attributes.
   - For each chapter: navigates, applies layout fixes, calls `page.pdf()`.
   - Skips chapters whose PDF already exists on disk.

---

## Gotchas (read before modifying)

These are the non-obvious traps. Full debugging history in `DEBUGGING_NOTES.md`.

1. **Headless shell ≠ full Chromium.** `chromium_headless_shell` (Playwright's default) silently produces empty PDFs. The script hardcodes the path to `Google Chrome for Testing` (the full binary) via `executablePath`. If you're on a different machine, update `CHROMIUM_EXEC` — find it under `~/Library/Caches/ms-playwright/`.

2. **Don't use `[class*="sider"]` to hide the sidebar.** The Ant Design parent class `ant-layout-has-sider` matches that substring, so you'd hide the entire layout (article included). Use the exact selector `aside.ant-layout-sider`.

3. **Don't hide `<header>` globally.** The article wraps its `<h1>` in a `<header>` — global hide drops the chapter title. Scope to `body > header, #__next > header`.

4. **Force screen media before `page.pdf()`.** The site has `@media print` CSS that hides content. Without `await page.emulateMedia({ media: 'screen' })`, PDFs come out blank.

5. **`networkidle` times out.** SPAs keep connections open. Use `waitUntil: 'domcontentloaded'` plus `waitForSelector('article h1, article p, main article')`.

6. **Reclaim sidebar's horizontal space.** After hiding the sidebar, ancestor margins/widths still assume it exists, clipping the article's right edge. The script walks up from `<article>` clearing margin-left/padding-left/max-width, then centers the article at 780px max-width.

7. **Submenus must be expanded before scraping URLs.** Lesson links are not in the DOM until each topic's submenu is clicked open. The script loops up to 5 passes clicking every `.ant-menu-submenu-title[aria-expanded="false"]` until none remain.

---

## Verification

```bash
# Spot-check a PDF actually contains text
pdftotext pdfs/How_to_Write_a_Good_Resume/02_Introduction.pdf - | head -50

# Render first page as PNG to eyeball layout
pdftoppm -f 1 -l 1 -r 150 pdfs/.../somefile.pdf /tmp/preview && open /tmp/preview-1.ppm
```

A healthy PDF is typically 100KB–700KB. Sub-10KB files mean the renderer produced an empty page — check the token, the selectors, and that you're using full Chromium.

---

## Files

- `download_courses.js` — the real downloader. Edit this.
- `test_download.js` — same logic limited to first 3 chapters of course 0. Use to sanity-check changes before a long run.
- `DEBUGGING_NOTES.md` — the full backstory on why each fix exists.
- `pdfs/` — output directory (gitignored).
- `pdfs_test/` — test script output.
