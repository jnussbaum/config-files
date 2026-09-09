#!/usr/bin/env bash
# Reminds Claude to write skills, agents, and commands as goals, not step-by-step scripts.
set -euo pipefail

INPUT=$(cat)
EVENT=$(jq -r '.hook_event_name // ""' <<< "$INPUT")

MSG='IMPORTANT: This involves authoring a Claude Code component — a skill, an agent, a command, a hook, or a plugin. Read ~/.claude/tech-preferences/claude-code-components.md before you write any component text. State the outcome, the guardrails, and the intent. Do not write an imperative step-by-step procedure unless the reader runs the sections in a real sequence.'

emit() {
  jq -n --arg event "$1" --arg ctx "$2" \
    '{"hookSpecificOutput": {"hookEventName": $event, "additionalContext": $ctx}}'
}

case "$EVENT" in
  UserPromptSubmit)
    PROMPT=$(jq -r '.prompt // ""' <<< "$INPUT")
    VERB='(writ|creat|author|draft|add|edit|updat|refactor|review|improv|tweak|scaffold|generat)'
    NOUN='(skill|sub-?agent|agent|slash[\s_-]?command|plugin|SKILL\.md|output[\s_-]?style|hook)'
    if grep -qiE "$VERB" <<< "$PROMPT" && grep -qiE "$NOUN" <<< "$PROMPT"; then
      emit "UserPromptSubmit" "$MSG"
    fi
    ;;
  PostToolUse)
    FILE=$(jq -r '.tool_input.file_path // ""' <<< "$INPUT")
    case "$FILE" in
      */SKILL.md|*/agents/*.md|*/commands/*.md|*/skills/*.md)
        SESSION=$(jq -r '.session_id // "unknown"' <<< "$INPUT")
        MARKER="${TMPDIR:-/tmp}/claude-component-style-nudge-${SESSION}"
        if [[ ! -f "$MARKER" ]]; then
          touch "$MARKER"
          emit "PostToolUse" "$MSG"
        fi
        ;;
    esac
    ;;
esac

exit 0
