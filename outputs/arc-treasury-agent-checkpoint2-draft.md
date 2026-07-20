# Arc USDC Rebalancer: Treasury Automation · Checkpoint 2 Draft

## One-line summary

Arc USDC Rebalancer: Treasury Automation is a DeFi Treasury workflow for policy-driven USDC operations on Arc. It turns treasury state and policy into an auditable readiness report and keeps signed execution gated until the operator, Arc, and Circle dependencies are ready.

## Current progress update

We have defined the project scope, selected the `DeFi Track`, and moved the project from a local browser prototype to a public Arc Testnet MVP. The current Dashboard supports preview-mode readiness reports, below-minimum / at-target / above-target scenarios, copyable markdown and action packs, Arc TreasuryPolicy and TreasuryExecutor evidence, Arc-linked onchain identity evidence, and Circle developer-controlled wallet readiness.

The public Dashboard loads live Arc policy, Circle developer-controlled wallet readiness, and TreasuryExecutor configuration. The public preview remains wallet-free and this deployment keeps live execution disabled; no transaction has been submitted. The default preview input is `At target` and returns `Hold`, while the live brief currently evaluates the Arc Testnet executor balance as `0 USDC` and recommends `Top up 200 USDC`. The preview and live-source states are shown separately and are not evidence of completed autonomous execution.

The three-minute demo is publicly accessible and shows the report, three policy scenarios, action pack, and execution lock. It does not claim that a top-up or trim transaction was sent.

The final demo video is prepared as `docs/arc-treasury-agent-demo.mp4` in the public repository. It includes real production Dashboard recordings for the 75 USDC and 700 USDC policy scenarios, report evidence, the Action Pack, and the execution lock. The updated public deck now uses the same evidence boundary: no historical `all gates ready` state is presented as the current public deployment state.

The project does not claim an Agent Stack integration that is not present in the repository. The DeFi fit is direct: it implements an Arc Testnet USDC treasury policy, a capped TreasuryExecutor, Circle wallet readiness, replay-protected execution controls, and auditable reports. Onchain identity is supplementary evidence, not the project headline, and no human-free autonomous payment or completed transaction is claimed.

Public demo video: https://raw.githubusercontent.com/sin199/arc-usdc-rebalancer/main/docs/arc-treasury-agent-demo.mp4

## Repository

https://github.com/sin199/arc-usdc-rebalancer

## Progress / presentation link

https://web-eight-chi-99.vercel.app/case-study

## Live review links

- Dashboard: https://web-eight-chi-99.vercel.app/dashboard
- Treasury operations brief: https://web-eight-chi-99.vercel.app/operator
- Release notes: https://web-eight-chi-99.vercel.app/notes
