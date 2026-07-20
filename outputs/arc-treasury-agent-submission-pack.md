# Arc USDC Rebalancer: Treasury Automation Submission Pack

## Project Name

Arc USDC Rebalancer: Treasury Automation

## Track

DeFi Track

## Short Description

Arc USDC Rebalancer: Treasury Automation is a policy-driven USDC treasury workflow on Arc. It reads balance and policy state, recommends hold, top-up, or trim, and keeps signed execution behind explicit operator, Circle, and infrastructure gates.

## Checkpoint 2 Progress Update

We have completed a public Arc Testnet MVP for the DeFi Track. The Dashboard works in preview mode without a wallet, compares below-minimum / at-target / above-target treasury states, generates a copyable report and action pack, and exposes TreasuryPolicy, TreasuryExecutor, Arc-linked onchain identity evidence, and Circle developer-controlled wallet readiness.

The public deployment reads live Arc policy, Circle developer-controlled wallet readiness, and TreasuryExecutor configuration. Its public preview remains wallet-free and the deployment keeps live execution disabled; no transaction has been submitted. The default preview input is `At target` and returns `Hold`, while the live brief separately evaluates the current Arc Testnet executor balance and currently returns `Top up 200 USDC` from a 0 USDC executor balance. These are separate preview and live-source states, not a claim of completed autonomous execution.

## Final Demo Story

1. Open the public case study
2. Generate the readiness report
3. Compare the three treasury scenarios
4. Copy the report or action pack
5. Inspect the live-source and execution-gate evidence without implying that a transaction was sent
6. Show Circle wallet readiness, Arc policy, executor configuration, and onchain identity evidence

## External Links

- Repository URL: https://github.com/sin199/arc-usdc-rebalancer
- Progress / presentation URL: https://web-eight-chi-99.vercel.app/case-study
- Deck URL: https://github.com/sin199/arc-usdc-rebalancer/raw/main/docs/arc-treasury-agent-deck.pptx
- Demo video URL: https://raw.githubusercontent.com/sin199/arc-usdc-rebalancer/main/docs/arc-treasury-agent-demo.mp4
