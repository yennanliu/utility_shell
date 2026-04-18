/**
 * TEST: Download first 3 pages of first course (How to Write a Good Resume)
 * Run via: node test_download.js
 */

const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const OUTPUT_DIR = path.join(__dirname, 'pdfs_test');

// Session cookies from logged-in browser
const COOKIES = [
  { name: 'cookieyes-consent', value: 'consentid:THdmbUgybFdaUjNQQVp1QmxSQmtvcFQ5UE1KZ2hLRWI,consent:yes,action:no,necessary:yes,functional:yes,analytics:yes,performance:yes,advertisement:yes,other:yes', domain: '.bytebytego.com', path: '/' },
  { name: '_ga', value: 'GA1.1.1301036573.1776470028', domain: '.bytebytego.com', path: '/' },
  { name: 'token', value: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjcwZmM5YzU0YjhiMjQyMWZmMTgyOTgxNTQyZmQ0NjRlOWJlYzM1NDUiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiWUVOIE5BTiBMSVUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jSW5ZVTJ2SHg2TzFtUnJmbkdNSGp4S1k2YzlOaTl2SDNWV2puWUtKd0kyMFVDMjdiQT1zOTYtYyIsImVudCI6eyJwcm9tbyI6eyJzIjoiYSIsImUiOjE3Nzc5NjYxNjd9fSwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL2J5dGVieXRlZ28tcHJkIiwiYXVkIjoiYnl0ZWJ5dGVnby1wcmQiLCJhdXRoX3RpbWUiOjE3NzY0NzAwNzIsInVzZXJfaWQiOiJSd0dxU2ZlbUEzU2N4OGRlYUNEVEdpTUU1UDczIiwic3ViIjoiUndHcVNmZW1BM1NjeDhkZWFDRFRHaU1FNVA3MyIsImlhdCI6MTc3NjQ3MDA3MiwiZXhwIjoxNzc2NDczNjcyLCJlbWFpbCI6ImYzMzkzMzlAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDk3ODEwODk3NDc0OTUzNzY0NTAiXSwiZW1haWwiOlsiZjMzOTMzOUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJjdXN0b20ifX0.gGbAKldcqyFucpDBDJrCxwl4YyyYMuMrqxaWL9Ho7pb2tiJ9VRAzVV7eB8aCxsQUFG9W9ggV_wlXDu4YN70vwNi8WcxrT5UNxiw04pn9h-bqBWj8qx4uZQe9ufP-O0VPHJpIf2k4F9fqOX5b_nHEkgBDg9WlRBnDm-TALpCZurZw8h7AoXUO7XV0kt5MJyF4lxLRypfxGGQCyWn_on63-I1cZxUroBSkXFFTqtKjehoZ9kBpDqzzkvbHPOJRD1OFC8nvIUoKaoiU3a4_g28dL2KgzxEasEWfwxG_oVlMB0evqSlpNA4CUcsOzJcIwglVsgfnlJXFfToBovHe8svCFA', domain: '.bytebytego.com', path: '/' },
  { name: 'csrf-token', value: '1776470072816%3A94745940bade32d85ee9ad717905aceba0326d16992b64ca0c55149ad65a7c66', domain: '.bytebytego.com', path: '/' },
];

const FIRST_COURSE = {
  name: 'How_to_Write_a_Good_Resume',
  startUrl: 'https://bytebytego.com/courses/tech-resume/p0-c2-introduction'
};

async function getChapterUrls(page) {
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

async function main() {
  if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

  const chromiumExec = '/Users/yennanliu/Library/Caches/ms-playwright/chromium-1217/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing';
  const browser = await chromium.launch({ headless: true, executablePath: chromiumExec });
  const context = await browser.newContext({ userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' });

  // Inject session cookies
  await context.addCookies(COOKIES);

  const page = await context.newPage();

  try {
    // Verify login
    await page.goto('https://bytebytego.com/my-courses', { waitUntil: 'domcontentloaded', timeout: 30000 });
    await page.waitForTimeout(3000);
    if (page.url().includes('login') || page.url().includes('sign-in')) {
      console.error('Not logged in! Token may have expired.');
      process.exit(1);
    }
    console.log('Logged in OK. Starting test download...\n');

    // Navigate to first course
    await page.goto(FIRST_COURSE.startUrl, { waitUntil: 'domcontentloaded', timeout: 30000 });
    await page.waitForTimeout(3000);

    const allChapters = await getChapterUrls(page);
    console.log(`Found ${allChapters.length} total chapters. Will download first 3.\n`);

    const chapters = allChapters.slice(0, 3);
    const courseDir = path.join(OUTPUT_DIR, FIRST_COURSE.name);
    if (!fs.existsSync(courseDir)) fs.mkdirSync(courseDir, { recursive: true });

    for (let i = 0; i < chapters.length; i++) {
      const ch = chapters[i];
      const safeName = ch.title.replace(/[^a-zA-Z0-9\-_ ]/g, '_').trim().substring(0, 80);
      const pdfPath = path.join(courseDir, `${String(i + 1).padStart(2, '0')}_${safeName}.pdf`);

      console.log(`[${i+1}/3] Saving: ${safeName}`);
      console.log(`       URL: ${ch.url}`);

      try {
        await page.goto(ch.url, { waitUntil: 'domcontentloaded', timeout: 30000 });

        // Wait for actual article content to render (JS-driven)
        try {
          await page.waitForSelector('article h1, article p, main article', { timeout: 15000 });
        } catch (e) {
          console.log(`       WARNING: content selector timeout, proceeding anyway`);
        }
        await page.waitForTimeout(2000);
        await page.setViewportSize({ width: 1400, height: 900 });

        // Debug: take screenshot to verify content visible
        if (i === 0) {
          await page.screenshot({ path: path.join(courseDir, `debug_page${i+1}.png`) });
          console.log(`       DEBUG screenshot saved`);
        }

        // Force screen media so @media print CSS doesn't hide content
        await page.emulateMedia({ media: 'screen' });

        // Hide chrome (sidebar + page header). Avoid substring class selectors like
        // [class*="sider"] — they match container classes such as
        // `ant-layout-has-sider` that ALSO contain the article.
        await page.evaluate(() => {
          // Course sidebar (left navigation menu)
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
            // Walk up and clear any left margin/padding/width constraints that
            // were sized to fit "next to a sidebar".
            let el = article;
            while (el && el !== document.body) {
              const cs = window.getComputedStyle(el);
              if (parseFloat(cs.marginLeft) > 0) el.style.marginLeft = '0';
              if (parseFloat(cs.paddingLeft) > 50) el.style.paddingLeft = '0';
              el.style.maxWidth = 'none';
              el.style.width = 'auto';
              el = el.parentElement;
            }
            // Center the article itself in the now-full-width container.
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

        console.log(`       SAVED: ${pdfPath}`);
        await page.waitForTimeout(800);
      } catch (err) {
        console.log(`       FAILED: ${err.message}`);
      }
    }

    console.log(`\nTest complete! PDFs in: ${courseDir}`);
  } finally {
    await browser.close();
  }
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
