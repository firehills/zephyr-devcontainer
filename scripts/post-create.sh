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

# install SDK by default these install into home dir ~
# See https://github.com/zephyrproject-rtos/sdk-ng
cd $ZEPHYR_ROOT/zephyr

# ALL toolchains !! (Probably overkill!)
# west sdk install 

# Select toolchains (version selected from ${ZEPHYR_BASE}/SDK_VERSION file.)
west sdk install  -t aarch64-zephyr-elf arm-zephyr-eabi   

END_TIMESTAMP=$(date)
echo "START = $START_TIMESTAMP, END = $END_TIMESTAMP"
echo "=========================== DONE ==============================="
# run "west boards" to see supported builds 


# build blinkey 
# -------------

# cd /workspaces/zephyrproject
# source .venv/bin/activate
# cd /workspaces/zephyrproject/zephyr
# west build -p always -b <your-board-name> samples/basic/blinky


# west build -p always -b nrf52840dk/nrf52840 samples/basic/blinky