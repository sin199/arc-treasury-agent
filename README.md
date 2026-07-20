# Arc Treasury Agent

`Arc Treasury Agent` is the Encode Club `Programmable Money Hackathon` project. Its production MVP is the public `Arc USDC Rebalancer` dashboard and repository.

The project position is simple:

- Use the `DeFi Track`
- Keep the settlement layer `USDC-native`
- Show one clear flow instead of a broad product surface

## MVP focus

The current prototype demonstrates:

1. A visible USDC treasury balance and onchain policy state
2. Three bounded policy outcomes: `hold`, `top up`, or `trim`
3. A wallet-free readiness report and copyable action pack
4. Explicit execution gates with public writes disabled

The public MVP keeps the same treasury-operator story while adding Arc Testnet policy reads, a TreasuryExecutor, agent identity, Circle readiness checks, report-first operation, and explicit live-execution gates.

## Run locally

```bash
npm start
```

Then open [http://127.0.0.1:4173](http://127.0.0.1:4173).

## What is already ready

- Project direction
- Browser-based local prototype
- README
- Public production repository: `https://github.com/sin199/arc-usdc-rebalancer`
- Live Dashboard: `https://web-eight-chi-99.vercel.app/dashboard`
- Case study / progress link: `https://web-eight-chi-99.vercel.app/case-study`
- Operator brief: `https://web-eight-chi-99.vercel.app/operator`
- Release notes: `https://web-eight-chi-99.vercel.app/notes`
- Checkpoint and submission drafts in `outputs/`

## What still needs to exist before submission

- Keep the deployed execution lock in place while public evidence is reviewed
- Submit the already-published repository, deck, and 3-minute demo at the final checkpoint
