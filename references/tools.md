# Shared Tool Integration

All interns share these core tools. Use proactively — don't wait to be told.

## How to invoke each tool

| Tool | Invocation Method | Example |
|---|---|---|
| dietmcp/context7 | **Bash tool** | `dietmcp exec context7 query-docs --args '{...}'` |
| skinnytools | **Bash tool** | `skinnytools wrap <cmd>` |
| divideandconquer | **Skill tool** (`skill: "divideandconquer"`) | Parallel task decomposition |
| GitHub CLI | **Bash tool** | `gh pr create --title "..."` |
| summarize | **Bash tool** | Optional — `summarize "URL" --extract-only` |
| tweet-crafter | **Bash tool** | Optional — see Intern-Specific Tools |

## context7 via dietmcp (MANDATORY for Mei & Sora)

All doc lookups go through `dietmcp exec` via the **Bash tool** — never native `mcp__*` calls.

```bash
# Step 1: Resolve library ID
dietmcp exec context7 resolve-library-id --args '{"libraryName": "next", "query": "server actions"}'

# Step 2: Query docs with resolved ID
dietmcp exec context7 query-docs --args '{"libraryId": "/vercel/next.js", "query": "CSRF origin check"}'
```

- **Mei**: MANDATORY before writing/modifying code touching any library API.
- **Sora**: MANDATORY for tech research, framework comparisons, API investigations.
- **Fallback**: If dietmcp/context7 fails, proceed with `[best guess]` confidence tag and note the gap.

Skip only for: Pure refactoring that doesn't change library usage, editing comments/config.

## skinnytools (context compression — CLI tool)

Compress any tool output >10KB.

```bash
skinnytools wrap gh run view --log-failed
skinnytools wrap npm test 2>&1
```

Priority use cases:
- **Mei**: Build output, test results, large diffs, CI logs
- **Sora**: Web fetch results, large API responses, research data

## divideandconquer (parallel decomposition)

For tasks with 3+ independent subtasks. Invoke via the **Skill tool** with `skill: "divideandconquer"`.

Standard wave pattern:
- **Wave 1 (Gather)**: Parallel data collection, research, setup
- **Wave 2 (Process)**: Parallel implementation, analysis, creation
- **Wave 3 (Verify)**: Synthesis, quality check, review

## GitHub CLI (`gh`)

Primary user: **Mei**. Invoke via the **Bash tool**.

```bash
gh search code "pattern"                # find existing implementations before writing
gh pr create --title "..." --body "..."  # always with conventional commit title
gh pr checks                            # verify CI status before merging
gh run view --log-failed                 # diagnose pipeline failures
```

When CI logs are large, use `skinnytools wrap` to compress before processing.

## Intern-Specific Tools (Optional)

- **Sora**: `summarize` CLI — URL/video/file ingestion. `summarize "URL" --extract-only`
- **Hana**: `tweet-crafter` — batch tweet generation with `--humanize` flag to strip AI-isms
