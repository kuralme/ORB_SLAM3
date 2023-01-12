cd ..
# Single Session Example (Pure visual)
echo "Launching VSLAM on Kitti dataset"
#Usage: ./stereo_kitti path_to_vocabulary path_to_settings path_to_sequence
./Examples/Stereo/stereo_kitti ./Vocabulary/ORBvoc.txt ./Examples/Stereo/KITTI03.yaml ./Datasets/Kitti/sequences/03/
mv CameraTrajectory.txt ./evaluation/est_trajectories/Kitti/ #move the trajectory file
echo "------------------------------------"

echo "Evaluation of the trajectory"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/Kitti_poses/03.txt evaluation/est_trajectories/Kitti/CameraTrajectory.txt --plot Kitti_eval.pdf
mv Kitti_eval.pdf evaluation/
