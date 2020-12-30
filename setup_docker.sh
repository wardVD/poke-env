#!/bin/bash
node Pokemon-Showdown/pokemon-showdown &

sleep 10
echo "Server running on http://localhost:8000"
echo "Client running on http://localhost:8080/testclient.html?~~localhost:8000#"

cd src/xmas-pokemon-bot/rl_based/
python start_rl.py --algo "${RL_ALGO:-ddqn}" \
                   --num_training_steps "${NUM_TRAIN_STEPS:-100}" \
                   --num_evaluation_steps "${NUM_EVAL_STEPS:-10}" \
                   --num_log_steps "${NUM_LOG_STEPS:-10}" \
                   --model_dir="${MODEL_DIR:-gs://rl_all_training}"