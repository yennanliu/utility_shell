const { chromium } = require('playwright');
const exec = '/Users/yennanliu/Library/Caches/ms-playwright/chromium-1217/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing';

const COOKIES = [
  { name: 'token', value: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjcwZmM5YzU0YjhiMjQyMWZmMTgyOTgxNTQyZmQ0NjRlOWJlYzM1NDUiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiWUVOIE5BTiBMSVUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jSW5ZVTJ2SHg2TzFtUnJmbkdNSGp4S1k2YzlOaTl2SDNWV2puWUtKd0kyMFVDMjdiQT1zOTYtYyIsImVudCI6eyJwcm9tbyI6eyJzIjoiYSIsImUiOjE3Nzc5NjYxNjd9fSwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL2J5dGVieXRlZ28tcHJkIiwiYXVkIjoiYnl0ZWJ5dGVnby1wcmQiLCJhdXRoX3RpbWUiOjE3NzY0NzAwNzIsInVzZXJfaWQiOiJSd0dxU2ZlbUEzU2N4OGRlYUNEVEdpTUU1UDczIiwic3ViIjoiUndHcVNmZW1BM1NjeDhkZWFDRFRHaU1FNVA3MyIsImlhdCI6MTc3NjQ3MDA3MiwiZXhwIjoxNzc2NDczNjcyLCJlbWFpbCI6ImYzMzkzMzlAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDk3ODEwODk3NDc0OTUzNzY0NTAiXSwiZW1haWwiOlsiZjMzOTMzOUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJjdXN0b20ifX0.gGbAKldcqyFucpDBDJrCxwl4YyyYMuMrqxaWL9Ho7pb2tiJ9VRAzVV7eB8aCxsQUFG9W9ggV_wlXDu4YN70vwNi8WcxrT5UNxiw04pn9h-bqBWj8qx4uZQe9ufP-O0VPHJpIf2k4F9fqOX5b_nHEkgBDg9WlRBnDm-TALpCZurZw8h7AoXUO7XV0kt5MJyF4lxLRypfxGGQCyWn_on63-I1cZxUroBSkXFFTqtKjehoZ9kBpDqzzkvbHPOJRD1OFC8nvIUoKaoiU3a4_g28dL2KgzxEasEWfwxG_oVlMB0evqSlpNA4CUcsOzJcIwglVsgfnlJXFfToBovHe8svCFA', domain: '.bytebytego.com', path: '/' },
];

(async () => {
  const browser = await chromium.launch({ headless: true, executablePath: exec });
  const ctx = await browser.newContext();
  await ctx.addCookies(COOKIES);
  const page = await ctx.newPage();
  await page.goto('https://bytebytego.com/courses/tech-resume/p0-c2-introduction', { waitUntil: 'domcontentloaded' });
  await page.waitForSelector('article', { timeout: 15000 });
  await page.waitForTimeout(3000);

  const matches = await page.evaluate(() => {
    const all = {};
    for (const sel of ['[class*="sider"]', '[class*="Sider"]', '[class*="Header"]', '#__next > header', 'aside', '.ant-layout-sider']) {
      all[sel] = Array.from(document.querySelectorAll(sel)).map(el => ({
        tag: el.tagName,
        classes: typeof el.className === 'string' ? el.className : String(el.className),
        containsArticle: !!el.querySelector('article'),
      }));
    }
    return all;
  });
  console.log(JSON.stringify(matches, null, 2));
  await browser.close();
})().catch(console.error);
