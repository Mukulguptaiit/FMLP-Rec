#!/bin/bash
# filepath: eval_multiple_models.sh

# Array of model names (without .pt extension)
models=(
    "FMLPRec-yoochoose-Oct-24-2025_05-14-52"
    "FMLPRec-yoochoose-Oct-24-2025_07-12-59"
    "FMLPRec-yoochoose-Oct-24-2025_09-07-47"
    "FMLPRec-yoochoose-Oct-24-2025_11-43-19"
    "FMLPRec-yoochoose-Oct-24-2025_14-03-29"
)

# Dataset name
dataset="yoochoose"

# Loop through each model and evaluate
for model in "${models[@]}"
do
    echo "Evaluating model: ${model}..."
    python main.py --data_name=${dataset} --do_eval --load_model=${model} | tee eval_${model}.txt
    echo "Completed evaluation for ${model}"
    echo "----------------------------------------"
done

echo "All evaluations completed!"
