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
