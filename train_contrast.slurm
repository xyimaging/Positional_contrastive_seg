#!/bin/bash

#SBATCH --account=h_oguz_lab_acc
#SBATCH --partition=pascal
#SBATCH --gres=gpu:1

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=30G
#SBATCH --time=5-00:00:00
#SBATCH --output=train_contrast.log

# Max job duration
#SBATCH --job-name=train_contrast

# Communication
#SBATCH --mail-user=xing.yao@vanderbilt.edu
#SBATCH --mail-type=ALL

module load GCC/5.4.0-2.26
ml Anaconda3/5.0.1
source activate for_seg

python3 train_contrast.py --device cuda:0 --batch_size 32 --epochs 300 --data_dir acdc_dataset --lr 0.1 --do_contrast --dataset acdc --patch_size 352 352 \
--experiment_name contrast_acdc_pcl_temp01_thresh035_ --slice_threshold 0.35 --temp 0.1 --initial_filter_size 48 --classes 512 --contrastive_method pcl
