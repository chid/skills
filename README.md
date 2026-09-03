# 🧠 AI Agent Skills Collection

> A curated collection of the top trending AI agent skill repositories, cloned locally for research and reference.  
> Last cloned: **2026-09-03**

---

## 🔄 Auto-Sync

This repo **automatically syncs** all upstream sources every Monday via [GitHub Actions](.github/workflows/sync-upstream.yml).

- **Schedule:** Weekly (Monday 06:00 UTC)
- **Manual trigger:** Go to Actions → "Sync Upstream Skills Repos" → Run workflow
- **What it does:** Shallow-clones each upstream repo, replaces the local copy, and commits any changes

You can also update locally:

```bash
./update-all.sh            # pull latest (re-clones if needed)
./update-all.sh --status   # check current commit info
```

---

## 📁 Repository Index

### Anthropic — Financial Services
| | |
|---|---|
| **Local** | `anthropic-financial-services/` |
| **Source** | https://github.com/anthropics/financial-services |
| **Focus** | Investment banking, wealth management, compliance |
| **Highlights** | Pitch Agent, KYC Screener, Month-End Close, DCF/Comps, Market Research Agent. MCP connectors for S&P Global, Kensho, PitchBook, Databricks, Snowflake. Slash commands (`/dcf`, `/comps`). Deployable as Claude Cowork plugins or headless Managed Agents. |

### Microsoft — CAT Agent Skills Gallery
| | |
|---|---|
| **Local** | `microsoft-cat-agent-skills/` |
| **Source** | https://github.com/microsoft/cat-agent-skills |
| **Gallery** | https://microsoft.github.io/cat-agent-skills/ |
| **Focus** | Copilot Studio, Copilot Cowork, Microsoft Scout |
| **Highlights** | Hundreds of community skills: document processing (PDF/DOCX/PPTX), data viz (charts, Monte Carlo), governance/compliance, brand enforcement, Agent Harness Explorer. All follow the `SKILL.md` standard. |

### Microsoft — Community Copilot Prompts
| | |
|---|---|
| **Local** | `microsoft-copilot-prompts/` |
| **Source** | https://github.com/pnp/copilot-prompts |
| **Focus** | M365 Copilot prompts, agent instructions, skills |
| **Highlights** | Community-validated prompts categorized by job type (Sales, HR, Finance) and task (Analyze, Draft, Classify). Works across M365 Copilot, GitHub Copilot, Copilot Studio. |

### OpenClaw — ClawHub Registry
| | |
|---|---|
| **Local** | `openclaw-clawhub/` |
| **Source** | https://github.com/openclaw/clawhub |
| **Focus** | Open-source public skills registry |
| **Highlights** | Thousands of community-built skills. Install via `openclaw skills install <slug>` or `npx clawhub install <slug>`. |

### OpenClaw — Canonical Agent Skills
| | |
|---|---|
| **Local** | `openclaw-agent-skills/` |
| **Source** | https://github.com/openclaw/agent-skills |
| **Focus** | Official reusable agent workflows |
| **Highlights** | Review closeout, remote validation, and other canonical patterns from the OpenClaw team. |

### OpenClaw — Awesome Skills (Curated)
| | |
|---|---|
| **Local** | `awesome-openclaw-skills/` |
| **Source** | https://github.com/VoltAgent/awesome-openclaw-skills |
| **Focus** | Curated "best of" from ClawHub |
| **Highlights** | Filtered, categorized, high-quality verified skills — saves you from sifting through the full registry. |

### OpenClaw — Awesome Claws (Ecosystem)
| | |
|---|---|
| **Local** | `awesome-claws/` |
| **Source** | https://github.com/LHL3341/awesome-claws |
| **Focus** | Broader OpenClaw ecosystem |
| **Highlights** | Plugins, communities, resources, tutorials — beyond just skills. |

