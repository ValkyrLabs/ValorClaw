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

This is a release gate, not a suggestion.

## Required outcomes

A successful setup must prove:
1. durable write works,
2. durable read works,
3. authentication survives restart as intended,
4. the instance knows what to do when GrayMatter is unavailable.

## Minimum configuration contract

Every serious deployment must document these values somewhere secure and operator-visible:
- GrayMatter/API base URL
- auth mechanism used
- principal or service account identity
- whether the credential is verified write-capable
- fallback location used during outage mode

For Valkyr-backed environments, explicitly verify the auth in use is allowed to mutate durable objects. Read-only auth is not acceptable for production ValorClaw operation.

If the environment uses `VALKYR_AUTH`, treat a read-only token as a hard failure and stop the bootstrap.

## Mandatory startup sequence

1. Install the required CLI, SDK, or integration package for GrayMatter.
2. Configure environment variables or secure credential storage.
3. Authenticate against the target environment.
4. Run an install/readiness check.
5. Perform a smoke test:
   - write a small durable memory or note record,
   - read it back,
   - verify metadata and ownership are correct,
   - verify the same credential can still read/write after process restart.
6. Confirm fallback behavior for outage mode.
7. Record the successful setup in the instance documentation.

## Suggested verification flow

Use the exact client/library for your environment, but validate these behaviors explicitly:

### 1. Connectivity check
- confirm the target GrayMatter/API endpoint is reachable
- confirm TLS/auth expectations are correct

### 2. Read check
- list or fetch a known durable object class
- verify the response is from the intended environment

### 3. Write check
- create a small disposable durable object
- patch or update it if partial updates are part of the normal flow
- delete it if your environment allows cleanup of test records

### 4. Restart check
- restart the local agent/runtime
- verify the auth/session still behaves as intended

### 5. Failure-mode check
- disable or revoke access temporarily in a controlled way
- confirm the instance fails loudly and falls back to explicit local replayable state

## Runtime rules

- Prefer GrayMatter-backed reads and writes whenever available.
- Keep local fallback small, explicit, and replayable.
- If GrayMatter is down, say so clearly.
- Retry or replay local fallback state into GrayMatter once service is restored.
- Do not let local fallback silently become the permanent memory system.

## Failure policy

If GrayMatter installation or auth fails:
- do not pretend durable memory is active,
- do not silently downgrade without noting it,
- record the exact blocker,
- keep the instance in bootstrap/fallback mode until corrected,
- do not enable autonomous execution that depends on durable continuity.

## Operator checklist

- [ ] GrayMatter package/tooling installed
- [ ] Base URL documented
- [ ] Auth configured securely
- [ ] Auth principal/service account documented
- [ ] Readiness check passes
- [ ] Durable write verified
- [ ] Durable read verified
- [ ] Restart persistence verified
- [ ] Fallback behavior documented
- [ ] Startup docs updated

## Bootstrap note for new instances

When creating a new ValorClaw deployment, copy this runbook into the local operating docs and fill in the actual environment-specific commands and secrets path.
Do not leave it as an abstract placeholder.

## Notes

Implement the exact commands and auth flow appropriate for your environment, but do not weaken the requirement itself.
The point is not ceremony. The point is that durable memory must be real before the agent is trusted to operate with continuity.
