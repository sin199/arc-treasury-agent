#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
TMP="$ROOT/demo-assets/rendered"
OUT="$ROOT/arc-treasury-agent-demo.mp4"
CARDS="$TMP/cards"
CARD_PNG="$TMP/cards-png"

mkdir -p "$TMP"
rm -rf "$TMP"/* "$OUT"
mkdir -p "$CARDS" "$CARD_PNG"
node "$ROOT/render_arc_demo_cards.mjs" "$CARDS"
for card in "$CARDS"/*.svg; do
  base="$(basename "$card" .svg)"
  sips -s format png "$card" --out "$CARD_PNG/$base.png" >/dev/null
done

scene() {
  local id="$1"
  local duration="$2"
  local title="$3"
  local subtitle="$4"
  local body="$5"
  local narration="$6"
  local bg="$7"

  say -v Daniel -r 175 -o "$TMP/$id.aiff" "$narration"

  ffmpeg -hide_banner -loglevel error -y \
    -loop 1 -i "$CARD_PNG/$id.png" \
    -i "$TMP/$id.aiff" \
    -filter_complex "[1:a]apad,atrim=duration=$duration[a]" \
    -map 0:v -map "[a]" -t "$duration" \
    -c:v libx264 -preset medium -crf 22 -pix_fmt yuv420p \
    -c:a aac -b:a 128k -movflags +faststart "$TMP/$id.mp4"
}

scene "01" "20" \
  "Arc USDC Rebalancer" \
  "DeFi Treasury automation on Arc" \
  $'Watch the balance.\nApply a policy band.\nProduce a bounded action pack.' \
  "Arc USDC Rebalancer is a policy-driven USDC treasury workflow built for the DeFi track. It reads treasury state and policy, then turns that state into a clear, reviewable decision." \
  "0b1726"

scene "02" "30" \
  "The operator question" \
  "Hold, top up, trim, or review?" \
  $'One input surface\nCurrent balance + policy\nEvidence before execution' \
  "Treasury operations should not start with a blind transaction. The operator needs to know why a decision was made, how much is bounded by policy, and whether the live dependencies are actually ready." \
  "101f32"

scene "03" "45" \
  "Live readiness report" \
  "The public dashboard works without a wallet" \
  $'500.00 USDC current balance\n100.00 minimum  /  500.00 target  /  200.00 max rebalance\nDecision: HOLD  |  Confidence: 92%' \
  "On the production dashboard, the default preview state is five hundred USDC at the target. The report says Hold with ninety two percent confidence. The page also shows the onchain policy source, Circle readiness, wallet set, executor address, onchain identity evidence, and a copyable action pack." \
  "0b1726"

scene "04" "35" \
  "Three policy scenarios" \
  "The decision changes with the balance" \
  $'BELOW MINIMUM        AT TARGET        ABOVE TARGET\nTOP UP                HOLD             TRIM\nBounded by policy     No tx needed     Bounded by policy' \
  "The same report-first flow handles the three important states. Below the minimum, it recommends a bounded top up. At the target, it holds and sends nothing. Above the target, it recommends a bounded trim. These are previews, not pretend transactions." \
  "101f32"

scene "05" "30" \
  "Arc and Circle evidence" \
  "Execution stays optional and gated" \
  $'Arc Testnet policy loaded\nCircle developer-controlled wallet ready\nTreasuryExecutor configured\nOperator wallet required for signed execution' \
  "The production build connects the decision to Arc Testnet policy state, a TreasuryExecutor, onchain identity evidence, and Circle developer-controlled wallet readiness. The public deployment keeps the signed path disabled." \
  "0b1726"

scene "06" "20" \
  "A safe operator handoff" \
  "Preview first. Sign only when the gates pass." \
  $'Dashboard: web-eight-chi-99.vercel.app/dashboard\nCase study: web-eight-chi-99.vercel.app/case-study\nRepo: github.com/sin199/arc-usdc-rebalancer' \
  "Arc USDC Rebalancer makes the next action legible before it becomes executable. The public dashboard, case study, and repository are available for review. The current public preview is Hold, and no transaction is claimed." \
  "101f32"

printf "file '%s/%s'\n" "$TMP" "01.mp4" > "$TMP/concat.txt"
for n in 02 03 04 05 06; do printf "file '%s/%s.mp4'\n" "$TMP" "$n" >> "$TMP/concat.txt"; done
ffmpeg -hide_banner -loglevel error -y -f concat -safe 0 -i "$TMP/concat.txt" \
  -c:v libx264 -preset medium -crf 22 -pix_fmt yuv420p \
  -c:a aac -b:a 128k -movflags +faststart "$OUT"

ffprobe -v error -show_entries format=duration,size -of default=noprint_wrappers=1 "$OUT"
