# Quickstart

This page provides a minimal path to install LMRL-Gym and train a baseline agent on one of the benchmark tasks.

## Installation

We recommend using conda to create an isolated environment:

```bash
git clone https://github.com/meadowlark-bradsher/LMRL-Gym_multi-module.git
cd LMRL-Gym_multi-module
git submodule update --init --recursive
conda env create -n lmrlgym-env -f environment.yml
conda activate lmrlgym-env
```

Alternatively, install with pip:

```bash
pip install -e .
```

## Training a baseline

Start the Maze environment server:

```bash
lmrlgym --env maze --host 0.0.0.0 --port 36001
```

In another terminal, run PPO training:

```bash
python examples/train_ppo.py --env maze --episodes 100 --seed 42
```

After training you can evaluate the agent:

```bash
python examples/evaluate_agent.py --env maze --policy checkpoints/maze_ppo_policy.pt
```

For other tasks or offline algorithms see the documentation pages linked above.

