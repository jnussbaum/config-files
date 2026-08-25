#!/usr/bin/env bash
# Detects Claude Code topic questions and injects a reminder to fetch current docs.
# Runs as a UserPromptSubmit hook — fast grep, no LLM calls.
set -euo pipefail

PROMPT=$(jq -r '.prompt // ""')

PATTERN='(claude[\s_-]?code|claude[\s_-]?sdk|\.claude/|settings\.json|settings\.local\.json|UserPromptSubmit|PreToolUse|PostToolUse|\bhook(s)?\b|mcpServers|\.mcp\.json|mcp[\s_-]server|\bplugin(s)?\b|plugin\.json|marketplace\.json|SKILL\.md|slash[\s_-]?command|/memory\b|/config\b|/doctor\b|bypassPermissions|compaction|worktree|scheduled[\s_-]?task|fast[\s_-]?mode|effort[\s_-]?level|extended[\s_-]?thinking|code\.claude\.com)'

if echo "$PROMPT" | grep -qiE "$PATTERN"; then
  jq -n '{
    "hookSpecificOutput": {
      "hookEventName": "UserPromptSubmit",
      "additionalContext": "IMPORTANT: This question involves Claude Code features. Your training knowledge may be outdated. Before answering, fetch the current documentation using the WebFetch tool. Key URLs: hooks=https://code.claude.com/docs/en/hooks, settings=https://code.claude.com/docs/en/settings, mcp=https://code.claude.com/docs/en/mcp, plugins=https://code.claude.com/docs/en/plugins-reference, commands=https://code.claude.com/docs/en/commands, permissions=https://code.claude.com/docs/en/permissions. Browse the index at https://code.claude.com/docs/llms.txt to find other pages. Always prefer live docs over training knowledge for Claude Code topics."
    }
  }'
fi

exit 0
