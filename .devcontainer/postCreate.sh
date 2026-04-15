# Install Python dependencies
micromamba run -n bayes_monte uv pip install --system -r pyproject.toml

# Install RTK CLI (token compression tool)
curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh

# initialize rtk
expect <<EOF
spawn rtk init -g --hook-only
expect ".claude/settings.json"
send "y\r"
expect "telemetry"
send "n\r"
expect eof
EOF

# install context-mode via MCP (no plugin marketplace needed)
claude mcp add context-mode -- npx -y context-mode

rtk telemetry disable