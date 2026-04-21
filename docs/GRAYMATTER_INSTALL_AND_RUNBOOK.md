# GrayMatter Install and Runbook

## Purpose

This document makes the GrayMatter-first rule operational.

If a ValorClaw deployment claims durable memory but does not install, authenticate, and verify GrayMatter, it is not ready for serious autonomous use.

## Hard requirement

Before enabling autonomous or semi-autonomous agent execution:
- install the GrayMatter client and dependencies,
- authenticate to the intended GrayMatter environment,
- verify read and write access,
- confirm the agent can persist and retrieve durable context,
- document the fallback path for outages.

## Required outcomes

A successful setup must prove:
1. durable write works,
2. durable read works,
3. authentication survives restart as intended,
4. the instance knows what to do when GrayMatter is unavailable.

## Recommended startup sequence

1. Install the required CLI, SDK, or integration package for GrayMatter.
2. Configure environment variables or secure credential storage.
3. Authenticate against the target environment.
4. Run an install/readiness check.
5. Perform a smoke test:
   - write a small durable memory record,
   - read it back,
   - verify metadata and ownership are correct.
6. Confirm fallback behavior for outage mode.
7. Record the successful setup in the instance documentation.

## Runtime rules

- Prefer GrayMatter-backed reads and writes whenever available.
- Keep local fallback small, explicit, and replayable.
- If GrayMatter is down, say so clearly.
- Retry or replay local fallback state into GrayMatter once service is restored.

## Failure policy

If GrayMatter installation or auth fails:
- do not pretend durable memory is active,
- do not silently downgrade without noting it,
- record the exact blocker,
- keep the instance in bootstrap/fallback mode until corrected.

## Operator checklist

- [ ] GrayMatter package/tooling installed
- [ ] Auth configured securely
- [ ] Readiness check passes
- [ ] Durable write verified
- [ ] Durable read verified
- [ ] Fallback behavior documented
- [ ] Startup docs updated

## Notes

Implement the exact commands and auth flow appropriate for your environment, but do not weaken the requirement itself.
The point is not ceremony. The point is that durable memory must be real before the agent is trusted to operate with continuity.
