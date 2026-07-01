#!/usr/bin/env bash
set -euo pipefail
DOCKER_NAME=${DOCKER_NAME:-holobrain}

# Optional: only needed for browser/MuJoCo/Placo simulation tests.
# Not required for the real Piper control chain.
docker exec -i "$DOCKER_NAME" bash <<'BASH'
set -e
source /moonxkj/RoboOrchard/venv/roboorchard-venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
pip install mujoco meshcat tyro
# Pin placo to a known aarch64 wheel version. If this fails, simulation can still be skipped.
pip install 'placo==0.9.23' || echo 'WARNING: placo install failed; skip Placo simulation deps.'
BASH
