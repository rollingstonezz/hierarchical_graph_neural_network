for dataset in   brain
do
    python3 construct_dataset.py --dataset ${dataset} \
                                         --data_dir /home/zheng/Desktop/hierarchical_graph/data \
                                         --idx_dir /home/zheng/Desktop/hierarchical_graph/code/GMT/datasets \
                                         --save_dir /home/zheng/Desktop/hierarchical_graph/data/processed \
                                         --num_clusters 5
done