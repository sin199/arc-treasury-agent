import fs from 'node:fs/promises'
import path from 'node:path'

const output = process.argv[2]
if (!output) throw new Error('output directory required')
await fs.mkdir(output, { recursive: true })

const scenes = [
  ['01', '#0b1726', 'Arc Treasury Agent', 'A report-first USDC treasury operator on Arc', ['Watch the balance.', 'Apply a policy band.', 'Produce a bounded action pack.']],
  ['02', '#101f32', 'The operator question', 'Hold, top up, trim, or review?', ['One input surface', 'Current balance + policy', 'Evidence before execution']],
  ['03', '#0b1726', 'Live readiness report', 'The public dashboard works without a wallet', ['500.00 USDC current balance', '100.00 minimum  /  500.00 target  /  200.00 max rebalance', 'Decision: HOLD  |  Confidence: 92%']],
  ['04', '#101f32', 'Three policy scenarios', 'The decision changes with the balance', ['BELOW MINIMUM      AT TARGET      ABOVE TARGET', 'TOP UP             HOLD          TRIM', 'BOUNDED            NO TX         BOUNDED', 'BY POLICY          NEEDED        BY POLICY']],
  ['05', '#0b1726', 'Arc and Circle evidence', 'Execution stays optional and gated', ['Arc Testnet policy loaded', 'Circle developer-controlled wallet ready', 'TreasuryExecutor configured', 'Operator wallet required for signed execution']],
  ['06', '#101f32', 'A safe operator handoff', 'Preview first. Sign only when the gates pass.', ['Dashboard: web-eight-chi-99.vercel.app/dashboard', 'Case study: web-eight-chi-99.vercel.app/case-study', 'Repo: github.com/sin199/arc-usdc-rebalancer']],
]

const esc = (value) => value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;').replaceAll('"', '&quot;')
const wrap = (value, width = 52) => {
  const words = value.split(' ')
  const result = []
  let current = ''
  for (const word of words) {
    const next = current ? `${current} ${word}` : word
    if (next.length > width && current) {
      result.push(current)
      current = word
    } else {
      current = next
    }
  }
  if (current) result.push(current)
  return result
}

for (const [id, bg, title, subtitle, lines] of scenes) {
  const wrappedLines = lines.flatMap((line) => wrap(line))
  const body = wrappedLines.map((line, index) => `<text x="116" y="${292 + index * 48}" fill="${index === 0 ? '#f7fbff' : '#dbe8f2'}" font-size="${index === 0 ? 29 : 26}" font-family="Arial, Helvetica, sans-serif">${esc(line)}</text>`).join('')
  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="1280" height="720" viewBox="0 0 1280 720">
  <rect width="1280" height="720" fill="${bg}"/>
  <rect width="1280" height="12" fill="#54e1d1"/>
  <rect x="72" y="72" width="1136" height="576" rx="22" fill="#15263a"/>
  <rect x="72" y="72" width="8" height="576" fill="#ffa45b"/>
  <text x="116" y="150" fill="#f7fbff" font-size="52" font-family="Arial, Helvetica, sans-serif" font-weight="700">${esc(title)}</text>
  <text x="116" y="214" fill="#54e1d1" font-size="26" font-family="Arial, Helvetica, sans-serif">${esc(subtitle)}</text>
  ${body}
  <text x="116" y="650" fill="#8398ac" font-size="18" font-family="Arial, Helvetica, sans-serif">ARC TREASURY AGENT  /  USDC REBALANCER</text>
</svg>`
  await fs.writeFile(path.join(output, `${id}.svg`), svg)
}
