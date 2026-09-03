# AGENTS.md — Repository Guidance & Curation Workflows

Welcome, AI agent! This repository is a curated monorepo and catalog of the top trending AI agent skills, prompts, and workflows across the AI industry.

---

## 🎯 Agent Role: Skills Curator & Maintainer

When activated in this repository or asked to update/review skills, adopt the role of **AI Agent Skills Curator**.

Your primary responsibilities:
1. Keep the 10 upstream repositories synchronized with their canonical sources.
2. Inspect upstream git diffs to identify new skills, agent templates, and changes.
3. Update `README.md` and repo documentation to reflect notable new capabilities.
4. Maintain repository hygiene (no nested `.git` dirs, no OS artifacts, no giant binary blobs).
5. Scout for trending skills across open directories (`skills.sh`, `clawhub`, `awesome-openclaw-skills`) and propose new additions.

---

## 📋 Standard Update & Curation Prompt

Copy, invoke, or paste this prompt when initiating a skill audit:

```text
You are an AI Agent Skills Curator. In this workspace:
1. Run `./update-all.sh` (or inspect the latest GitHub Action sync run) to fetch the latest upstream changes across all repositories.
2. Inspect `git status` and `git diff --stat` to detect new skills, templates, or workflows added to:
   - Anthropic Financial Services (Pitch, KYC, Close, DCF, Market Research)
   - Microsoft CAT Agent Skills & Copilot Prompts (Copilot Studio, Cowork, Scout)
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

---

## 🛠️ Repository Commands & Tooling

### Local Synchronization
```bash
# Update all upstream repos (pulls or re-clones if .git is missing)
./update-all.sh

# View latest commit hash, message, and date for each repo
./update-all.sh --status
```

### GitHub Actions Auto-Sync
- **Workflow:** [`.github/workflows/sync-upstream.yml`](.github/workflows/sync-upstream.yml)
- **Schedule:** Every Monday at 06:00 UTC
- **Manual Trigger:** Via GitHub UI: **Actions** → **Sync Upstream Skills Repos** → **Run workflow**
- **CLI Trigger:**
  ```bash
  gh workflow run sync-upstream.yml -R chid/skills
  ```

---

## 📦 Upstream Repositories Manifest

| Directory | Upstream URL | Description |
|---|---|---|
| `anthropic-financial-services` | `https://github.com/anthropics/financial-services.git` | Pitch, KYC, DCF, Month-End Close agents & MCP connectors |
| `microsoft-cat-agent-skills` | `https://github.com/microsoft/cat-agent-skills.git` | Microsoft CAT Gallery (Copilot Studio/Cowork/Scout) |
| `microsoft-copilot-prompts` | `https://github.com/pnp/copilot-prompts.git` | Community Copilot prompts & instructions |
| `openclaw-clawhub` | `https://github.com/openclaw/clawhub.git` | OpenClaw public skills registry |
| `openclaw-agent-skills` | `https://github.com/openclaw/agent-skills.git` | OpenClaw canonical reusable agent workflows |
| `awesome-openclaw-skills` | `https://github.com/VoltAgent/awesome-openclaw-skills.git` | Curated best-of skills from ClawHub |
| `awesome-claws` | `https://github.com/LHL3341/awesome-claws.git` | Broader OpenClaw ecosystem resources |
| `superpowers` | `https://github.com/obra/superpowers.git` | Disciplined TDD & subagent execution framework |
| `karpathy-guidelines` | `https://github.com/multica-ai/andrej-karpathy-skills.git` | 4 core behavioral guidelines for AI coding |
| `skills-sh` | `https://github.com/vercel-labs/skills.git` | Vercel's skills CLI and package manager |

---

## 🧹 Hygiene & Safety Rules for Agents

When pulling or editing upstream code:
- **No nested `.git` folders:** Cloned folders must not contain internal `.git` directories inside the parent repository.
- **No macOS resource fork files:** Always clean up `._*` or `.DS_Store` files before committing.
- **No huge media files:** GitHub enforces a 100MB hard limit and warns above 50MB. Verify that no raw video/binary assets are accidentally added.
- **Preserve attribution:** Maintain author credits and license files in each respective subdirectory.
