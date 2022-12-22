for dataset in   DD 
do
if [ ! -d "${dataset}" ]; then
    mkdir ${dataset}
fi
cd ${dataset}
for idx in 1 2 3 
do
if [ ! -d "${idx}" ]; then
    mkdir ${idx}
fi
cd ${idx}
for number_layers in 2 
do
if [ ! -d "${number_layers}" ]; then
    mkdir ${number_layers}
fi
cd ${number_layers}
for lr in 5e-4 
do
if [ ! -d "${lr}" ]; then
    mkdir ${lr}
fi
cd ${lr}
for hidden_dim in  64
do
if [ ! -d "${hidden_dim}" ]; then
    mkdir ${hidden_dim}
fi
cd ${hidden_dim}
cat > ${dataset}_${idx}_${number_layers}_${lr}_${hidden_dim}.sh << ***
#!/bin/bash
#SBATCH --job-name=${dataset}_${idx}_${number_layers}_${lr}_${hidden_dim}
#SBATCH --output=out_slurmtest
#SBATCH --gres=gpu:1

cp ../../../../../GNNBenchmarkDataset.py ./
cp ../../../../../model.py ./
cp ../../../../../run.py ./
cp ../../../../../UPFD.py ./
cp ../../../../../construct_batched_dataset.py ./

source /home/zzha792/anaconda3/bin/activate
/home/zzha792/anaconda3/bin/python3 run.py --dataset ${dataset} \
                               --data_dir /home/zzha792/hierarchical/data \
                               --save_dir /home/zzha792/hierarchical/data/processed \
                               --write_dir /home/zzha792/hierarchical/results \
                               --idx ${idx} \
                               --number_layers ${number_layers} \
                               --hidden_dim 64 \
                               --lr ${lr} 

***
sbatch ${dataset}_${idx}_${number_layers}_${lr}_${hidden_dim}.sh
cd ..
done
cd ..
done
cd ..
done
cd ..
done
cd ..
done