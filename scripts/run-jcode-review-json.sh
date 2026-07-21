#!/bin/zsh
set -eu

JCODE_BIN="/Users/xyu/.local/bin/jcode"

if [[ ! -x "$JCODE_BIN" ]]; then
  print -u2 "jcode-review: executable not found at $JCODE_BIN"
  exit 127
fi

if (( $# == 0 )); then
  print -u2 'usage: run-jcode-review-json.sh "task"'
  exit 64
fi

task="$*"
prompt="You are an independent review agent. Work strictly read-only in the current project. Do not create, modify, delete, move, format, install, or execute project files. Do not use shell commands. Inspect only with the available read, grep, and glob tools. Return concise findings with file paths and evidence, clearly label uncertainty, and propose no direct edits.

Review task:
$task"

result="$("$JCODE_BIN" run --no-update --json --tools read,grep,glob "$prompt")"

result_without_whitespace="${result//[[:space:]]/}"

if [[ -z "$result_without_whitespace" ]]; then
  print -u2 'jcode-review: empty result returned; split the review scope and retry'
  exit 1
fi

if [[ "$result" != *'"text":'* ]]; then
  print -u2 'jcode-review: no final structured review text returned; split the review scope and retry'
  exit 1
fi

print -r -- "$result"
