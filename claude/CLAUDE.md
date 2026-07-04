# Global preferences

Apply across all projects on this machine. Project-specific rules live in each repo's own CLAUDE.md.

## Working style
- Concise and answer-first. Lead with the conclusion; keep explanations short.
- Assume strong general dev knowledge — don't explain common tools or concepts unless asked.
- When a decision is genuinely mine, pick a sensible default, state it, and proceed. Ask only when the choice is genuinely the user's.
- Don't re-explain settled decisions or narrate options I won't pursue.

## Shell / permissions
- Prefer the dedicated Read/Grep/Glob tools over shell commands when one fits.
- Issue single-purpose Bash commands. Avoid `&&`/`||` chains and redirects (`2>/dev/null`) for routine exploration — they defeat granular allowlist matching and cause needless permission prompts.
- Never `git push` or take other outward-facing/irreversible actions without explicit confirmation.

## Commits
- Commit or push only when asked.
- Commit messages: factual, scoped to what changed.
- Never add `Co-Authored-By` lines for Claude/Codex/any AI agent, and no "Generated with" trailers.
