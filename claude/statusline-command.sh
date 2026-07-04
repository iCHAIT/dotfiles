#!/bin/sh
input=$(cat)

model=$(echo "$input" | jq -r '.model.id // empty')
effort=$(echo "$input" | jq -r '.effort.level // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
root=$(basename "${cwd:-$PWD}")
branch=$(git -C "${cwd:-.}" branch --show-current 2>/dev/null)
transcript=$(echo "$input" | jq -r '.transcript_path // empty')

# Context window size (tokens). Opus 4.8 [1m] = 1,000,000; otherwise 200,000.
case "$model" in
  *"[1m]"*) ctx_limit=1000000 ;;
  *)        ctx_limit=200000 ;;
esac

# Tokens consumed in the current context = cumulative usage on the most recent
# main-chain assistant message in the transcript (input + cache + output).
used_tokens=""
if [ -n "$transcript" ] && [ -f "$transcript" ]; then
  used_tokens=$(jq -s '
    [ .[]
      | select(.type == "assistant")
      | select(.message.usage != null)
      | (.message.usage.input_tokens // 0)
        + (.message.usage.cache_read_input_tokens // 0)
        + (.message.usage.cache_creation_input_tokens // 0)
        + (.message.usage.output_tokens // 0)
    ] | last // empty' "$transcript" 2>/dev/null)
fi

yellow=$(printf '\033[33m')
green=$(printf '\033[32m')
blue=$(printf '\033[34m')
gray=$(printf '\033[90m')
reset=$(printf '\033[0m')

parts=""
append_part() {
  if [ -n "$parts" ]; then
    parts="$parts · $1"
  else
    parts="$1"
  fi
}

# model + effort  →  claude-opus-4-8[1m] high
if [ -n "$model" ]; then
  if [ -n "$effort" ]; then
    append_part "${yellow}${model} ${effort}${reset}"
  else
    append_part "${yellow}${model}${reset}"
  fi
fi

# root of current dir
if [ -n "$root" ]; then
  append_part "${blue}${root}${reset}"
fi

# git branch (if any)
if [ -n "$branch" ]; then
  append_part "${green}${branch}${reset}"
fi

# tokens consumed in current context + percentage
if [ -n "$used_tokens" ] && [ "$used_tokens" -gt 0 ] 2>/dev/null; then
  pct=$(echo "$used_tokens $ctx_limit" | awk '{printf "%.0f", ($1/$2)*100}')
  if [ "$used_tokens" -ge 1000 ]; then
    disp=$(echo "$used_tokens" | awk '{printf "%.1fk", $1/1000}')
  else
    disp="$used_tokens"
  fi
  append_part "${gray}${disp} (${pct}%)${reset}"
fi

echo "$parts"
