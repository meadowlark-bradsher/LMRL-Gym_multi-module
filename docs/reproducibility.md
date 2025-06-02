# Reproducibility & Benchmarking

To ensure experiments on LMRL-Gym are comparable across systems we provide guidelines for deterministic training and evaluation.

## Deterministic setup

- Set all random seeds via a `--seed` argument in the training scripts.
- Use the provided `environment.yml` or `requirements.txt` to lock dependency versions.
- For GPU workloads configure PyTorch for deterministic operations when possible.

## Evaluation protocol

- Report results over a fixed number of evaluation episodes without learning.
- Use multiple random seeds and report the mean and standard deviation.
- Share the exact git commit and environment information with your results.

A community leaderboard tracks the best reported scores on each task. Results can be submitted by opening a pull request updating `docs/leaderboard.md`.

