/**
 * ByteByteGo Course PDF Downloader
 * Run via: node download_courses.js
 * Requires: npm install playwright
 *
 * Auth: copy `document.cookie` from a logged-in browser session and paste the
 * `token` cookie value below. Token is a Firebase JWT and expires ~1 hour
 * after login, so refresh before long runs.
 */

const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const OUTPUT_DIR = path.join(__dirname, 'pdfs');

// Full Chromium binary (the headless shell installed by `npx playwright install
// chromium` does NOT support page.pdf() — it silently produces empty PDFs).
const CHROMIUM_EXEC = '/Users/yennanliu/Library/Caches/ms-playwright/chromium-1217/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing';

// Session cookies. Refresh `token` from a logged-in browser before each run.
const COOKIES = [
  { name: 'token', value: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjcwZmM5YzU0YjhiMjQyMWZmMTgyOTgxNTQyZmQ0NjRlOWJlYzM1NDUiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiWUVOIE5BTiBMSVUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jSW5ZVTJ2SHg2TzFtUnJmbkdNSGp4S1k2YzlOaTl2SDNWV2puWUtKd0kyMFVDMjdiQT1zOTYtYyIsImVudCI6eyJwcm9tbyI6eyJzIjoiYSIsImUiOjE3Nzc5NjYxNjd9fSwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL2J5dGVieXRlZ28tcHJkIiwiYXVkIjoiYnl0ZWJ5dGVnby1wcmQiLCJhdXRoX3RpbWUiOjE3NzY0NzAwNTIsInVzZXJfaWQiOiJSd0dxU2ZlbUEzU2N4OGRlYUNEVEdpTUU1UDczIiwic3ViIjoiUndHcVNmZW1BM1NjeDhkZWFDRFRHaU1FNVA3MyIsImlhdCI6MTc3NjQ3MzM1MywiZXhwIjoxNzc2NDc2OTUzLCJlbWFpbCI6ImYzMzkzMzlAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDk3ODEwODk3NDc0OTUzNzY0NTAiXSwiZW1haWwiOlsiZjMzOTMzOUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJjdXN0b20ifX0.doEk8we3FLGFUm-8ZNZF--7Hh3KUn21zYpBNAnenC6gUcUVtS7Zi_Gr1DBbZoDISUpMzMjjo3LRhkFgIHiBdmQhvqk7tcfgUhKSycX0hadTmdYQNZq3YTHAO4YpRuwiysmJ74orQ7REefESmzNAMwGbQJ-AVW4y11M5VDN7YwLeQOXXFHpNedYkNqtVz9diuu9TrZ5J6T4po9aFY664rohCD4sVo_DKDhCUyzC_wKf7x9jT1NhG4lZu3ScOX_slmuegUzNbTVY8lOTA8incA6W0XHNLR5qSNb-ZCUbBsVRmxY3og0UgxGxdsaT9WKxPGYI2G701Xg178zvdKpYUxVQ', domain: '.bytebytego.com', path: '/' },
];

const COURSES = [
  { name: 'How_to_Write_a_Good_Resume', startUrl: 'https://bytebytego.com/courses/tech-resume/p0-c2-introduction' },
  { name: 'Coding_Interview_Patterns', startUrl: 'https://bytebytego.com/courses/coding-patterns/two-pointers/introduction-to-two-pointers' },
  { name: 'System_Design_Interview', startUrl: 'https://bytebytego.com/courses/system-design-interview/foreword' },
  { name: 'Object_Oriented_Design_Interview', startUrl: 'https://bytebytego.com/courses/object-oriented-design-interview/what-is-an-object-oriented-design-interview' },
  { name: 'Machine_Learning_System_Design', startUrl: 'https://bytebytego.com/courses/machine-learning-system-design-interview/visual-search-system' },
  { name: 'Mobile_System_Design', startUrl: 'https://bytebytego.com/courses/mobile-system-design-interview/introduction' },
  { name: 'Generative_AI_System_Design', startUrl: 'https://bytebytego.com/courses/genai-system-design-interview/introduction-and-overview' },
];

async function getChapterUrls(page) {
  // Some courses (e.g. Coding Interview Patterns) group lessons under
  // collapsible topic submenus. The lesson links are NOT rendered in the DOM
  // until each submenu is expanded. Expand all collapsed submenus first.
  // Loop until no more collapsed submenus remain (expanding one can reveal
  // nested ones).
  for (let pass = 0; pass < 5; pass++) {
    const expanded = await page.evaluate(() => {
      const collapsed = Array.from(
        document.querySelectorAll('.ant-menu-submenu-title[aria-expanded="false"]')
      );
      collapsed.forEach(el => el.click());
      return collapsed.length;
    });
    if (expanded === 0) break;
    await page.waitForTimeout(400);
  }

  return await page.evaluate(() => {
    const results = [];
    const seen = new Set();
    document.querySelectorAll('*').forEach(el => {
      const menuId = el.getAttribute('data-menu-id');
      if (menuId && menuId.includes('/courses/')) {
        const match = menuId.match(/\/courses\/.+/);
        if (match && !seen.has(match[0])) {
          seen.add(match[0]);
          results.push({
            title: el.innerText.trim().split('\n')[0],
            url: 'https://bytebytego.com' + match[0]
          });
        }
      }
    });
    return results;
  });
}

async function renderChapterPdf(page, url, pdfPath) {
  await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 30000 });

  // Wait for the article to actually render (JS-driven).
  try {
    await page.waitForSelector('article h1, article p, main article', { timeout: 15000 });
  } catch (e) {
    console.log(`       WARNING: content selector timeout, proceeding anyway`);
  }
  await page.waitForTimeout(2000);
  await page.setViewportSize({ width: 1400, height: 900 });

  // Force screen media so @media print CSS doesn't hide the article.
  await page.emulateMedia({ media: 'screen' });

  // Hide chrome (sidebar + page header). Avoid substring class selectors like
  // [class*="sider"] — they match container classes such as
  // `ant-layout-has-sider` that ALSO contain the article.
  await page.evaluate(() => {
    document.querySelectorAll('aside.ant-layout-sider').forEach(el => {
      el.style.display = 'none';
    });
    // Top page header (logo / login bar) — only direct page-level header,
    // never the <header> inside <article>.
    document.querySelectorAll('body > header, #__next > header').forEach(el => {
      el.style.display = 'none';
    });

    // Reclaim the sidebar's horizontal space and recenter the article so
    // text doesn't overflow the right edge of the PDF page.
    const article = document.querySelector('article');
    if (article) {
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
    }
  });

  await page.pdf({
    path: pdfPath,
    format: 'A4',
    printBackground: true,
    scale: 0.85,
    margin: { top: '15mm', bottom: '15mm', left: '15mm', right: '15mm' }
  });
}

