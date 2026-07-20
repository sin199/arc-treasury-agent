# Arc USDC Rebalancer: Treasury Automation Status

Project: `Arc USDC Rebalancer: Treasury Automation`

Platform: Encode Club `Programmable Money Hackathon`

Current state as of 2026-07-20:
- Project exists on the Encode Club dashboard.
- Track selected: `DeFi Track`.
- Project description is filled.
- Team owner is `z cindy`.
- Join code: `e412371e`
- Discord integration currently reports `Failed to send a request to the Edge Function` on the project page.

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
- Checkpoint 2 evidence is now available through the public case study and treasury operations brief.
- The production MVP is the public `Arc USDC Rebalancer` repository and Dashboard.
- Arc policy and executor configuration are exposed as public evidence. TreasuryExecutor is `0x5c5d0275371724779f3a6928eb0312df2b1a501f`; Arc-linked identity `#4507` is supplementary validation evidence.
- A `trim` preview completed successfully, and the Dashboard was restored to the safe `At target` state. No transaction was sent.
- Circle developer-controlled wallet readiness is surfaced in the product, but public execution remains disabled.
- The public preview defaults to `At target` and correctly recommends `Hold`; the separate live-source brief can show a different executor balance and recommendation.
- No top_up or trim Arc Testnet transaction hash has been published yet.
- The final demo video is ready at `outputs/arc-treasury-agent-demo.mp4`: it uses real production Dashboard recordings for the 75 USDC and 700 USDC policy scenarios, report evidence, Action Pack, and execution lock.
- Final video format: H.264/AAC, 1280x720, stereo, 180.05 seconds, 5.1 MB.
- Public demo video: `https://raw.githubusercontent.com/sin199/arc-usdc-rebalancer/main/docs/arc-treasury-agent-demo.mp4` (HTTP 200 verified after publication).
- The six-slide final presentation deck is published in the public production repository.
- Encode Club project details contain the production Dashboard, repository, and case study, aligned to the DeFi Track.
- The project group chat input is currently disabled, so the latest production update could not be posted there.
- Checkpoint 2 opens on Monday, 2026-07-20 at 19:59 GMT+8 and requires the repository plus a progress or presentation link. Do not submit until the form is visibly open.

Repository:
- https://github.com/sin199/arc-usdc-rebalancer

Public review links:
- Dashboard: https://web-eight-chi-99.vercel.app/dashboard
- Case study / progress link: https://web-eight-chi-99.vercel.app/case-study
- Treasury operations brief: https://web-eight-chi-99.vercel.app/operator
- Release notes: https://web-eight-chi-99.vercel.app/notes

Demo preparation:
- Three-minute recording script: `outputs/arc-treasury-agent-demo-script.md`
- Presentation deck: `outputs/arc-treasury-agent-deck.pptx`
- Public deck: https://github.com/sin199/arc-usdc-rebalancer/raw/main/docs/arc-treasury-agent-deck.pptx

Automation:
- A daily thread heartbeat is active through 2026-08-10 to revisit this thread and continue deadline handling automatically.
