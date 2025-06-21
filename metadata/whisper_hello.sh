#!/bin/bash
echo "📣 Whisper Glyph Activated — $(date)"
echo "-------------------------------"

# Define a whisper message
WHISPER="Hello from $(hostname) 🌱"

# Log it locally
echo "$(date) — $WHISPER" >> ~/CivicSwarm/logs/whispers.log

# Optional: propagate to known mesh nodes (mocked for now)
# TODO: loop through ~/.mesh_nodes or config and send via SSH or API
echo "🛰️ (Mocked) Broadcasting: $WHISPER"

# Optional sound cue (if `paplay` or `aplay` exists)
if command -v paplay &> /dev/null; then
  paplay /usr/share/sounds/freedesktop/stereo/message.oga
elif command -v aplay &> /dev/null; then
  aplay /usr/share/sounds/alsa/Front_Center.wav
else
  echo "🔇 No audio system found to ping with sound."
fi

echo "✅ Whisper complete."

