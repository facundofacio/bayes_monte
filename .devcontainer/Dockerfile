FROM mcr.microsoft.com/devcontainers/base:ubuntu

# System deps
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    graphviz \
    expect \
    && apt-get clean


# Install micromamba (multi-arch)
ENV MAMBA_ROOT_PREFIX=/opt/conda
ARG TARGETARCH

RUN set -eux; \
    if [ "$TARGETARCH" = "arm64" ]; then \
        ARCH=linux-aarch64; \
    else \
        ARCH=linux-64; \
    fi; \
    curl -Ls https://micro.mamba.pm/api/micromamba/${ARCH}/latest | tar -xvj -C ./ bin/micromamba

COPY environment.yml /tmp/environment.yml

RUN micromamba create -y -f /tmp/environment.yml && \
    micromamba clean --all --yes && \
    chown -R vscode:vscode /opt/conda

# Activate env automatically
ENV PATH=$MAMBA_ROOT_PREFIX/envs/bayes_monte/bin:$PATH

# Switch to vscode user
USER vscode

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/home/vscode/.local/bin:$PATH"

# Install Claude Code CLI
RUN curl -fsSL https://claude.ai/install.sh | bash

WORKDIR /workspaces/app