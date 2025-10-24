#!/bin/bash
# filepath: train_multiple_seeds.sh

# Array of seed values
seeds=(100 200 300 400)

# Dataset name
dataset="retailrocket"

# Loop through each seed and train the model
for seed in "${seeds[@]}"
do
    echo "Training with seed=${seed}..."
    python main.py --data_name=${dataset} --seed=${seed} | tee logseed_${seed}.txt
    echo "Completed training with seed=${seed}"
    echo "----------------------------------------"
done

echo "All training runs completed!"
