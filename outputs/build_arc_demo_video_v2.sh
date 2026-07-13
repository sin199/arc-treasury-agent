#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
TMP="/tmp/arc-v2"
CARDS="$TMP/cards"
CARD_PNG="$TMP/cards-png"
OUT="$ROOT/arc-treasury-agent-demo-v2.mp4"

mkdir -p "$CARDS" "$CARD_PNG" "$TMP/final"
node "$ROOT/render_arc_demo_cards.mjs" "$CARDS"
for card in "$CARDS"/*.svg; do
  base="$(basename "$card" .svg)"
  sips -s format png "$card" --out "$CARD_PNG/$base.png" >/dev/null
done

audio() {
  local id="$1"
  local narration="$2"
  say -v Daniel -r 170 -o "$TMP/$id.aiff" "$narration"
}

screen_segment() {
  local id="$1"
  local source="$2"
  local start="$3"
  local duration="$4"
  local narration="$5"
  audio "$id" "$narration"
  ffmpeg -hide_banner -loglevel error -y -ss "$start" -i "$source" -i "$TMP/$id.aiff" \
    -filter_complex "[0:v]setpts=PTS-STARTPTS,scale=1280:720:flags=lanczos,setsar=1[v];[1:a]apad,atrim=duration=$duration[a]" \
    -map "[v]" -map "[a]" -t "$duration" \
    -c:v libx264 -preset medium -crf 20 -pix_fmt yuv420p \
    -c:a aac -b:a 128k -ar 48000 -ac 2 "$TMP/final/$id.mp4"
}

card_segment() {
  local id="$1"
  local card="$2"
  local duration="$3"
  local narration="$4"
  audio "$id" "$narration"
  ffmpeg -hide_banner -loglevel error -y -loop 1 -i "$CARD_PNG/$card.png" -i "$TMP/$id.aiff" \
    -filter_complex "[0:v]setpts=PTS-STARTPTS[v];[1:a]apad,atrim=duration=$duration[a]" \
    -map "[v]" -map "[a]" -t "$duration" \
    -c:v libx264 -preset medium -crf 20 -pix_fmt yuv420p \
    -c:a aac -b:a 128k -ar 48000 -ac 2 "$TMP/final/$id.mp4"
}

card_segment "01-intro" "01" "16" \
  "Arc Treasury Agent is a report-first USDC treasury operator on Arc. This is the production dashboard, not a mock transaction flow."

screen_segment "02-home" "$TMP/01-top.mov" "0" "22" \
  "The dashboard starts in preview mode. It shows the Arc Testnet demo is ready, the onchain policy is loaded, Circle readiness is complete, and the TreasuryExecutor is configured. The operator can inspect the decision before connecting a signer."

screen_segment "03-below-input" "$TMP/02-below.mov" "0" "28" \
  "Now we test the first policy boundary. The real page changes the current balance to seventy five USDC, below the one hundred USDC minimum. The policy band remains visible, while execution stays locked because this is a preview."

screen_segment "04-below-evidence" "$TMP/05-below-report.mov" "12" "18" \
  "The report carries the live chain snapshot, Circle wallet set, executor, and agent identity as evidence. The action is bounded by policy and the page never pretends that a preview is a signed transaction."

screen_segment "05-above-input" "$TMP/07-above-correct.mov" "0" "26" \
  "The same production interface handles the opposite case. The current balance becomes seven hundred USDC, above the five hundred USDC target. The policy controls remain explicit so the operator can see exactly which state is being tested."

screen_segment "06-above-evidence" "$TMP/06-above-report.mov" "12" "18" \
  "Above target, the report recommends a bounded trim. The evidence panel still shows Circle readiness, the wallet set, the TreasuryExecutor, and the Arc agent identity. No funds move during this demo."

screen_segment "07-action-pack" "$TMP/04-report.mov" "8" "32" \
  "Finally, the at-target state returns Hold. The dashboard produces a copyable markdown report and action pack with chain ID, executor address, token address, and a zero-amount payload. The execution gate remains locked until an operator wallet is connected."

card_segment "08-outro" "06" "20" \
  "Arc Treasury Agent makes the next treasury action legible before it becomes executable. The public dashboard, case study, repository, and deck are ready for review."

ffmpeg -hide_banner -loglevel error -y \
  -i "$TMP/final/01-intro.mp4" \
  -i "$TMP/final/02-home.mp4" \
  -i "$TMP/final/03-below-input.mp4" \
  -i "$TMP/final/04-below-evidence.mp4" \
  -i "$TMP/final/05-above-input.mp4" \
  -i "$TMP/final/06-above-evidence.mp4" \
  -i "$TMP/final/07-action-pack.mp4" \
  -i "$TMP/final/08-outro.mp4" \
  -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0]concat=n=8:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 20 -pix_fmt yuv420p \
  -c:a aac -b:a 160k -ar 48000 -ac 2 -movflags +faststart "$OUT"

ffprobe -v error -show_entries format=duration,size -show_entries stream=codec_name,width,height,pix_fmt,sample_rate,channels \
  -of default=noprint_wrappers=1 "$OUT"
