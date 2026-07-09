# Arc Treasury Agent Brief

## Positioning

`Arc Treasury Agent` is a hackathon MVP for the Encode Club `Programmable Money Hackathon`.

The pitch is:

- a treasury agent, not a general wallet app
- focused on `USDC`-denominated treasury operations
- designed for the `Agentic Economy Track`
- scoped around one visible operator story instead of a large feature map

## Core story

An operator funds a treasury.

The agent watches a small set of payout rules.

When rules pass, the agent settles payments while preserving a reserve floor.

Every decision is written into a visible settlement feed so the system feels auditable.

## Demo flow

1. Start with a funded treasury balance.
2. Review approved payout rules.
3. Run a payout cycle.
4. Show the updated balance and settlement ledger.
5. Explain how the mock loop would be replaced by live Arc and Circle-backed transactions.

## Why this fits the track

- It treats agents as active financial operators.
- It uses programmable money logic rather than static wallet transfers.
- It is easy to extend into real agent-to-agent settlement.

## Next engineering steps

1. Replace mock data with a wallet balance source.
2. Add a real rule evaluation pipeline.
3. Produce signed payout intents.
4. Execute and record live settlement events.
