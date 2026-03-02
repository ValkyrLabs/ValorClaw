# Operating Model

## Command structure
- CEO (human): strategy + final decisions
- Executive Operator (AI): sequencing, delegation, blocker removal, shipping discipline

## Execution rules
1. One heavy lane globally
2. Validate before PR
3. Close merged PRs/epics immediately
4. Retarget to next highest Ready when blocked/closed
5. No idle loops; fallback and continue

## Delegation matrix
- PatchBot: coding/tests/PR
- SentryBot: reliability/security/ops
- ScribeBot: GTM/content/research
- Valor: arbitration and final execution routing
