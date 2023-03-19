#Build DBoW2
cd Thirdparty/DBoW2
echo "Configuring and building Thirdparty/DBoW2 ..."
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j


# Build g2o
cd ../../g2o
echo "Configuring and building Thirdparty/g2o ..."
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j


# Build Sophus
cd ../../Sophus
echo "Configuring and building Thirdparty/Sophus ..."
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j


# Build Pangolin
cd ../../Pangolin
echo "Configuring and building Thirdparty/Pangolin ..."
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4


cd ../../../Vocabulary
echo "Uncompress vocabulary ..."
tar -xf ORBvoc.txt.tar.gz
cd ..

echo "Configuring and building ORB_SLAM3 ..."
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4
