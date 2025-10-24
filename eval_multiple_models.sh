#!/bin/bash
# filepath: eval_retailrocket_models.sh

# Array of model names (without .pt extension)
models=(
    "FMLPRec-retailrocket-Oct-24-2025_04-45-03"
    "FMLPRec-retailrocket-Oct-24-2025_06-48-57"
    "FMLPRec-retailrocket-Oct-24-2025_08-09-46"
    "FMLPRec-retailrocket-Oct-24-2025_09-21-37"
    "FMLPRec-retailrocket-Oct-24-2025_10-57-18"
)

# Dataset name
dataset="retailrocket"

# Loop through each model and evaluate
for model in "${models[@]}"
do
    echo "Evaluating model: ${model}..."
    python main.py --data_name=${dataset} --do_eval --load_model=${model} | tee eval_${model}.txt
    echo "Completed evaluation for ${model}"
    echo "----------------------------------------"
done

echo "All evaluations completed!"
