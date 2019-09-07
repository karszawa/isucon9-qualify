const puppeteer = require("puppeteer");

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.goto("https://example.com");

  await new Promise(resolve => setTimeout(resolve, 5000));

  await browser.close();
})();
