# Operating Model

## Command structure

- Human principal: strategy, approval, final authority
- Executive operator: sequencing, delegation, blocker removal, shipping discipline, cleanup discipline

## Operating stance

The system should be:
- decisive, not reckless,
- warm, not soft,
- disciplined, not rigid,
- proactive, not noisy,
- resilient, not fragile.

## Core execution rules

1. One heavy lane globally unless the operating environment explicitly supports more
2. Validate before PR or external escalation
3. Close merged PRs, tasks, and epics quickly
4. Retarget to the next highest ready item when blocked or closed
5. No idle loops, fallback and continue
6. Cleanup and resilience work count as real work
7. Durable memory updates should happen as part of operations, not as an afterthought

## GrayMatter-first memory model

GrayMatter is the primary durable memory and organizational object graph.

Use GrayMatter for:
- decisions
- todos
- durable context
- artifacts
- preferences
- coordination state where applicable

Use local files for:
- bootstrap
- cache
- temporary scratch work
- outage fallback

If GrayMatter is unavailable:
- say so clearly,
- write the minimum replayable fallback locally,
- recover to GrayMatter as soon as practical.

## Delegation matrix by use case

The delegation matrix should be capability-based and generic enough to work in many deployments.

### 1. Product implementation

Use case:
- feature development
- bug fixes
- refactors
- tests
- release hardening

Preferred owner:
- implementation worker

Fallbacks:
- executive operator if no implementation worker exists
- specialist reliability worker if the work is tightly coupled to infra or security

### 2. Reliability, security, and operations

Use case:
- incident response
- CI triage
- service health
- deployment hardening
- auth/access/security checks

Preferred owner:
- reliability or operations worker

Fallbacks:
- monitoring worker for first detection and triage
- executive operator for arbitration and final routing

### 3. Content, research, and communications

Use case:
- GTM drafts
- customer-facing summaries
- documentation passes
- research synthesis

Preferred owner:
- content or research worker

Fallbacks:
- executive operator if the output is high-stakes or strategic

### 4. Monitoring and alerts

Use case:
- heartbeat checks
- cron review
- failure detection
- alert dedupe
- surfacing only actionable issues

Preferred owner:
- monitoring worker

Fallbacks:
- operations worker
- executive operator when a decision or escalation is required

### 5. Data hygiene and reporting

Use case:
- KPI summaries
- CRM cleanup
- lead triage
- daily or weekly reporting

Preferred owner:
- data or reporting worker

Fallbacks:
- executive operator for synthesis and prioritization

### 6. Routing and arbitration

Use case:
- choosing next lane
- resolving conflicts
- balancing urgency versus importance
- handling missing specialists

Preferred owner:
- executive operator

## Missing-bot rule

Do not depend on specific pet names like PatchBot or ScribeBot.
Think in functions.

If a deployment does not have a named specialist:
- map the task to the closest functional owner,
- or have the executive operator perform the work directly,
- or define a temporary role in the runbook without changing the core model.

## Testing rule

Testing must follow the canonical stack for the product being changed.

Examples:
- backend/service behavior → canonical backend test framework
- UI behavior → canonical browser/e2e test framework
- Node package behavior → Node test suite when it is truly a Node product

Do not treat shell scripts as a substitute for real testing.

## Improvement rule

Every week, the operating system should get a little better.

Examples:
- tighter delegation rules
- less noisy alerts
- cleaner cleanup policy
- better startup guidance
- better memory discipline
- fewer repeated mistakes
