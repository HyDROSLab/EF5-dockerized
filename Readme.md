# `Dockerized` Ensemble Framework For Flash Flood Forecasting (EF5)  

*Containerized* (Docker) version of **EF5**, which enables users to easily build, configure and run EF5 on their local machines.

## General Information

This project builds a single, minimal, Docker Linux image based on [Alpine Linux 3.17](https://hub.docker.com/_/alpine). When the image is built, it will install the needed dependencies to build EF5, then proceed to clone EF5's source code from the main [EF5 repository from GitHub](https://github.com/HyDROSLab/EF5), and finally it will compile the EF5 executable. The EF5 installation will be placed in the path `/ef5` **WITHIN THE RUNNING CONTAINER** (*i.e. not directly accessible to the user*). It will also define the following *volumes* (_folders_) **WITHIN THE RUNNING CONTAINER**: `/conf`, `/data`, `/results`. These will serve as communication points (_mount points_) between the container and the host machine (the user's computer), to provide inputs to EF5 (parameters and data), and to receive results (model outputs) from EF5's execution.

When this image is used to run a container, it will mount the follwing project folders, and make them available to the running image:
- **[./conf](./conf)** [RO]: where the running EF5 instance will look for a control file named [control.txt](./conf/control.txt) (*the control file __MUST__ be named `control.txt` for the default container configuration to work*). Further information regarding control files can be found in the [EF5 manual](./docs/manual.html). `This folder will be mounted on the container using read-only permissions, since EF5 only needs to read the control file.`
- **[./data](./data)** [RO]: where the running EF5 instance will look for data such as flow accumulation grids, digital elevation data, flow direction grids, kinematic wave parameter maps, and precipitation data. `This folder will be mounted on the container using read-only permissions, since EF5 only needs to read the input data and parameters.`
- **[./results](./results/)** [RW]: where the running EF5 instance will write model results and state outputs, so that the user can retain a copy of these results on the host machine once the container finishes running EF5. `This folder will be mounted on the container using read-write permissions, since EF5 must be able to write outputs to this folder.`

# Docker

>*Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.*  ([Amazon AWS](https://aws.amazon.com/docker/))

Docker is required to build and deploy this version of EF5. You will need to install either Docker Desktop or Docker Engine, depending on the Operating System you are using.

>Even though [Docker Desktop has bee released for Linux](https://docs.docker.com/desktop/install/linux-install/), the present project **HAS NOT BEEN TESTED** using this king of Docker installation. **If you are using Linux, please make sure to install and use the [Docker Engine](#docker-engine)**.

## Installing Docker

Please follow the [official Docker documentation](https://docs.docker.com/get-docker/) in order to install Docker on your system before proceeding any further.

![Docker Documentation Page](./docs/img/0-DockerDocumentation.png)  
*Official Docker Documentation Page*

> **NOTE:** If you are running MacOS, please note that there are **TWO DIFFERENT VERSIONS** of Docker Desktop: one for `Intel-based Macs`, and other for `Apple Silicon-based Macs` (*i.e.* Macs with M1 or M2 processors). Please choose the one which matches your machine's processor type.
>![Mac Intel Chip or Apple Silicon](./docs/img/1-DockerMac_IntelApple.png)  
*Docker Documentation - Mac Intel Chip or Apple Silicon*

### Docker Desktop
- [Windows](https://docs.docker.com/desktop/install/windows-install/)
- [Mac](https://docs.docker.com/desktop/install/mac-install/)

### Docker Engine
- [Linux](https://docs.docker.com/engine/install/)

>If you have any troubles installing Docker on you machine, please refer to the Official Docker documentation, or to the [Troubleshooting](#troubleshooting) section at the end of this Readme file.

# Dockerized EF5

Having installed either [Docker Desktop](https://docs.docker.com/desktop/) or [Docker Engine](https://docs.docker.com/engine/) on your system, you can proceed to build and execute the EF5 *container* on your local machine. 

## Download this repository

### GIT

If you are familiar with `git` and `github` repositories, please `clone` this repository on your local machine. If not, please follow the [instructions below](#download-a-zip-file).

### Download a ZIP file

On the top part of this Github repository page, you will find a green `code` button. Click on it to display a new pane with options, and subsequently, click on the `Download Zip` button, at the bottom of the pane that opens. 

![Download or Clone this Repository](./docs/img/2-DownloadClone_Repo.png)  
*Downloading or Cloning the EF5-dockerized repository*

This will prompt your web browser to download a `.zip` file with the contents of this repository. Please save it in a place you can find easily for the followint steps.

![Download the EF5-dockerized Zip File](./docs/img/3-Download_Zip.png)  
*Downloading the EF5-dockerized Zip file*

>Note: your browser might have not have prompted you for a location where to save the file, and most likely you'll find it in your `Downloads` folder in your "home directory".

To continue, please follow the instructions below, according to the Operating System you are running. Currently supported plaftorms are [Linux](#linux), [Windows](#windows) and [MacOS](#macos).

## Windows

Once Docker Desktop is installed, 

### Building the EF5 container image

### Running the EF5 container image

## MacOS

### Building the EF5 container image

### Running the EF5 container image

## Linux

### Building the EF5 container image

![Building the EF5 Docker Image - Linux](./docs/img/Linux/1-Build_ShellScript.png)  
*Building the EF5 Docker Image under Linux*

### Running the EF5 container image

![Running EF5 container 1 - Linux](./docs/img/Linux/2-Run_ShellScript1.png)  
*Running the EF5 container under Linux #1*

![Running EF5 container 2 - Linux](./docs/img/Linux/3-Run_ShellScript2.png)  
*Running the EF5 container under Linux*

![Results of EF5 execution - Linux](./docs/img/Linux/4-Run_Results.png)  
*Results of EF5 execution under Linux*

# Troubleshooting
## Docker Installation Troubleshooting
In this section you will find solutions to common issues when installing Docker. Please not that this is not a comprehensive list, and only documents the troubles that the developers might have encountered while developing the documentation for this containerized application.

## Windows Installation

When you download the Docker Desktop installer executable on your machine (`Docker Desktop Installer.exe`), double-click it to launch the installation process. Windows will likely prompt you with a `Security Warning`, asking you to confirm whether you want to proceed with the installation:

![Docker Desktop Installation - Windows Security](./docs/img/Windows/1-DockerPermissionsToInstall.PNG)  
*Docker Desktop Installation - Windows Security*

Please click on the `Run` button to continue with the installation. On the next screen, it is recommended to use the [Windows Subsystem for Linux](#windows-subsystem-for-linux-wsl-error), following the official installation documentation.

![Docker Desktop Installation - Windows Security](./docs/img/Windows/2-DockerInstall1.PNG)  
*Docker Desktop Installation - 1*

The installation will then take place, please be patient while Docker Desktop is installed.

![Docker Desktop Installation - Windows Security](./docs/img/Windows/2a-DockerInstall2.PNG)  
*Docker Desktop Installation - 2*

## Windows Subsystem for Linux (WSL) Error

Upon first launching Docker Desktop you may receive the following error about the Windows Subsystem for Linux:

![Docker - WSL Error](./docs/img/Windows/3a-WSLErrorUpdate.PNG) 
*Docker - WSL Error*

To install the WSL system, open a `command prompt` and enter the command `wsl --update`. This will install or update your WSL installation, as required by Docker Desktop:

![Docker - WSL Update](./docs/img/Windows/3b-WSLErrorUpdate2.PNG) 
*Docker - WSL Update*

# About EF5
EF5 was created by the Hydrometeorology and Remote Sensing Laboratory at the University of Oklahoma. The goal of EF5 is to have a framework for distributed hydrologic modeling that is user friendly, adaptable, expandable, all while being suitable for large scale (e.g. continental scale) modeling of flash floods with rapid forecast updates. Currently EF5 incorporates 3 water balance models including the Sacramento Soil Moisture Accouning Model (SAC-SMA), Coupled Routing and Excess Storage (CREST), and hydrophobic (HP). These water balance models can be coupled with either linear reservoir or kinematic wave routing. 

## Learn More

EF5 has a homepage at [http://ef5.ou.edu](http://ef5.ou.edu). The training modules are found at [http://ef5.ou.edu/training/](http://ef5.ou.edu/training/) while the YouTube videos may be found at [https://www.youtube.com/channel/UCgoGJtdeqHgwoYIRhkgMwog](https://www.youtube.com/channel/UCgoGJtdeqHgwoYIRhkgMwog). The source code is found on GitHub at [https://github.com/HyDROSLab/EF5](https://github.com/HyDROSLab/EF5).

See [./docs/manual.html](./docs/manual.html) for the **EF5 operating manual** which describes configuration options.

## Contributors

The following people are acknowledged for their contributions to the creation of EF5.

- Zac Flamig
- Humberto Vergara
- Race Clark
- JJ Gourley
- Yang Hong
