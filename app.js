const state = {
  treasuryBalance: 52400,
  pendingPayouts: 8950,
  settledToday: 0,
  rules: [
    {
      id: "salary",
      name: "Contributor payroll",
      amount: 5200,
      condition: "Every Friday if reserve floor stays above 15,000 USDC.",
      type: "scheduled"
    },
    {
      id: "infra",
      name: "Inference infra budget",
      amount: 2300,
      condition: "Release when API usage exceeds the daily threshold.",
      type: "usage-based"
    },
    {
      id: "service",
      name: "Agent-to-agent service fee",
      amount: 1450,
      condition: "Approve if signed delivery proof is present.",
      type: "verified"
    }
  ],
  settlements: [
    {
      id: "seed-1",
      title: "Treasury initialized",
      amount: 52400,
      detail: "Arc Treasury Agent loaded a 52,400 USDC operating balance for the weekly cycle.",
      status: "boot"
    }
  ]
};

const formatCurrency = (value) =>
  new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
    maximumFractionDigits: 0
  })
    .format(value)
    .replace("$", "$");

function renderRules() {
  const rulesGrid = document.querySelector("#rules-grid");
  rulesGrid.innerHTML = "";

  for (const rule of state.rules) {
    const item = document.createElement("article");
    item.className = "rule-card";
    item.innerHTML = `
      <header>
        <strong>${rule.name}</strong>
        <span class="rule-chip">${rule.type}</span>
      </header>
      <p>${rule.condition}</p>
      <p class="settlement-meta">${formatCurrency(rule.amount)} queued when condition passes.</p>
    `;
    rulesGrid.appendChild(item);
  }
}

function renderSettlements() {
  const feed = document.querySelector("#settlement-feed");
  feed.innerHTML = "";

  const entries = [...state.settlements].reverse();

  for (const entry of entries) {
    const item = document.createElement("article");
    item.className = "settlement-entry";
    item.innerHTML = `
      <header>
        <strong>${entry.title}</strong>
        <span class="rule-chip">${entry.status}</span>
      </header>
      <p>${entry.detail}</p>
      <p class="settlement-meta">${formatCurrency(entry.amount)}</p>
    `;
    feed.appendChild(item);
  }
}

function renderSummary() {
  document.querySelector("#treasury-balance").textContent = `${formatCurrency(state.treasuryBalance)} USDC`;
  document.querySelector("#pending-total").textContent = formatCurrency(state.pendingPayouts);
  document.querySelector("#settled-total").textContent = formatCurrency(state.settledToday);
}

function addSettlement(title, amount, detail, status) {
  state.settlements.push({
    id: `${status}-${Date.now()}`,
    title,
    amount,
    detail,
    status
  });
  renderSettlements();
}

function runPayoutCycle() {
  const totalCycleAmount = state.rules.reduce((sum, rule) => sum + rule.amount, 0);
  const projectedBalance = state.treasuryBalance - totalCycleAmount;

  if (projectedBalance < 15000) {
    addSettlement(
      "Cycle blocked",
      totalCycleAmount,
      "The agent refused to settle queued payouts because the reserve floor would fall below 15,000 USDC.",
      "blocked"
    );
    return;
  }

  state.treasuryBalance = projectedBalance;
  state.pendingPayouts = Math.max(0, state.pendingPayouts - totalCycleAmount);
  state.settledToday += totalCycleAmount;

  addSettlement(
    "Payout cycle executed",
    totalCycleAmount,
    "The agent approved all current payout rules and wrote a single settlement batch to the treasury ledger.",
    "settled"
  );

  renderSummary();
}

function topUpReserve() {
  state.treasuryBalance += 10000;
  addSettlement(
    "Reserve topped up",
    10000,
    "An operator injected an additional 10,000 USDC to keep the automated payout engine comfortably above the reserve floor.",
    "capital"
  );
  renderSummary();
}

document.querySelector("#run-payouts").addEventListener("click", runPayoutCycle);
document.querySelector("#top-up-balance").addEventListener("click", topUpReserve);

renderRules();
renderSettlements();
renderSummary();
