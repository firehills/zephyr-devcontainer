#!/bin/bash


# This maps back to host, however its better performance if its all kept in the container (?) 
ZEPHYR_ROOT=/workspaces/zephyrproject

START_TIMESTAMP=$(date)

python3 -m venv $ZEPHYR_ROOT/.venv
source $ZEPHYR_ROOT/.venv/bin/activate
pip install --upgrade pip
pip install west
west init $ZEPHYR_ROOT
cd $ZEPHYR_ROOT

# update now pulls in all the source code, can take a while.....
west update

# Export a Zephyr CMake package. This allows CMake to automatically load boilerplate code required for building Zephyr applications.
# see https://docs.zephyrproject.org/latest/build/zephyr_cmake_package.html#cmake-pkg
west zephyr-export

# Install Python dependencies.
west packages pip --install

# install SDK - "west sdk install" is all toolchains
# See https://github.com/zephyrproject-rtos/sdk-ng
cd $ZEPHYR_ROOT/zephyr

# ALL toolchains !! (Probably overkill!)
west sdk install


# TODO -> pick just the toolchains you want 
# See https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html#toolchain-zephyr-sdk-install

# TODO some combination of the below cmds...
#wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/zephyr-sdk-0.17.0_linux-x86_64_minimal.tar.xz
#wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/zephyr-sdk-0.17.0_linux-x86_64.tar.xz
#wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/toolchain_linux-x86_64_arm-zephyr-eabi.tar.xz

#wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/sha256.sum | shasum --check --ignore-missing
#tar xvf zephyr-sdk-0.17.0_linux-x86_64.tar.xz
#cd zephyr-sdk-0.17.0
#./setup.sh

# udev rules - which allow you to flash most Zephyr boards as a regular user:
#sudo cp ~/zephyr-sdk-0.17.0/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
#sudo udevadm control --reload

END_TIMESTAMP=$(date)
echo "START = $START_TIMESTAMP, END = $END_TIMESTAMP"
echo "=========================== DONE ==============================="
# run "west boards" to see supported builds 
# build blinkey 

# cd /workspaces/zephyrproject
# source .venv/bin/activate
# cd /workspaces/zephyrproject/zephyr
# west build -p always -b <your-board-name> samples/basic/blinky


# west build -p always -b nrf52840dk/nrf52840 samples/basic/blinky