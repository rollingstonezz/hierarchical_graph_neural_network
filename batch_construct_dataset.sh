for dataset in   hiv bace bbbp DD MUTAG PROTEINS IMDB-BINARY IMDB-MULTI REDDIT-BINARY COLLAB MNIST CIFAR10 UPFD 
do
    python3 construct_batched_dataset.py --dataset ${dataset} \
                                         --data_dir /home/zheng/Desktop/hierarchical_graph/data \
                                         --idx_dir /home/zheng/Desktop/hierarchical_graph/code/GMT/datasets \
                                         --save_dir /home/zheng/Desktop/hierarchical_graph/data/processed \
                                         --num_clusters 3
done