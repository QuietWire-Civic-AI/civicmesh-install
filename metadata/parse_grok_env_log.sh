#!/bin/bash
# parse_grok_env_log.sh
# Extract key signals from Grok’s environment check log

LOG_FILE="${1:-~/CivicSwarm/logs/grok_env_check.log}"

echo "📖 Parsing: $LOG_FILE"
echo "------------------------------"

if [ ! -f "$LOG_FILE" ]; then
    echo "❌ Log file not found."
    exit 1
fi

# Pull hostname
grep -E 'verified on' "$LOG_FILE" | while read -r line; do
  echo "🛰️  $line"
done

# Status confirmation
if grep -q '✅ Done.' "$LOG_FILE"; then
  echo "✅ Environment verified successfully."
else
  echo "⚠️  Verification incomplete or failed."
fi

