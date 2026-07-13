# Arc Treasury Agent · Checkpoint 2 Draft

## One-line summary

Arc Treasury Agent is an autonomous USDC treasury operator on Arc. Its production MVP, Arc USDC Rebalancer, turns treasury state and policy into a readiness report and keeps live execution gated until the operator, Arc, and Circle dependencies are ready.

## Current progress update

We have defined the project scope, selected the `Agentic Economy Track`, and moved the project from a local browser prototype to a public Arc Testnet MVP. The current Dashboard supports preview-mode readiness reports, below-minimum / at-target / above-target scenarios, copyable markdown and action packs, Arc TreasuryPolicy and TreasuryExecutor evidence, Arc agent identity, and Circle developer-controlled wallet readiness.

Circle readiness is complete in production. The Dashboard loads live wallet set `65b02aa0-10f5-58fb-aadf-84827226289a`, live ARC Testnet wallet `0xf695114dc247c8477391029725d9e031335b0132`, and shows every live execution gate satisfied when the operator wallet is connected. The current policy state is `At target`, so the safe recommendation is `Hold` and no transaction is needed.

The remaining final-submission work is to record and publish the three-minute demo. A testnet top-up or trim transaction should only be published if a real out-of-band scenario requires it.

## Repository

https://github.com/sin199/arc-usdc-rebalancer

## Progress / presentation link

https://web-eight-chi-99.vercel.app/case-study

## Live review links

- Dashboard: https://web-eight-chi-99.vercel.app/dashboard
- Operator brief: https://web-eight-chi-99.vercel.app/operator
- Release notes: https://web-eight-chi-99.vercel.app/notes
