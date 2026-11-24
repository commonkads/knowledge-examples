#!/usr/bin/env bash
# Runs one of the bundled example domains with a default payload, so it can be
# smoke-tested without hand-writing JSON. Pass --payload to override the default.
# --model is required; --provider defaults to bedrock (see CLI help).
#
# Usage: examples/bin/run-example.sh [--domain <vital-signs|car-diagnosis|server-monitoring>]
#                                    --model <model-id> [cli-options...]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MONOREPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
STRATA_BIN="$MONOREPO_ROOT/node_modules/.bin/strata"

if [[ ! -x "$STRATA_BIN" ]]; then
  echo "error: strata binary not found - run 'npm install' from the monorepo root, then 'npm run compile' from cli/" >&2
  exit 1
fi

# Parse --domain from the argument list (strip it before forwarding to CLI).
DOMAIN="vital-signs"
PASSTHROUGH_ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --domain)
      DOMAIN="$2"
      shift 2
      ;;
    --domain=*)
      DOMAIN="${1#--domain=}"
      shift
      ;;
    *)
      PASSTHROUGH_ARGS+=("$1")
      shift
      ;;
  esac
done

case "$DOMAIN" in
  vital-signs)
    KNOWLEDGE_ROOT="$MONOREPO_ROOT/examples/vital-signs"
    DEFAULT_PAYLOAD=$(cat <<-'EOH'
{
  "PatientType":"Adult",
  "HeartRate":75,
  "BloodPressureSystolic":118,
  "RespiratoryRate":16,
  "Temperature":37.0,
  "OxygenSaturation":98,
  "IsPregnant":false,
  "VitalsDataIncomplete":false
}
EOH
)
    ;;
  car-diagnosis)
    KNOWLEDGE_ROOT="$MONOREPO_ROOT/examples/car-diagnosis"
    DEFAULT_PAYLOAD='{"symptoms":["NoStart_NoCrank"],"lights":"dim","sound":"silence"}'
    ;;
  server-monitoring)
    KNOWLEDGE_ROOT="$MONOREPO_ROOT/examples/server-monitoring"
    DEFAULT_PAYLOAD='{"CpuUsagePercent":78,"MemoryUsagePercent":83,"DiskUsagePercent":55,"DiskIoWaitPercent":4,"HttpErrorRatePercent":0.3,"HttpP99LatencyMs":420,"CpuCores":4,"LoadAverage1m":3.8}'
    ;;
  *)
    echo "error: unknown domain '$DOMAIN'" >&2
    echo "usage: $0 [--domain vital-signs|car-diagnosis|server-monitoring] --model <model-id> [options...]" >&2
    exit 1
    ;;
esac

exec "$STRATA_BIN" \
  --knowledge-root "$KNOWLEDGE_ROOT" \
  --payload "$DEFAULT_PAYLOAD" \
  "${PASSTHROUGH_ARGS[@]}"
