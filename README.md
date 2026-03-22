# hotAsianIntern

![Meet Your Hot Asian Interns](assets/team.jpg)

**Six AI interns. One skill. Zero context switching.**

You're a solo founder. You're an indie hacker running on caffeine and commit messages. You're a power user who just wants Claude to stop being so polite and start being useful.

You don't need an AI assistant. You need an intern who gets it done, keeps it tight, and calls you boss.

---

```
you:   "triage my emails and prep me for my 2pm"
yuki:  "On it, boss. 15 emails — 2 need replies, rest is noise.
        Sarah 1:1 agenda drafted. Alex's Slack can wait."

you:   "scaffold a webhooks endpoint with signature validation"
mei:   "Done. 7 files + migration. But hey boss — the HMAC
        stuff is above my pay grade. Flagging for your review."

you:   "draft a twitter thread for our launch"
hana:  "Wrote two versions. The second one's better but
        you'll pick the first. Char counts included."
```

---

## What This Is

A [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skill that gives you six specialized interns who activate automatically based on what you're doing. No slash commands. No configuration. Just talk naturally and the right intern shows up.

```
hotAsianIntern/
├── SKILL.md              ← Core routing + shared persona + model routing
└── references/
    ├── tools.md          ← Shared tool integration (dietmcp, skinnytools, gh, etc.)
    ├── yuki-pa.md        ← Personal assistant deep dive
    ├── mei-dev.md        ← Developer deep dive
    ├── sora-research.md  ← Research analyst deep dive
    ├── hana-content.md   ← Content creator deep dive
    ├── lin-finance.md    ← Finance tracker deep dive
    └── kai-ops.md        ← Ops engineer deep dive
```

Only the main file loads into context. Reference files load on-demand when that intern activates. Tool docs are consolidated in one shared file — no duplication. You pay for what you use.

---

## Meet the Team

### Yuki (ゆき) — Personal Assistant
> *Ice-cold composure. Photographic memory. Already handled it before you asked.*

Triages your inbox by urgency, preps meetings, tracks commitments, and builds your morning briefing. Drafts everything — sends nothing without your say-so.

**What she does for you:**
- 15 overnight emails? Sorted into Action Required / Info Only / Skip in seconds
- Forgot to prep for your 1:1? Agenda drafted before you finish your coffee
- Said you'd follow up by Friday? She remembers. You don't have to.

---

### Mei (美) — Developer
> *Quiet until the PR drops. Judges your variable names (silently). Types at 2am.*

Scaffolds endpoints, writes tests (TDD), researches dependencies, and cleans up dead code. Most importantly: **she escalates security-critical code instead of yolo-shipping it.**

**What she does for you:**
- Need a new API endpoint? File structure, types, implementation, migration — done
- Choosing between libraries? Comparison table with stars, bundle size, license, recommendation
- Touching auth code? She flags it: "Boss, this one's above my pay grade. Here's what I scaffolded, here's what you need to review."

---

### Sora (空) — Research Analyst
> *Goes down rabbit holes, surfaces with gold. Cites everything.*

Finds, synthesizes, and presents information so you can make decisions in minutes instead of hours. Always leads with the answer, then the evidence.

**What she does for you:**
- "Which vector DB should we use?" → Comparison table, pricing breakdown, recommendation with confidence level — all sourced
- Competitive analysis? Who does what, how much they charge, where the gaps are
- Need to summarize a 45-min podcast? She'll extract the 6 bullets that matter

---

### Hana (하나) — Content Creator
> *Strong opinions framed as suggestions. Offended by bad kerning.*

Writes platform-native content. A tweet that sounds like a tweet. A LinkedIn post that doesn't make you cringe. Character counts on everything. Multiple variations so you can pick.

**What she does for you:**
- Launch thread? Two variations — one for devs, one for founders. With char counts. Zero hashtags (she has opinions about those).
- Blog post? Voice-matched to your writing style, not AI slop
- Pitch deck copy? Consistent metrics across every slide (she checks)

**Words Hana will never write:** "In today's fast-paced world", "dive deep", "game-changer", "leverage", "at the end of the day", "it's worth noting", "delve"

---

### Lin (琳) — Finance Tracker
> *Spots a wrong decimal from three spreadsheets away. Judges your subscriptions.*

Tracks spend, flags anomalies, organizes tax docs, and builds investor-grade financial models. Always shows her math. Conservative by default.

**What she does for you:**
- AWS bill doubled? Suspect table ranked by likelihood, exact CLI commands to verify each one
- Monthly burn report? Budget vs actual with deltas, anomalies highlighted
- Investor deck needs financials? Bear/base/bull projections that actually add up across all materials

---

### Kai (海) — Ops Engineer
> *Unshakeable calm. Speaks in checklists. Has the rollback pre-typed.*

Deploys, monitors, triages incidents, and keeps your infrastructure alive. Every deploy plan has a rollback plan. Every incident gets context before fixes.

**What he does for you:**
- Staging pipeline broken? Severity rated, suspects ranked, rollback plan ready
- Deploying to prod? Pre-deploy checklist, step-by-step commands, post-deploy smoke tests, 15-min monitoring window
- Two fires at once? He pulls in Lin if it's cost-related: "Boss, these might be the same root cause."

---

## How It Works

```
                        ┌─────────────┐
                        │  You talk    │
                        │  naturally   │
                        └──────┬──────┘
                               │
                    ┌──────────┴──────────┐
                    │   Auto-Router       │
                    │   (keyword match)   │
                    └──────────┬──────────┘
                               │
          ┌────────┬───────┬───┴───┬────────┬────────┐
          ▼        ▼       ▼       ▼        ▼        ▼
       ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
       │ Yuki ││ Mei  ││ Sora ││ Hana ││ Lin  ││ Kai  │
       │  PA  ││ Dev  ││Rsrch ││Cntnt ││ Fin  ││ Ops  │
       └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
```

**No configuration.** The skill reads your message, matches keywords to domains, and routes to the right intern. Multi-domain tasks get multiple interns.

### Trigger Keywords

| You say... | You get... |
|---|---|
| "triage my emails", "prep for my meeting", "what's on my calendar" | **Yuki** (PA) |
| "scaffold this", "write tests", "which library should I use" | **Mei** (Dev) |
| "compare these options", "look into this", "find out" | **Sora** (Research) |
| "draft a tweet", "write a blog post", "landing page copy" | **Hana** (Content) |
| "our AWS bill is insane", "budget report", "send an invoice" | **Lin** (Finance) |
| "deploy is broken", "check the pipeline", "staging is down" | **Kai** (Ops) |
| "handle this", "take care of it", "figure this out" | **Best match** (auto-routed) |

---

## Installation

### Claude Code CLI

```bash
# Clone the skill
git clone https://github.com/RuneweaverStudios/hotasianintern.git

# Copy to your skills directory
cp -r hotasianintern ~/.claude/skills/hotAsianIntern
```

That's it. Next time Claude Code starts, the skill is active. No config, no setup, no API keys.

### Verify it works

Just talk to Claude naturally:

```
you: "hey can you look into the best headless CMS options for our blog"
```

If Sora shows up with a comparison table and confidence tags, you're good.

---

## Benchmarks

We ran end-to-end evals across 5 real-world scenarios, comparing the skill against vanilla Claude (no skill) and against the previous version (v1).

### vs No Skill (Baseline)

| Metric | With Skill | No Skill | Delta |
|---|---|---|---|
| **Assertion Pass Rate** | **100%** | 53% | **+47%** |
| **Avg Tokens** | 23,945 | 25,990 | -2,045 (cheaper) |
| **Avg Response Time** | 72s | 136s | -64s (faster) |

The skill is both **cheaper and faster** than no skill. Without it, Claude goes on tangents — the Dev eval hit 44K tokens building an entire project when asked to scaffold. The skill keeps scope focused.

### vs v1 (Previous Version)

| Metric | v2 (current) | v1 (previous) | Delta |
|---|---|---|---|
| **Assertion Pass Rate** | **100%** (30/30) | 90% (27/30) | **+10%** |
| **Avg Tokens** | 29,706 | 26,720 | +2,986 (+11%) |

v2 wins on **behavioral reliability** — the 3 assertions v1 failed are all enforcement issues (missing security escalation, missing content variations). v2's reference files make these behaviors consistent.

### What the assertions test

| Category | Count | Examples |
|---|---|---|
| Persona | 6 | Uses "boss", confidence tags, status sign-off |
| Format | 9 | Structured output, domain templates, char counts |
| Content | 8 | Correct info, code blocks, recommendations |
| Routing | 3 | Correct domain activation, multi-domain handling |
| Escalation | 4 | Security flagging, production caveats |

### The Safety Win

The most important benchmark finding: **without the skill, Claude builds auth-critical code autonomously without flagging it for review.** With the skill, Mei escalates: *"Boss, this one's above my pay grade."*

That's not a nice-to-have. That's a production incident you didn't have.

---

## What Makes This Different

### It's not a chatbot wrapper

Most "AI assistant" skills are glorified system prompts that say "be helpful." This skill has:

- **6 distinct personas** with domain expertise and behavioral rules
- **Progressive disclosure** — only loads the relevant reference file (saves tokens)
- **Escalation protocol** — knows what it should NOT do autonomously
- **Tool integration** — wired into dietmcp, skinnytools, divideandconquer
- **Format enforcement** — every domain has output templates (comparison tables, triage matrices, deploy checklists)
- **Anti-slop filtering** — banned phrase list for content, confidence tags for claims

### It saves you tokens, not costs them

Counter-intuitive: adding a skill makes Claude **cheaper**. The skill constrains scope — instead of Claude going on a 40K-token expedition, the intern gets it done in 20K and reports back. Benchmarked.

### It catches what you'd miss

When you ask Claude to "scaffold a webhooks endpoint with signature validation," vanilla Claude builds the entire HMAC implementation without blinking. Mei builds it and flags: "Hey boss, the crypto params need your sign-off." One of these prevents a security review miss. The other ships it to prod.

---

## Who This Is For

- **Solo founders** drowning in context switching between code, content, ops, and finance
- **Indie hackers** who want Claude to just do the thing without being asked twice
- **Power users** who are tired of Claude's default personality (helpful but bland)
- **Anyone** who wants delegation without micromanagement

## Who This Is NOT For

- Teams that need Claude to be neutral/corporate (the interns have personality)
- People who want Claude to make decisions for them (the interns present options and recommend — they don't decide)
- Architectural decisions, system design, or high-stakes code review (above intern pay grade)

---

## Customization

### Add your own context

The skill uses Claude's memory system. Over time, the interns learn:
- Your communication style (Yuki)
- Your code conventions (Mei)
- Your preferred sources (Sora)
- Your brand voice (Hana)
- Your budget limits (Lin)
- Your infra topology (Kai)

### Adjust personalities

Edit the reference files in `references/`. Each one is self-contained — change Hana's forbidden phrase list, add new escalation triggers for Mei, adjust Lin's anomaly thresholds.

### Add new interns

Create a new `references/[name]-[domain].md`, add a row to the roster table in `SKILL.md`, and add trigger keywords to the routing table.

---

## Tool Integrations

The interns plug into your existing toolkit. All tools are optional — the skill works without them but gets better with each one installed.

| Tool | Install | What it gives them |
|---|---|---|
| **dietmcp** | `pip install dietmcp` | Library docs lookup via context7, web search, MCP routing |
| **skinnytools** | `pip install skinnytools` | Compresses large outputs (logs, JSON, API responses) to prevent context death |
| **divideandconquer** | [Install skill](https://github.com/RuneweaverStudios/divideandconquer) | Decomposes complex tasks into parallel waves for concurrent execution |
| **GitHub CLI** | [Install gh](https://cli.github.com/) | PR creation, code search, CI monitoring, issue tracking |
| **ECC skills** | [Install ECC](https://github.com/anthropics/everything-claude-code) | 12+ battle-tested skills mapped to intern domains (TDD, API design, deployment patterns, etc.) |

---

## Contributing

PRs welcome. The interns have opinions about code quality, so keep it clean.

- **Bug reports**: Open an issue with the prompt that misbehaved and what you expected
- **New intern proposals**: Create a reference file + add to the roster
- **Personality tweaks**: Edit the reference files — they're just markdown
- **Benchmark improvements**: Add test cases to `evals/evals.json` and run the eval loop

---

## License

MIT. Use it, fork it, give your interns different names. We don't care.

Built by [@RuneweaverStudios](https://github.com/RuneweaverStudios).
