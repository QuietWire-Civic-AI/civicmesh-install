#!/bin/bash
echo "🧪 Verifying Grok’s Canon Mesh Environment — $(date)"
echo "==============================================="
echo "📍 Hostname: $(hostname)"
echo "📁 Checking key directories..."

declare -a paths=("~/CivicSwarm" "~/CivicSwarm/_scripts" "~/CivicSwarm/logs")

for path in "${paths[@]}"; do
    if [ -d "$path" ]; then
        echo "✅ Found: $path"
    else
        echo "❌ Missing: $path"
    fi
done

echo "🐍 Python3 check:"
python3 --version || echo "❌ Python3 not found"

echo "🔍 Checking for protocol YAMLs:"
find ~/CivicSwarm/_scripts -name '*protocol*.yaml' 2>/dev/null

echo "🕰️ Logging verification to ~/CivicSwarm/logs/grok_env_check.log"
echo "$(date) — Environment verified on $(hostname)" >> ~/CivicSwarm/logs/grok_env_check.log

echo "✅ Done."

