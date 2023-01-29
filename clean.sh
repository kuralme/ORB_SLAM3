echo "Removing all ORB_SLAM3 objects"
rm -rf build lib
rm  Examples/RGB-D/rgbd_tum \
    Examples/RGB-D/rgbd_realsense_D435i \
    Examples/RGB-D-Inertial/rgbd_inertial_realsense_D435i \
    Examples/Monocular/mono_realsense_D435i \
    Examples/Monocular/mono_euroc \
    Examples/Monocular/mono_kitti \
    Examples/Monocular/mono_tum \
    Examples/Monocular/mono_tum_vi \
    Examples/Monocular/mono_realsense_t265 \
    Examples/Stereo/stereo_euroc \
    Examples/Stereo/stereo_kitti \
    Examples/Stereo/stereo_tum_vi \
    Examples/Stereo/stereo_realsense_t265 \
    Examples/Stereo/stereo_realsense_D435i \
    Examples/Monocular-Inertial/mono_inertial_euroc \
    Examples/Monocular-Inertial/mono_inertial_tum_vi \
    Examples/Monocular-Inertial/mono_inertial_realsense_t265 \
    Examples/Monocular-Inertial/mono_inertial_realsense_D435i \
    Examples/Monocular-Inertial/mono_inertial_realsense_D435i_2 \
    Examples/Calibration/recorder_realsense_D435i


echo "Cleaning ROS ..."
rm -rf Examples/ROS/ORB_SLAM3/build
rm  Examples/ROS/ORB_SLAM3/Mono \
    Examples/ROS/ORB_SLAM3/Mono_Inertial \
    Examples/ROS/ORB_SLAM3/MonoAR \
    Examples/ROS/ORB_SLAM3/RGBD \
    Examples/ROS/ORB_SLAM3/Stereo \
    Examples/ROS/ORB_SLAM3/Stereo_Inertial

echo "Cleaning Thirdparty ..."
rm Thirdparty/g2o/config.h
rm -rf Thirdparty/DBoW2/build \
    Thirdparty/DBoW2/lib \
    Thirdparty/g2o/build \
    Thirdparty/g2o/lib \
    Thirdparty/Pangolin/build \
    Examples/Tests/viewer_dataset \
    Examples/Tests/sophus_test

echo "Deleting vocabulary ..."
rm Vocabulary/ORBvoc.txt
