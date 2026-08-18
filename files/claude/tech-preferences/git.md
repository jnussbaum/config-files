# Git Workflow — Conditional Rules

The unconditional workflow rules 
(pull before working, commit automatically, branch before main, never push without asking, 
assign PRs to you, focus PR descriptions on code not history) 
are now in the main CLAUDE.md.

This file holds only the conditional rules and stack-specific exceptions:

## When You Ask for Commit/Push on a Feature Branch

- Commit directly to that branch, do not create a separate feature branch off it.
- Then push unless you say don't.
- The commit message should read well as a PR title on squash-merge repos.
