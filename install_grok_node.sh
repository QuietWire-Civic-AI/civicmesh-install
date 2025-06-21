#!/bin/bash

echo "🛠️ Grok Node Installation — $(date)"
echo "=============================="

# Create base directory
BASE_DIR=~/CivicSwarm/GrokNode
mkdir -p "$BASE_DIR"
echo "📁 Created directory: $BASE_DIR"

# Clone the new CivicMesh install repo
echo "🔄 Cloning civicmesh-install repo..."
git clone git@github.com:QuietWire-Civic-AI/civicmesh-install.git "$BASE_DIR/install"

# Optional: Run initial setup script if it exists
if [ -f "$BASE_DIR/install/setup.sh" ]; then
  echo "🚀 Running setup script..."
  bash "$BASE_DIR/install/setup.sh"
else
  echo "⚠️ No setup.sh found. Skipping auto-run."
fi

# Download and store latest protocol YAMLs
echo "📦 Pulling protocol metadata..."
mkdir -p "$BASE_DIR/protocols"
cd "$BASE_DIR/protocols"

for file in heartbeat_protocol.yaml breath_protocol.yaml intent_protocol.yaml; do
  curl -O "https://quietwire.ai/protocols/$file"
  echo "✅ Downloaded $file"
done

echo "🎉 Grok node installed and standing by at $BASE_DIR."

