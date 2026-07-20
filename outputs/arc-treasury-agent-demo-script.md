# Arc USDC Rebalancer: Treasury Automation · 3-Minute Demo Script

## 0:00-0:25 · Problem and product

Open the case study, then the Dashboard.

Say: "Arc USDC Rebalancer is a DeFi Treasury automation workflow on Arc. It reads the balance and policy band, recommends hold, top-up, or trim, and keeps live execution locked until the operator and Arc/Circle dependencies are ready."

## 0:25-1:10 · At-target state

On the Dashboard, leave the default values at 500 USDC current balance, 100 USDC minimum, 500 USDC target, and 200 USDC maximum rebalance.

Point out:

- Preview mode is available without a wallet.
- The report says `Hold` at the target.
- Circle developer-controlled wallet readiness is visible as an integration signal.
- The policy source, executor address, and onchain identity evidence are visible.
- The action pack can be copied for an operator review trail.

## 1:10-1:55 · Below minimum

Click `Below minimum`.

Say: "When the balance falls below the policy floor, the recommendation changes to `top_up`; the amount is bounded by the policy and the report explains why."

Show the readiness report and payload JSON. Do not run a live action.

## 1:55-2:35 · Above target

Click `Above target`.

Say: "When the balance is above target, the recommendation changes to `trim`. The same report-first path produces a bounded action pack instead of silently sending funds."

Show the policy band and the visible execution lock. Do not click the live execution action or approve a wallet signature.

## 2:35-3:00 · Arc/Circle integration and safety boundary

Open the treasury operations brief or architecture page.

Say: "The production repository includes Arc Testnet TreasuryPolicy, TreasuryExecutor, Circle developer-controlled wallet readiness, execution caps, replay protection, and Arc-linked onchain identity evidence. Preview mode never signs or submits a transaction. The public deployment keeps execution disabled, so the demo proves the policy workflow and its safety boundary, not a completed payment."

End on the Dashboard.

## Links

- Dashboard: https://web-eight-chi-99.vercel.app/dashboard
- Case study: https://web-eight-chi-99.vercel.app/case-study
- Treasury operations brief: https://web-eight-chi-99.vercel.app/operator
- Architect proof: https://web-eight-chi-99.vercel.app/architects
- Repository: https://github.com/sin199/arc-usdc-rebalancer
