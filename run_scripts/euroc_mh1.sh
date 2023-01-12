cd ..
# Single Session Example (Pure visual)
echo "Launching MH01 with Stereo sensor"
#Usage: ./stereo_euroc path_to_vocabulary path_to_settings path_to_sequence_folder_1 path_to_times_file_1 (path_to_image_folder_2 path_to_times_file_2 ... path_to_image_folder_N path_to_times_file_N) trajectory_file_name
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml ./Datasets/EuRoC/MH01 ./Examples/Stereo/EuRoC_TimeStamps/MH01.txt dataset-MH01_stereo

mv f_dataset-MH01_stereo.txt ./evaluation/est_trajectories/MH01/ #move the trajectory file
mv kf_dataset-MH01_stereo.txt ./evaluation/est_trajectories/MH01/ #move the keyframe file
echo "------------------------------------"
echo "Evaluation of MH01 trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH01_GT.txt evaluation/est_trajectories/MH01/f_dataset-MH01_stereo.txt --plot MH01_stereo.pdf
mv MH01_stereo.pdf evaluation/
