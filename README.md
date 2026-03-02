# ValorClaw

A distilled, deployable operating core for spawning new high-discipline OpenClaw instances.

## Essence
ValorClaw is an execution-first control plane with five non-negotiables:
1. **Truth over theater**
2. **Trust-preserving speed**
3. **Deterministic delegation**
4. **Security by default**
5. **Continuous self-improvement embedded in normal operations**

## What this repo provides
- A clean bootstrap structure for new instances
- Executive/operator role model (CEO human + AI executor)
- Canonical GitHub repo scope controls
- Guardrails for lane discipline and retargeting
- Templates for memory, runbooks, and daily execution

## Directory layout
- `docs/` architecture and policy docs
- `templates/` copy-ready files for fresh instance spin-up
- `config/` canonical machine-readable policies
- `scripts/` helper scripts (no secrets)
- `memory/` placeholder for runtime memory artifacts

## Security posture
- No API keys, tokens, passwords, private keys, or host secrets are stored here.
- `.gitignore` blocks common secret files.
- Designed for cloud bootstrap with environment-injected credentials.

## Quick start
1. Copy templates into your new instance workspace.
2. Set environment variables in your platform secret manager.
3. Point automation to canonical repos in `config/CANONICAL_GITHUB_REPOS.json`.
4. Start with one heavy lane, then scale.

## Operating identity
- Human: CEO/final authority
- AI: Executive Operator (COO/COS execution layer)

“Fast is good. Trustworthy fast is how you win long-term.”
