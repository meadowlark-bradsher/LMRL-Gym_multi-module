#!/bin/bash
# train.sh

# Run the training command.  All the paths are now relative to the
# container's root, so we don't need the /content/ prefixes.
python -m llm_rl_scripts.twenty_questions.bc.train_bc HF gpt2 /train.json /eval.json /t5_oracle/ --outputs-path bc_checkpoint_path

# You can add any other commands you want to execute after the training here.