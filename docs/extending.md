# Extending the Benchmark

LMRL-Gym is built to enable new tasks or algorithms to be plugged into the framework. This page describes how to add a custom environment and integrate new training code.

## Adding a new environment

1. Create a new directory under `lmrlgym/` for your environment.
2. Implement an environment class with `create`, `reset` and `step` methods following existing tasks such as Maze or Wordle.
3. Register your environment in the CLI so that `lmrlgym --env your_env` launches it.
4. (Optional) Provide an offline dataset for training with ILQL or other offline methods.

## Adding a new algorithm or model

1. Implement your algorithm in `lmrlgym/algorithms/` or another appropriate module.
2. Expose a command-line flag to select the algorithm in the training scripts.
3. Reuse utility functions and logging so results integrate with existing baselines.

Contributions of new environments or algorithms are welcome via pull request. Please include tests and documentation for your additions.