async function downloadCourse(page, course, outputDir) {
  console.log(`\n=== Downloading: ${course.name} ===`);

  await page.goto(course.startUrl, { waitUntil: 'domcontentloaded', timeout: 30000 });
  await page.waitForTimeout(3000);

  const chapters = await getChapterUrls(page);
  console.log(`  Found ${chapters.length} chapters`);

  if (chapters.length === 0) {
    console.log(`  WARNING: No chapters found, saving current page only`);
    const pdfPath = path.join(outputDir, `${course.name}.pdf`);
    await renderChapterPdf(page, course.startUrl, pdfPath);
    console.log(`  Saved: ${pdfPath}`);
    return;
  }

  const courseDir = path.join(outputDir, course.name);
  if (!fs.existsSync(courseDir)) fs.mkdirSync(courseDir, { recursive: true });

  for (let i = 0; i < chapters.length; i++) {
    const ch = chapters[i];
    const safeName = ch.title.replace(/[^a-zA-Z0-9\-_ ]/g, '_').trim().substring(0, 80);
    const pdfPath = path.join(courseDir, `${String(i + 1).padStart(2, '0')}_${safeName}.pdf`);

    if (fs.existsSync(pdfPath)) {
      console.log(`  [${i+1}/${chapters.length}] SKIP (exists): ${safeName}`);
      continue;
    }

    console.log(`  [${i+1}/${chapters.length}] Saving: ${safeName}`);
    try {
      await renderChapterPdf(page, ch.url, pdfPath);
      await page.waitForTimeout(800);
    } catch (err) {
      console.log(`  [${i+1}/${chapters.length}] FAILED: ${err.message}`);
    }
  }

  console.log(`  Done! PDFs in: ${courseDir}`);
}

async function main() {
  if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

  // Optional CLI filter: comma-separated course indices, e.g.
  //   node download_courses.js 0     -> first course only
  //   node download_courses.js 0,2   -> first and third
  // No arg -> all courses.
  const argFilter = process.argv[2];
  const coursesToRun = argFilter
    ? argFilter.split(',').map(n => COURSES[parseInt(n, 10)]).filter(Boolean)
    : COURSES;
  console.log(`Will download ${coursesToRun.length} course(s): ${coursesToRun.map(c => c.name).join(', ')}`);

  const browser = await chromium.launch({ headless: true, executablePath: CHROMIUM_EXEC });
  const context = await browser.newContext({
    userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'
  });
  await context.addCookies(COOKIES);
  const page = await context.newPage();

  try {
    // Verify login
    await page.goto('https://bytebytego.com/my-courses', { waitUntil: 'domcontentloaded', timeout: 30000 });
    await page.waitForTimeout(3000);
    if (page.url().includes('login') || page.url().includes('sign-in')) {
      console.error('Not logged in! Token may have expired — refresh COOKIES.token.');
      process.exit(1);
    }
    console.log('Logged in. Starting downloads...\n');

    for (const course of coursesToRun) {
      await downloadCourse(page, course, OUTPUT_DIR);
    }

    console.log(`\nAll done! PDFs saved to: ${OUTPUT_DIR}`);
  } finally {
    await page.close();
    await browser.close();
  }
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
