#!/usr/bin/env bash
set -euo pipefail

# — Required environment variables
: "${ETHEREUM_HOSTS?Need to set ETHEREUM_HOSTS}"
: "${L1_CONSENSUS_HOST_URLS?Need to set L1_CONSENSUS_HOST_URLS}"
: "${VALIDATOR_PRIVATE_KEYS?Need to set VALIDATOR_PRIVATE_KEYS}"
: "${COINBASE?Need to set COINBASE}"
: "${GOVERNANCE_PROPOSER_PAYLOAD_ADDRESS?Need to set GOVERNANCE_PROPOSER_PAYLOAD_ADDRESS}"
: "${_DAPPNODE_GLOBAL_PUBLIC_IP?Need to set _DAPPNODE_GLOBAL_PUBLIC_IP (your public IP)}"
: "${NETWORK?Need to set NETWORK (build arg)}"
: "${LOG_LEVEL:=info}"

P2P_IP="${_DAPPNODE_GLOBAL_PUBLIC_IP}" # aztec expects P2P_IP to be set, but dappmanager injects the env as `_DAPPNODE_GLOBAL_PUBLIC_IP`
export P2P_IP

# — Build the command array
FLAGS=(
  start
  --network "$NETWORK"
)

# — Append fixed mode flags
FLAGS+=(--archiver --node --sequencer)

echo "[INFO - entrypoint] Starting sequencer with flags:"
printf '  %q\n' "${FLAGS[@]}"

# — Execute the command
exec node --no-warnings /usr/src/yarn-project/aztec/dest/bin/index.js "${FLAGS[@]}"
