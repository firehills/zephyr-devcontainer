# Basic Zephyr setup using DevContiainer

Example of a minimal Zephyr setup using devcontainers and VSCode

## Host 

1. Install and run docker-desktop
https://www.docker.com/products/docker-desktop/

2. Install and run Visual Studio Code
https://code.visualstudio.com/

3. Install the "Dev Containers" extension in VSCode

4. Checkout this repo 
git clone https://github.com/firehills/zephyr-devcontainer.git

5. Open the dir in VSCode
Click Reopen in Container

The container is created. This may take some time on the first go.  
See .devcontainer/Dockerfile for the linux setup - this also pulls in host dependencies required by Zephyr

Zephyr and SDK is setup in scripts/post-create.sh


## Build

Setup virtual env
```sh
cd ~/zephyrproject
source .venv/bin/activate
```

Build an example for Nordic nRF52840 - Note see "west boards" for supported alternatives
```sh
cd ~/zephyrproject/zephyr
west build -p always -b nrf52840dk/nrf52840 samples/basic/blinky
```

Example output from the build 
```sh
vscode ➜ /workspaces/zephyr-devcontainer (main) $ cd ~/zephyrproject
vscode ➜ ~/zephyrproject $ source .venv/bin/activate
(.venv) vscode ➜ ~/zephyrproject $ cd ~/zephyrproject/zephyr
(.venv) vscode ➜ ~/zephyrproject/zephyr (main) $ west build -p always -b nrf52840dk/nrf52840 samples/basic/blinky
-- west build: generating a build system
Loading Zephyr default modules (Zephyr base).
-- Application: /home/vscode/zephyrproject/zephyr/samples/basic/blinky
-- CMake version: 3.25.1
-- Found Python3: /home/vscode/zephyrproject/.venv/bin/python3 (found suitable version "3.12.9", minimum required is "3.10") found components: Interpreter 
-- Cache files will be written to: /home/vscode/.cache/zephyr
-- Zephyr version: 4.1.99 (/home/vscode/zephyrproject/zephyr)
-- Found west (found suitable version "1.3.0", minimum required is "0.14.0")
-- Board: nrf52840dk, qualifiers: nrf52840
-- ZEPHYR_TOOLCHAIN_VARIANT not set, trying to locate Zephyr SDK
-- Found host-tools: zephyr 0.17.0 (/home/vscode/zephyr-sdk-0.17.0)
-- Found toolchain: zephyr 0.17.0 (/home/vscode/zephyr-sdk-0.17.0)
-- Found Dtc: /home/vscode/zephyr-sdk-0.17.0/sysroots/x86_64-pokysdk-linux/usr/bin/dtc (found suitable version "1.6.0", minimum required is "1.4.6") 
-- Found BOARD.dts: /home/vscode/zephyrproject/zephyr/boards/nordic/nrf52840dk/nrf52840dk_nrf52840.dts
-- Generated zephyr.dts: /home/vscode/zephyrproject/zephyr/build/zephyr/zephyr.dts
-- Generated pickled edt: /home/vscode/zephyrproject/zephyr/build/zephyr/edt.pickle
-- Generated devicetree_generated.h: /home/vscode/zephyrproject/zephyr/build/zephyr/include/generated/zephyr/devicetree_generated.h
-- Including generated dts.cmake file: /home/vscode/zephyrproject/zephyr/build/zephyr/dts.cmake
Parsing /home/vscode/zephyrproject/zephyr/Kconfig
Loaded configuration '/home/vscode/zephyrproject/zephyr/boards/nordic/nrf52840dk/nrf52840dk_nrf52840_defconfig'
Merged configuration '/home/vscode/zephyrproject/zephyr/samples/basic/blinky/prj.conf'
Configuration saved to '/home/vscode/zephyrproject/zephyr/build/zephyr/.config'
Kconfig header saved to '/home/vscode/zephyrproject/zephyr/build/zephyr/include/generated/zephyr/autoconf.h'
-- Found GnuLd: /home/vscode/zephyr-sdk-0.17.0/arm-zephyr-eabi/arm-zephyr-eabi/bin/ld.bfd (found version "2.38") 
-- The C compiler identification is GNU 12.2.0
-- The CXX compiler identification is GNU 12.2.0
-- The ASM compiler identification is GNU
-- Found assembler: /home/vscode/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/arm-zephyr-eabi-gcc
-- Using ccache: /usr/bin/ccache
-- Configuring done
-- Generating done
-- Build files have been written to: /home/vscode/zephyrproject/zephyr/build
-- west build: building application
[1/144] Preparing syscall dependency handling

[3/144] Generating include/generated/zephyr/version.h
-- Zephyr version: 4.1.99 (/home/vscode/zephyrproject/zephyr), build: v4.1.0-2563-g90cd350c5a4a
[144/144] Linking C executable zephyr/zephyr.elf
Memory region         Used Size  Region Size  %age Used
           FLASH:       18860 B         1 MB      1.80%
             RAM:        5696 B       256 KB      2.17%
        IDT_LIST:          0 GB        32 KB      0.00%
Generating files from /home/vscode/zephyrproject/zephyr/build/zephyr/zephyr.elf for board: nrf52840dk
(.venv) vscode ➜ ~/zephyrproject/zephyr (main) $ 
```