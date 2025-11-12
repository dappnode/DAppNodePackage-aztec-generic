#!/usr/bin/env bash
set -euo pipefail

# — Required environment variables
: "${ETHEREUM_HOSTS?Need to set ETHEREUM_HOSTS}"
: "${L1_CONSENSUS_HOST_URLS?Need to set L1_CONSENSUS_HOST_URLS}"
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
