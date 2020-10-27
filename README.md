# Basic STM32F4 Project

This is the most minimal STM32F4 project possible. It contains a single main file that runs an infinite loop without doing anything else. The purpose is to demonstrate the required embedded software tool chain.

Follow the steps below to upload this to an STM32F4 board.

The contents of this repository are based on the [tutorial](http://fab.cba.mit.edu/classes/863.13/tutorials/EmbeddedProgramming/stm32.html) written by Lukasz Podkalicki. Thanks Lukasz!

## Environment
This was tested in a Ubuntu 20.04 LTS environment. Other distributions might require modifications, particularly to install the stlink tool chain, which seems to need to be built from source for anything earlier than Ubuntu 20.x. 

I did all of this on a fresh Ubuntu 20.04 LTS guest VM running on VM Workstation on top of a Windows 10 host. 

## Step 1: Setup

### Step 1.1: Install Basic Dependencies
First we need to install some basic packages using the apt package manager: 

```
sudo update
sudo apt install git build-essential libusb-1.0-0-dev vim cmake
```

### Step 1.2: Install ARM Toolchain
We use the ARM GCC tool chain:

```
sudo apt install gcc-arm-none-eabi
```

### Step 1.3: Install the ST-Link Utility
This tool allows you to interface with the STM32F4xxx Nucleo development board. More specifically, it allows you to write directly into the SRAM of the STM32F4 microprocessor.

```
sudo apt install stlink-tools
```

Note, if you are running something other than Ubuntu 20.04 LTS, you might have to build this from source. See the [ST Link GitHub page](https://github.com/stlink-org/stlink) for more details.

## Step 2: Compile and Upload

### Step 2.1: Compile for ARM Target
The provided Makefile contains the required commands to compile and assemble the code for an ARM Cortex M4 microprocess target. Simply do in the root directory of this repository:

```
make
```

Which should produce a `main.bin` file in the working directory. Now upload this to the STM32 Nucleo using the stlink utility:

```
st-flash write main.bin 0x8000000
```

Note that, if you are using a VM, you will need to forward/connect the USB port that is connected to your board to the VM. In VMWare, do this under "Removable Devices". 

Note that this procedure does not work on the latest Windows Subsystem for Linux (WSL). I tried... the USB port is not properly setup or cannot be found by ST utilities.


## Extra Resources

Here some some links/resources that I found helpful: 

* [ST Link Utility GitHub](st-flash write main.bin 0x8000000)
* [Tutorial this repository is based on](https://blog.podkalicki.com/how-to-compile-and-burn-the-code-to-stm32-chip-on-linux-ubuntu/)
* [MIT Course Page](http://fab.cba.mit.edu/classes/863.13/tutorials/EmbeddedProgramming/stm32.html)

