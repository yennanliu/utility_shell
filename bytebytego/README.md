# ByteByteGo Course PDF Downloader

## Overview
Downloads ByteByteGo course chapters as individual PDFs using Playwright MCP inside Claude Code.

---

## Login

- URL: `https://bytebytego.com/my-courses`
- Auth: Magic Link (email OTP) — **not** Google SSO via Playwright
- Login flow: Enter email → receive 6-digit OTP → enter code in modal

---

## Courses Available

| Course | Start URL |
|--------|-----------|
| How to Write a Good Resume | `/courses/tech-resume/p0-c2-introduction` |
| Coding Interview Patterns | `/courses/coding-patterns/two-pointers/introduction-to-two-pointers` |
| System Design Interview | `/courses/system-design-interview/scale-from-zero-to-millions-of-users` |
| Object-Oriented Design Interview | `/courses/object-oriented-design-interview/what-is-an-object-oriented-design-interview` |
| Machine Learning System Design | `/courses/machine-learning-system-design-interview/visual-search-system` |
| Mobile System Design | `/courses/mobile-system-design-interview/introduction` |
| Generative AI System Design | `/courses/genai-system-design-interview/introduction-and-overview` |

> "Behavioral Interview" is **Coming Soon** — no content yet.

---

## How to Get All Chapter URLs

The sidebar uses Ant Design menus with `data-menu-id` attributes. Sections are **collapsed by default** — must expand all first.

### Step 1: Expand all sections
```js
const sections = await page.evaluate(() =>
  Array.from(document.querySelectorAll('.ant-menu-submenu-title'))
    .filter(el => el.getAttribute('aria-expanded') === 'false')
    .map(el => el.getAttribute('data-menu-id'))
);
for (const menuId of sections) {
  await page.locator(`[data-menu-id="${menuId}"]`).first().click();
  await page.waitForTimeout(300);
}
```

### Step 2: Collect all chapter URLs
```js
const chapters = await page.evaluate(() => {
  const results = [], seen = new Set();
  document.querySelectorAll('*').forEach(el => {
    const menuId = el.getAttribute('data-menu-id');
    if (menuId && menuId.includes('/courses/')) {
      const match = menuId.match(/\/courses\/.+/);
      if (match && !seen.has(match[0])) {
        seen.add(match[0]);
        results.push({ title: el.innerText.trim().split('\n')[0], url: 'https://bytebytego.com' + match[0] });
      }
    }
  });
  return results;
});
```

---

## PDF Generation

### Key findings
- `page.pdf()` works — content is white background, dark text, no hostile `@media print` CSS
- **The sidebar stays in the PDF** (grey Ant Design sider) and pushes content off the right edge
- Fix: inject a `<style>` tag via `page.addStyleTag` (safer than removing DOM nodes — DOM removal causes Next.js re-renders and unexpected navigation)

### CSS fix to inject before `page.pdf()`
```js
await page.addStyleTag({ content: `
  .ant-layout-sider, header, [class*="AskAlex"], [class*="ask-alex"] { display: none !important; }
  .ant-layout { background: #fff !important; }
  .ant-layout-content { margin-left: 0 !important; width: 100% !important; max-width: 100% !important; background: #fff !important; }
  body { background: #fff !important; }
`});
```

### PDF call
```js
await page.pdf({
  path: outPath,
  format: 'A4',
  printBackground: true,
  margin: { top: '15mm', bottom: '15mm', left: '15mm', right: '15mm' }
});
```

---

## Navigation Gotchas

1. **Use a dedicated tab** — always open a new tab (`browser_tabs new`) for downloading. Tab 0 from prior sessions may auto-navigate due to leftover Next.js client-side routing state.
2. **Don't remove DOM nodes** — causes Next.js to re-render and navigate away. Use CSS injection instead.
3. **`waitUntil: 'domcontentloaded'`** — use this (not `networkidle`) with a 2–3s `waitForTimeout` after; `networkidle` times out on this site.
4. **Course cards use `li.style_courseItem__MV4Ic`** — not `<a>` tags. Click the `<li>` to discover the course start URL.

---

## Output Structure

```
pdfs/
  Coding_Interview_Patterns/
    001_Introduction_to_Two_Pointers.pdf
    002_Pair_Sum_-_Sorted.pdf
    ...
    120_Triangle_Numbers.pdf
```

---

## Chrome DevTools MCP (alternative approach — not working yet)

Tried connecting to existing Chrome session via:
```bash
claude mcp add chrome-devtools -- npx chrome-devtools-mcp@latest --autoConnect
```
And enabling `chrome://inspect/#remote-debugging` in Chrome 146.

**Status:** MCP still looks for `DevToolsActivePort` file (port-based), which requires launching Chrome with `--remote-debugging-port=9222`. The native pipe-based debugging from Chrome 146 is not yet supported by this MCP version.
