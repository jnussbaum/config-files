# Git Workflow — Conditional Rules

## When You Ask for Commit/Push on a Feature Branch

- Commit directly to that branch, do not create a separate feature branch off it.
- Then push unless you say don't.
- The commit message should read well as a PR title on squash-merge repos.

## Running git Commands Under the Sandbox

- Never prefix a git command with `cd <path> &&`. `sandbox.excludedCommands` matches
  `git *` by prefix, so a leading `cd` defeats the match and pulls git back under full
  sandboxing (blocked SSH agent, blocked `~/.ssh` reads).
- Use `git -C <path> ...`, or rely on the Bash tool's already-correct working
  directory, instead.
- More generally: any shell metacharacter in the command line (`;`, `&&`, `|`, or
  `$(...)` command substitution) can defeat the same match, not just a leading `cd` —
  for example `git commit -m "$(cat <<'EOF' ...)"` fails the same way a leading `cd`
  does, while `git commit -F <message-file>` succeeds. The same applies to `gh`:
  chaining `gh auth status; gh pr list ...` sandboxes the second call even though the
  string starts with `gh`.
- Run one plain `git`/`gh` invocation per Bash call, with no shell operators in it.
  For a multi-line commit or PR body, write it to a scratch file first and pass it
  with `-F`/`--body-file` instead of inlining it.
