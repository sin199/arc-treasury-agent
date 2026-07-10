# Arc Treasury Agent Brief

## Positioning

`Arc Treasury Agent` is the hackathon project name. The production MVP is published as `Arc USDC Rebalancer`.

The pitch is:

- a treasury agent, not a general wallet app
- focused on `USDC`-denominated treasury operations
- designed for the `Agentic Economy Track`
- scoped around one visible operator story instead of a large feature map
- report-first, with live execution shown only after all safety gates pass

## Core story

An operator funds a treasury.

The agent watches a small set of payout rules.

When the treasury moves outside its policy band, the agent recommends a top-up or trim while preserving the reserve floor.

Every decision is written into a visible readiness report and action pack so the operator can review it before execution.

## Demo flow

1. Open the public case study.
2. Generate a readiness report from the current balance and policy inputs.
3. Compare below-minimum, at-target, and above-target scenarios.
4. Copy the markdown report or action pack.
5. Inspect the live execution gate and Arc/Circle evidence.

## Why this fits the track

- It treats agents as active financial operators.
- It uses programmable money logic rather than static wallet transfers.
- It is easy to extend into real agent-to-agent settlement.

## Public MVP links

- Dashboard: https://web-eight-chi-99.vercel.app/dashboard
- Case study: https://web-eight-chi-99.vercel.app/case-study
- Operator brief: https://web-eight-chi-99.vercel.app/operator
- Source repository: https://github.com/sin199/arc-usdc-rebalancer

## Next engineering steps

1. Finish Circle wallet-set readiness.
2. Publish one verified Arc Testnet execution transaction.
3. Record the three-minute demo video.
