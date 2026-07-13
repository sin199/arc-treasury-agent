# Arc Treasury Agent Status

Project: `Arc Treasury Agent`

Platform: Encode Club `Programmable Money Hackathon`

Current state as of 2026-07-13:
- Project exists on the Encode Club dashboard.
- Track selected: `Agentic Economy Track`.
- Project description is filled.
- Team owner is `z cindy`.
- Join code: `e412371e`
- Discord integration is connected on the project page.

Deadline checkpoints:
- Checkpoint 1: Sunday, 2026-07-19 (Anywhere on Earth)
- Checkpoint 2: Sunday, 2026-07-26 (Anywhere on Earth)
- Final Submission: Sunday, 2026-08-09 (Anywhere on Earth)
- Demo Day: Thursday, 2026-08-20

Known submission requirements captured from the page:
- Checkpoint 1: project outline, team members, and project description/idea.
- Checkpoint 2: repo link plus a progress update or presentation link.
- Final submission: functional MVP, code repository, and a 3-minute demo video.
- Judging emphasizes Arc/Circle integration, usefulness, execution quality, and presentation clarity.

Current state and remaining work:
- Checkpoint 2 evidence is now available through the public case study and operator brief.
- The production MVP is the public `Arc USDC Rebalancer` repository and Dashboard.
- Chrome has an injected operator wallet connected to the production Dashboard: `0x630F6320315633e170B5Cc29b40E1Dbb86ae96e2`.
- Arc policy and executor configuration load successfully. TreasuryExecutor is `0x5c5d0275371724779f3a6928eb0312df2b1a501f` and agent identity `#4507` is `kyc_verified`.
- A `trim` preview completed successfully, and the Dashboard was restored to the safe `At target` state. No transaction was sent.
- Circle API key and entity secret are present in Vercel Production, but `CIRCLE_WALLET_SET_ID` is not configured.
- Circle wallet creation is externally blocked: `api-sandbox.circle.com` returns HTTP 500 because its internal service at `127.0.0.1:10100` refuses the connection. Circle's public status page nevertheless reports all systems operational.
- The same test API key returns HTTP 401 on `api.circle.com`, so changing only the API base is not a valid repair.
- Circle Console has no active Chrome session. One owner login is required to create or rotate a test API key/entity secret before wallet-set provisioning can continue.
- No top_up or trim Arc Testnet transaction hash has been published yet.
- A 3-minute demo video is still required for final submission.
- Encode Club project details now point to the production Dashboard, repository, and case study.
- The project group chat has the production progress update and review links.

Repository:
- https://github.com/sin199/arc-usdc-rebalancer

Public review links:
- Dashboard: https://web-eight-chi-99.vercel.app/dashboard
- Case study / progress link: https://web-eight-chi-99.vercel.app/case-study
- Operator brief: https://web-eight-chi-99.vercel.app/operator
- Release notes: https://web-eight-chi-99.vercel.app/notes

Demo preparation:
- Three-minute recording script: `outputs/arc-treasury-agent-demo-script.md`

Automation:
- A daily thread heartbeat is active through 2026-08-10 to revisit this thread and continue deadline handling automatically.
