# ORB-SLAM3-Fixed

***A fork of the original [repo](https://github.com/UZ-SLAMLab/ORB_SLAM3) with many modifications***
Simple use, contains various fixes referring to several open issues. Build tested on Ubuntu 20.04 and ROS Noetic. 

Changes:
- Stable tag of Pangolin added to Thirdparty
- CXX Executables are now built with c++14
- Rectified camera model added
- Kitti odometry dataset-03 is included and relevant .yaml modified to simulate it correctly
- Evaluation python scripts converted to python3
- Convenient bash scripts added for ease of use

See comparison for further details.

### Demo video ###

[<img src="https://user-images.githubusercontent.com/17882644/226178619-081e2ce2-81f6-49db-bd26-05b3298cbad5.gif" width="90%"></img>](https://youtu.be/uyDB0oSnJ2U)

### TODOs ###

- [x] Test it with rosbag
- [ ] Test it with real camera and create scripts
- [ ] Fix python scripts for better trajectory evaluation (to remove drift)

### Requirements ###

- OpenCV 4.2 (Required at least 3.0)
- Eigen3: required at least 3.1.0
- Python3 and some additional libraries: Required to calculate the alignment of the trajectory with the ground truth. 

## Building ORB-SLAM3

Clone the repository:
  ```
  git clone https://github.com/kuralme/ORB_SLAM3.git
  cd ORB_SLAM3
  ```
  Execution permission to build scripts: ```chmod +x *.sh```

Build all the library including the thirdparty. Takes a while, go grab a coffee.
  ```
  bash build.sh
  ```
If it fails for some reason, you can also use `clean.sh` script to delete all the built libs and executables.


### Running ORB-SLAM3

Kitti dataset sequence 3 is included, chosen (due to small size) and added to the `Datasets` path.

To run the simulation:
  ```
  cd run_scripts
  chmod +x *.sh
  ```
  Start the execution
  ```
  bash kitti03_eval.sh
  ```
The scripts also execute trajectory evaluation. The result is extracted into the `evaluation` path.

### ROS

Tested with ROS Noetic under Ubuntu 20.04.

*To solve rospkg import error [issue](https://github.com/UZ-SLAMLab/ORB_SLAM3/issues/614#issuecomment-1204903859), install python-is-python3

 Add ROS package to path
  ```
  echo "export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/ORB_SLAM3/Examples/ROS" >> ~/.bashrc
  ```
 Build ros objects (rosbuild)
```
bash build_ros.sh
```

**Running ROS example:** 
Download raw data and [prepare](https://pages.github.com/) the rosbag. Kitti example:

  In the first terminal:  ```roscore  ```

  Second:
  ```
  rosbag play --pause kitti_2011_10_03_drive_0027_synced.bag /kitti/camera_color_left/image_raw:=/camera/left/image_raw /kitti/camera_color_right/image_raw:=/camera/right/image_raw
  ```
  Third:```rosrun ORB_SLAM3 Stereo Vocabulary/ORBvoc.txt Examples/Stereo/KITTI00-02.yaml false```
