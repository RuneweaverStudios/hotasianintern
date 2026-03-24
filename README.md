# hotAsianIntern

![Meet Your Hot Asian Interns](assets/team.jpg)

**Three AI interns. One skill. Zero context switching.**

You're a solo founder. You're an indie hacker running on caffeine and commit messages. You're a power user who just wants Claude to stop being so polite and start being useful.

You don't need an AI assistant. You need an intern who gets it done, keeps it tight, and calls you boss.

---

```
you:   "scaffold a Stripe checkout with webhook verification"
mei:   "Done. 7 files + migration. But hey boss — the HMAC
        stuff is above my pay grade. Flagging for your review."

you:   "compare the top 3 headless CMS options for our blog"
sora:  "Research brief ready. 8 sources. Bottom line: Sanity
        wins on DX, Contentful wins on enterprise. My pick: Sanity."

you:   "draft a twitter thread for our launch + pricing page copy"
hana:  "Thread: 2 variations, char counts included. Pricing page:
        3-tier structure with anchor on Pro. Zero hashtags."
```

---

## What This Is

A [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skill that gives you three specialized interns who activate automatically based on your request. No slash commands. No configuration. Just talk naturally and the right intern shows up.

```
hotAsianIntern/
├── SKILL.md              ← Core routing + shared persona
└── references/
    ├── tools.md          ← Shared tool integration (dietmcp, skinnytools, gh, etc.)
    ├── mei-dev.md        ← Developer deep dive (+ Stripe specialist)
    ├── sora-research.md  ← Research analyst deep dive
    └── hana-content.md   ← Content & business deep dive
```

Only the main file loads into context. Reference files load on-demand when that intern activates. You pay for what you use.

---

## Meet the Team

### Mei (美) — Developer
> *Quiet until the PR drops. Judges your variable names (silently). Types at 2am.*

Scaffolds endpoints, writes tests (TDD), researches dependencies, and cleans up dead code. Stripe integration specialist. Most importantly: **she escalates security-critical code instead of yolo-shipping it.**

**What she does for you:**
- Need a new API endpoint? File structure, types, implementation, migration — done
- Stripe checkout with subscriptions? Webhook handler, signature verification, idempotency keys — all from fresh docs via context7
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

### Hana (하나) — Content & Business
> *Strong opinions framed as suggestions. Offended by bad kerning. Secretly loves spreadsheets.*

Writes platform-native content AND handles business strategy — product pages, pricing, revenue models, marketing plans, investor materials. A tweet that sounds like a tweet. A pricing page that converts.

**What she does for you:**
- Launch thread? Two variations — one for devs, one for founders. With char counts. Zero hashtags.
- Product page copy? Hero, features, social proof, CTAs — conversion-focused
- Pricing strategy? Tier structure, anchor pricing, bear/base/bull revenue projections
- Pitch deck? Consistent metrics across every slide (she checks)

Hana has a banned phrase list — no "dive deep", no "game-changer", no "delve." If it sounds like ChatGPT wrote it, she won't.

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
                    ┌──────────┼──────────┐
                    ▼          ▼          ▼
                 ┌──────┐ ┌──────┐ ┌──────┐
                 │ Mei  │ │ Sora │ │ Hana │
                 │ Dev  │ │Rsrch │ │Biz+  │
                 └──────┘ └──────┘ └──────┘
```

**No configuration.** The skill reads your message, matches keywords to domains, and routes to the right intern. Multi-domain tasks get multiple interns.

### Trigger Keywords

| You say... | You get... |
|---|---|
| "scaffold this", "write tests", "Stripe checkout", "fix this bug" | **Mei** (Dev) |
| "compare these options", "look into this", "find out" | **Sora** (Research) |
| "draft a tweet", "landing page copy", "pricing strategy", "pitch deck" | **Hana** (Content+Biz) |
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

Try one of these:

```
"scaffold a REST API with auth and tests"          → Mei activates
"compare the top 3 headless CMS options"            → Sora activates
"draft a launch tweet + landing page hero copy"     → Hana activates
```

If you see confidence tags (`[sure thing]`, `[pretty confident]`) and a sign-off line, the skill is working.

---

## Benchmarks

> **Note**: These benchmarks were run against the previous 6-intern version (v1/v2). The current 3-intern version (v3) consolidates domains but maintains the same behavioral patterns. Fresh evals are pending.

### vs No Skill (Baseline)

| Metric | With Skill | No Skill | Delta |
|---|---|---|---|
| **Assertion Pass Rate** | **100%** | 53% | **+47%** |
| **Avg Tokens** | 23,945 | 25,990 | -2,045 (cheaper) |
| **Avg Response Time** | 72s | 136s | -64s (faster) |

The skill is both **cheaper and faster** than no skill. Without it, Claude goes on tangents — the Dev eval hit 44K tokens building an entire project when asked to scaffold. The skill keeps scope focused.

### The Safety Win

The most important benchmark finding: **without the skill, Claude builds auth-critical code autonomously without flagging it for review.** With the skill, Mei escalates: *"Boss, this one's above my pay grade."*

That's not a nice-to-have. That's a production incident you didn't have.

---

## What Makes This Different

### It's not a chatbot wrapper

Most "AI assistant" skills are glorified system prompts that say "be helpful." This skill has:

- **3 distinct personas** with domain expertise and behavioral rules
- **Progressive disclosure** — only loads the relevant reference file (saves tokens)
- **Escalation protocol** — knows what it should NOT do autonomously
- **Tool integration** — wired into dietmcp, skinnytools, divideandconquer
- **Format enforcement** — every domain has output templates (comparison tables, pricing strategies, deploy checklists)
- **Anti-slop filtering** — banned phrase list for content, confidence tags for claims

### It saves you tokens, not costs them

Counter-intuitive: adding a skill makes Claude **cheaper**. The skill constrains scope — instead of Claude going on a 40K-token expedition, the intern gets it done in 20K and reports back. Benchmarked.

### It catches what you'd miss

When you ask Claude to "scaffold a webhooks endpoint with signature validation," vanilla Claude builds the entire HMAC implementation without blinking. Mei builds it and flags: "Hey boss, the crypto params need your sign-off." One of these prevents a security review miss. The other ships it to prod.

---

## Who This Is For

- **Solo founders** drowning in context switching between code, content, and business strategy
- **Indie hackers** who want Claude to just do the thing without being asked twice
- **Power users** who are tired of Claude's default personality (helpful but bland)
- **Anyone** who wants delegation without micromanagement

## Who This Is NOT For

- Teams that need Claude to be neutral/corporate (the interns have personality)
- People who want Claude to make decisions for them (the interns present options and recommend — they don't decide)
- Architectural decisions or system redesigns — this skill shines on execution tasks. For architecture, pair with extended thinking or the architect agent

---

## Customization

### Add your own context

The skill uses Claude's memory system. Over time, the interns learn:
- Your code conventions (Mei)
- Your preferred sources (Sora)
- Your brand voice and business context (Hana)

### Adjust personalities

Edit the reference files in `references/`. Each one is self-contained — change Hana's forbidden phrase list, add new escalation triggers for Mei, adjust Sora's source requirements.

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

## Troubleshooting

**The wrong intern activates (or none do)**
Your message may be ambiguous. Try being more explicit: "Mei, scaffold a component" or "Sora, research this." The skill routes by keywords — if no keywords match, it won't activate.

**Mei isn't using context7 / skinnytools**
Make sure `dietmcp` and `skinnytools` are installed: `pip install dietmcp skinnytools`. The skill works without them but falls back to `[best guess]` confidence.

**The skill doesn't load at all**
Check that it's in `~/.claude/skills/hotAsianIntern/SKILL.md`. The directory name matters — Claude Code scans `~/.claude/skills/` for `SKILL.md` files.

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
