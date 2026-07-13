# Arc Treasury Agent Submission Pack

## Project Name

Arc Treasury Agent

## Track

Agentic Economy Track

## Short Description

Arc Treasury Agent, implemented as Arc USDC Rebalancer, is an autonomous USDC treasury operator on Arc that turns balance and policy state into a readable readiness report, recommends safe top-up or trim actions, and keeps live signing gated behind explicit dependencies.

## Checkpoint 2 Progress Update

We have completed a public Arc Testnet MVP. The Dashboard works in preview mode without a wallet, compares below-minimum / at-target / above-target treasury states, generates a copyable report and action pack, and exposes TreasuryPolicy, TreasuryExecutor, Arc agent identity, and Circle developer-controlled wallet readiness.

Circle readiness is complete in production. The app reads a live developer-controlled wallet set and ARC Testnet wallet, and Chrome verification confirms the operator wallet, onchain policy, Circle control plane, and executor are all ready. The current policy state is `At target`, so the correct live recommendation is `Hold`; no transaction is required. The remaining final-submission work is the three-minute demo video.

## Final Demo Story

1. Open the public case study
2. Generate the readiness report
3. Compare the three treasury scenarios
4. Copy the report or action pack
5. Connect the operator wallet and inspect the fully satisfied live execution gates
6. Show the Circle wallet set, ARC Testnet wallet, and Arc evidence

## External Links

- Repository URL: https://github.com/sin199/arc-usdc-rebalancer
- Progress / presentation URL: https://web-eight-chi-99.vercel.app/case-study
- Demo video URL: not created yet
