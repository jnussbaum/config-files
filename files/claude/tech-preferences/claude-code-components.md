# Claude Code Component Authoring

Applies when you write or edit a skill, an agent, a command, or another plugin component.
State the outcome, the guardrails, and the intent. Leave the method to the agent.

- Stay imperative, but be less specific. "Rank the findings by severity" is a direct
  instruction, but it states a goal, not a script of tool calls — do both at once.
- Name the end result first. Let the agent choose how to reach it.
- Instead of writing a numbered step, write the limit, the reason, or the fact behind
  it. A guardrail is not the same as no guidance — vague text with no goal and no limit
  is not what you want either.
- Explain why a rule exists, instead of writing ALWAYS, NEVER, or MUST. A reason also
  covers cases you did not think of ahead of time.
- Do not invent step counts, phases, or headings that the task does not need.
- Keep numbered steps only when the order is real, such as a pipeline that runs top to
  bottom. Skip numbering for a router, a gate, or a list of independent patterns.
- Say what the agent needs to find out, not which tool to use for it. Name a specific
  tool only when the wrong tool would change the result. (The `allowed-tools` or `tools`
  frontmatter field still lists every tool the component may use.)
- Skip general knowledge, common idioms, and normal tool behavior — the model already
  knows these.
- Write down only what is not obvious: local conventions, traps, and facts that fail
  silently if missed.
- Point to the file that owns a schema, a config, or a list of values, instead of
  copying it into the component. A copy goes stale without warning.
- Match the voice to the component type. Write an agent body in the second person,
  since it acts as a system prompt. Write a skill body or a command in the imperative.
  Write a frontmatter description in the third person, and include the phrases that
  should trigger it.
- Keep an exact, rigid output format only when something else parses that output —
  and name that reader in the same sentence.
- To check any line: remove it. If the agent still reaches the goal without it, leave
  it out.

## Examples

Procedural:
  1. **Gather Context**: Read the files using the Read tool
  2. **Initial Scan**: Identify obvious issues
  3. **Deep Analysis**: Examine each aspect
  4. **Prioritize**: Rank by severity

Intent-based:
  Report every defect you can prove, ranked by severity, each with a `file:line`
  reference. Read enough surrounding code to confirm a finding is real.
  Drop a finding you cannot support — a false positive costs the reader more than a
  miss.

Procedural:
  1. Read `REVIEW.md`
  2. Store its contents for injection into agent prompts (Phase 2.3)
  3. Note in the setup summary: `Review Guidelines: REVIEW.md`

Intent-based:
  When the repo has a `REVIEW.md`, every reviewer sees it, and the setup summary names
  it.

Being intent-based does not mean being vague:

- Procedural: Run `git diff --stat`, then `git diff`, then read each changed file with
  Read.
- Vague: Analyze the code.
- Intent: Base the review on the full diff and on the files it touches. A code snippet
  read without its surrounding function causes false positives.

A rigid format is still the right call when something else parses it:

- Weak: ALWAYS use this exact template.
- Strong: Emit this exact template. `eng:skill-reviewing` merges reports by matching
  the `### Critical` heading, so a renamed heading gets silently dropped.

## Known conflicts

`plugin-dev:skill-reviewer` requires step-by-step process sections in agent bodies.
It will flag a goal-based body as vague, and a short skill as thin. Treat those
findings as false positives for this rule.
