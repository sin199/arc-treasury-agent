# Arc Treasury Agent

`Arc Treasury Agent` is the Encode Club `Programmable Money Hackathon` project. Its production MVP is the public `Arc USDC Rebalancer` dashboard and repository.

The project position is simple:

- Use the `Agentic Economy Track`
- Keep the settlement layer `USDC-native`
- Show one clear flow instead of a broad product surface

## MVP focus

The current prototype demonstrates:

1. A visible treasury balance held in USDC
2. A small set of payout rules
3. An agent-triggered payout cycle
4. A settlement feed that records what the agent decided and executed

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

- Complete Circle wallet-set readiness for live crosschain execution
- Publish a verified Arc Testnet top-up or trim transaction hash
- A 3-minute demo video
