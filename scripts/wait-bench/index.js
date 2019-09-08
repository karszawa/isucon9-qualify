const puppeteer = require("puppeteer");
// https://github.com/GoogleChrome/puppeteer

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.goto("https://portal.isucon.net/contest/");

  await new Promise(resolve => setTimeout(resolve, 5000));

  await browser.close();
})();