### Superpowers
| | |
|---|---|
| **Local** | `superpowers/` |
| **Source** | https://github.com/obra/superpowers |
| **Author** | Jesse Vincent |
| **Focus** | Disciplined dev workflow: Design → Plan → TDD → Implement |
| **Highlights** | #1 most-starred skills framework. Enforces Red-Green-Refactor TDD. Dispatches subagents for parallel implementation with two-stage review (spec compliance + code quality). Works with Claude Code, Cursor, Codex, Gemini CLI, GitHub Copilot CLI. |

### Karpathy Guidelines
| | |
|---|---|
| **Local** | `karpathy-guidelines/` |
| **Source** | https://github.com/multica-ai/andrej-karpathy-skills |
| **Focus** | Behavioral coding guidelines |
| **Highlights** | Four core rules: (1) Think before coding, (2) Simplicity first, (3) Surgical changes only, (4) Goal-driven execution. Drop as `CLAUDE.md` or load as a `SKILL.md`. |

### Skills.sh (Vercel)
| | |
|---|---|
| **Local** | `skills-sh/` |
| **Source** | https://github.com/vercel-labs/skills |
| **Website** | https://skills.sh |
| **Focus** | CLI tool & directory for agent skills |
| **Highlights** | The "npm for agent skills." Install any skill from GitHub with `npx skills add <owner/repo>`. Cross-platform: Claude Code, Cursor, Windsurf, GitHub Copilot. Skill Packs for bulk install. |




## 🔍 Discovery — Finding More Skills

| Platform | URL | Notes |
|---|---|---|
| **skills.sh** | https://skills.sh | Vercel-backed, largest open directory |
| **ClawHub** | https://github.com/openclaw/clawhub | OpenClaw registry |
| **Microsoft CAT Gallery** | https://microsoft.github.io/cat-agent-skills/ | Enterprise-focused |
| **Agensi** | https://agensi.dev | Security-scanned, curated |
| **Skillselion** | https://skillselion.com | Catalog of 82K+ tools / 60K skills |

---

## 📋 Quick Reference — What to Use When

| Need | Go to |
|---|---|
| Financial modeling / IB workflows | `anthropic-financial-services/` |
| Enterprise M365 / Copilot | `microsoft-cat-agent-skills/` + `microsoft-copilot-prompts/` |
| Browsing thousands of open skills | `openclaw-clawhub/` |
| Quality-filtered open skills | `awesome-openclaw-skills/` |
| Disciplined TDD dev workflow | `superpowers/` |
| Simple behavioral guard-rails | `karpathy-guidelines/` |
| Installing skills from any GitHub repo | `skills-sh/` (use `npx skills add`) |

---

## 🤖 Prompt for AI Agents to Update & Curate Skills

Copy and paste this prompt into any AI coding assistant (Antigravity, Claude Code, Cursor, Copilot) to audit, update, and discover new skills:

```text
You are an AI Agent Skills Curator. In this workspace:
1. Run `./update-all.sh` (or trigger the GitHub Actions workflow) to fetch the latest upstream changes across all repositories.
2. Inspect `git status` and `git diff --stat` to detect new skills, templates, or workflows added to:
   - Anthropic Financial Services (Pitch, KYC, Close, DCF)
   - Microsoft CAT Agent Skills & Copilot Prompts
   - OpenClaw ClawHub, Canonical Skills & Awesome Lists
   - Superpowers Framework (TDD & subagent execution)
   - Karpathy Guidelines
   - Skills.sh (Vercel)
3. For any noteworthy changes or new additions:
   - Summarize the top new capabilities, tools, and workflows.
   - Update README.md with any new highlights, tools, or version updates.
   - Ensure clean hygiene (remove nested .git, OS metadata, or oversized assets).
4. Check the latest trending skills on skills.sh and ClawHub. If any new viral or high-utility skills emerged, propose adding them to update-all.sh and .github/workflows/sync-upstream.yml.
```
