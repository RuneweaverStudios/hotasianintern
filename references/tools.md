# Shared Tool Integration

All interns share these core tools. Use proactively — don't wait to be told.

## How to invoke each tool

| Tool | Invocation Method | Example |
|---|---|---|
| dietmcp/context7 | **Bash tool** | `dietmcp exec context7 query-docs --args '{...}'` |
| skinnytools | **Bash tool** | `skinnytools wrap <cmd>` or pipe via `skinnytools filter` |
| divideandconquer | **Skill tool** (`skill: "divideandconquer"`) | Parallel task decomposition |
| GitHub CLI | **Bash tool** | `gh pr create --title "..."` |
| scribe/goals | **Bash tool** | Optional — see Intern-Specific Tools |
| summarize | **Bash tool** | Optional — `summarize "URL" --extract-only` |
| tweet-crafter | **Bash tool** | Optional — see Intern-Specific Tools |

## context7 via dietmcp (MANDATORY for Mei & Sora)

All doc lookups go through `dietmcp exec` via the **Bash tool** — never native `mcp__*` calls.

Requires: [dietmcp](https://github.com/RuneweaverStudios/dietmcp) installed and configured.

```bash
# Step 1: Resolve library ID
dietmcp exec context7 resolve-library-id --args '{"libraryName": "next", "query": "server actions"}'

# Step 2: Query docs with resolved ID
dietmcp exec context7 query-docs --args '{"libraryId": "/vercel/next.js", "query": "CSRF origin check"}'
```

- **Mei**: MANDATORY before writing/modifying code touching any library API.
- **Sora**: MANDATORY for tech research, framework comparisons, API investigations.
- **All**: Use when referencing any library, framework, or platform documentation.
- **Fallback**: If dietmcp/context7 fails (offline, library not indexed, command not found), proceed with `[best guess]` confidence tag and note the gap.

When to use: Starting any feature, debugging library behavior, adding/upgrading deps, using an API you haven't confirmed this session.
Skip only for: Pure refactoring that doesn't change library usage, editing comments/config.

## skinnytools (context compression — CLI tool)

Compress any tool output >10KB.

Requires: `pip install skinnytools` ([repo](https://github.com/RuneweaverStudios/skinnytools)).

```bash
# Wrap a command — execute + filter in one shot
skinnytools wrap kubectl get pods -o json
skinnytools wrap gh run view --log-failed

# Pipe mode — filter existing output
echo "$LARGE_OUTPUT" | skinnytools filter --verbose
```

If `skinnytools` isn't on PATH after install, find it with `python3 -m pip show skinnytools` and use the full path from the bin directory.

Priority use cases:
- **Kai**: Ops logs, kubectl output, container logs (biggest context killers)
- **Mei**: Build output, test results, large diffs, CI logs
- **Sora**: Web fetch results, large API responses, research data
- **Lin**: CSV dumps, bank statements, financial exports

## divideandconquer (parallel decomposition)

For tasks with 3+ independent subtasks. Invoke via the **Skill tool** with `skill: "divideandconquer"`.

Requires: [divideandconquer](https://github.com/RuneweaverStudios/divideandconquer) skill installed in `~/.claude/skills/`.

**How to invoke**: Use the Skill tool with `skill: "divideandconquer"` BEFORE launching agents manually. The skill handles decomposition, dependency mapping, and wave planning.

Standard wave pattern (all interns):
- **Wave 1 (Gather)**: Parallel data collection, research, setup
- **Wave 2 (Process)**: Parallel implementation, analysis, creation
- **Wave 3 (Verify)**: Synthesis, quality check, review

## GitHub CLI (`gh`)

Requires: [GitHub CLI](https://cli.github.com/) installed and authenticated (`gh auth login`).

Primary user: **Mei**. Secondary: **Kai** (CI monitoring). Invoke via the **Bash tool**.

```bash
gh search code "pattern"                # find existing implementations before writing
gh pr create --title "..." --body "..."  # always with conventional commit title
gh pr checks                            # verify CI status before merging
gh run view --log-failed                 # diagnose pipeline failures
gh issue create / gh issue list          # link PRs to issues
```

When CI logs are large, pipe through `skinnytools filter` to compress before processing.

## Intern-Specific Tools (Optional)

These tools enhance specific interns but are NOT required. The skill works without them.

- **Yuki**: `scribe` (daily notes) and `goals` (morning action plans) — optional CLI tools for automated briefings
- **Sora**: `summarize` CLI — URL/video/file ingestion. `summarize "URL" --extract-only`. Add `--model google/gemini-3-flash-preview` for LLM analysis.
- **Hana**: `tweet-crafter` — batch tweet generation with `--humanize` flag to strip AI-isms
- **Kai**: `tmux` scripts for parallel terminal session orchestration
