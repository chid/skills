#!/usr/bin/env bash
#
# update-all.sh — Pull latest changes for all cloned skill repos
#
# Usage:
#   ./update-all.sh           # update all repos
#   ./update-all.sh --status  # show current commit info for each repo
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── Repo manifest ───────────────────────────────────────────────────────────
# Format: local_dir|remote_url|description
REPOS=(
  "anthropic-financial-services|https://github.com/anthropics/financial-services.git|Anthropic — Financial services agent templates (Pitch, KYC, DCF, Close)"
  "microsoft-cat-agent-skills|https://github.com/microsoft/cat-agent-skills.git|Microsoft — CAT Agent Skills Gallery (Copilot Studio/Cowork/Scout)"
  "microsoft-copilot-prompts|https://github.com/pnp/copilot-prompts.git|Microsoft — Community copilot prompts & agent instructions"
  "openclaw-clawhub|https://github.com/openclaw/clawhub.git|OpenClaw — ClawHub public skills registry (thousands of skills)"
  "openclaw-agent-skills|https://github.com/openclaw/agent-skills.git|OpenClaw — Canonical reusable agent workflows"
  "awesome-openclaw-skills|https://github.com/VoltAgent/awesome-openclaw-skills.git|OpenClaw — Curated 'best of' skills from ClawHub"
  "awesome-claws|https://github.com/LHL3341/awesome-claws.git|OpenClaw — Broader ecosystem (plugins, communities, resources)"
  "superpowers|https://github.com/obra/superpowers.git|Superpowers — TDD + multi-agent dev workflow framework (Jesse Vincent)"
  "karpathy-guidelines|https://github.com/multica-ai/andrej-karpathy-skills.git|Karpathy Guidelines — Think → Simplify → Surgical → Goal-driven"
  "skills-sh|https://github.com/vercel-labs/skills.git|Skills.sh — Vercel's agent skills CLI & directory"
)

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  AI Agent Skills — Update Manager                          ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

if [[ "${1:-}" == "--status" ]]; then
  echo -e "${YELLOW}📊 Status report:${NC}"
  echo ""
  for entry in "${REPOS[@]}"; do
    IFS='|' read -r dir url desc <<< "$entry"
    repo_path="$SCRIPT_DIR/$dir"
    if [[ -d "$repo_path/.git" ]]; then
      commit=$(git -C "$repo_path" log -1 --format='%h %s' 2>/dev/null || echo "unknown")
      date=$(git -C "$repo_path" log -1 --format='%ci' 2>/dev/null || echo "unknown")
      echo -e "  ${GREEN}✓${NC} ${BLUE}$dir${NC}"
      echo "    $desc"
      echo "    Last commit: $commit"
      echo "    Date: $date"
      echo ""
    else
      echo -e "  ${RED}✗${NC} ${BLUE}$dir${NC} — not cloned"
      echo "    $url"
      echo ""
    fi
  done
  exit 0
fi

# ─── Update loop ─────────────────────────────────────────────────────────────
UPDATED=0
FAILED=0
CLONED=0

for entry in "${REPOS[@]}"; do
  IFS='|' read -r dir url desc <<< "$entry"
  repo_path="$SCRIPT_DIR/$dir"

  echo -e "${YELLOW}→ $dir${NC}"
  echo "  $desc"

  if [[ -d "$repo_path/.git" ]]; then
    # Existing repo — pull latest
    if git -C "$repo_path" pull --ff-only 2>/dev/null; then
      echo -e "  ${GREEN}✓ Updated${NC}"
      ((UPDATED++))
    else
      echo -e "  ${RED}✗ Pull failed (may have local changes)${NC}"
      echo "    Try: git -C $repo_path pull --rebase"
      ((FAILED++))
    fi
  elif [[ -d "$repo_path" ]]; then
    # Directory exists but no .git — remove and re-clone
    echo "  No .git found — re-cloning from upstream ..."
    rm -rf "$repo_path"
    if git clone --depth 1 "$url" "$repo_path" 2>/dev/null; then
      echo -e "  ${GREEN}✓ Re-cloned${NC}"
      ((CLONED++))
    else
      echo -e "  ${RED}✗ Clone failed${NC}"
      ((FAILED++))
    fi
  else
    # Missing entirely — clone fresh
    echo "  Cloning from $url ..."
    if git clone --depth 1 "$url" "$repo_path" 2>/dev/null; then
      echo -e "  ${GREEN}✓ Cloned${NC}"
      ((CLONED++))
    else
      echo -e "  ${RED}✗ Clone failed${NC}"
      ((FAILED++))
    fi
  fi
  echo ""
done

# ─── Summary ─────────────────────────────────────────────────────────────────
echo -e "${BLUE}──────────────────────────────────────────────────────────────${NC}"
echo -e "  Updated: ${GREEN}$UPDATED${NC}  |  Cloned: ${GREEN}$CLONED${NC}  |  Failed: ${RED}$FAILED${NC}"
echo -e "${BLUE}──────────────────────────────────────────────────────────────${NC}"
echo ""
echo "Done! Run './update-all.sh --status' to see commit details."
