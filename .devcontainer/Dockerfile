FROM mcr.microsoft.com/devcontainers/python:3.12

# System deps
RUN apt-get update && apt-get install -y \
    build-essential curl git \
    && apt-get clean

# Use vscode user (standard for devcontainers)
USER vscode
# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Ensure uv is in PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Add to PATH (usually ~/.local/bin for non-root installs)
ENV PATH="/home/vscode/.local/bin:$PATH"

WORKDIR /workspaces/app