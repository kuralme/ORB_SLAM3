#!/bin/bash
pathKitti3='Kitti/sequences/03/' #Example, it is necesary to change it by the dataset path
cd ..
#------------------------------------
# Pure visual single session example of Kitti sequence-3
echo "Launching VSLAM on Kitti dataset sequence 03"

# Usage: ./stereo_kitti ./path/to/vocabulary ./path/to/settings ./path/to/dataset/
./Examples/Stereo/stereo_kitti ./Vocabulary/ORBvoc.txt ./Examples/Stereo/KITTI03.yaml ./Datasets/$pathKitti3

if [ -f "Atlasses/kitti03.osa" ] ; then
    echo "Atlas map saved!"
fi
echo "---------------------------------------------"

# Save the evaluation against ground truth
echo "Saving and evaluating the trajectory..."
mkdir -p evaluation/est_trajectories/Kitti
mv CameraTrajectory.txt ./evaluation/est_trajectories/Kitti/Kitti03_trajectory.txt
python3 evaluation/evaluate_ate_scale.py evaluation/Ground_truth/Kitti_poses/03.txt evaluation/est_trajectories/Kitti/Kitti03_trajectory.txt --plot Kitti03_eval.pdf
mv Kitti03_eval.pdf evaluation/

echo "------------------------------------------------------"
echo "Done!"
