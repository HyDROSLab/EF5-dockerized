# `Dockerized` Ensemble Framework For Flash Flood Forecasting (EF5)  

*Containerized* (Docker) version of **EF5**, which enables users to easily build, configure and run EF5 on their local machines. This project builds a single, minimal, Docker Linux image based on [Alpine Linux 3.17](https://hub.docker.com/_/alpine).

## General Information

When the image is built, it will install the needed dependencies to build EF5, then proceed to clone EF5's source code from the main [EF5 repository from GitHub](https://github.com/HyDROSLab/EF5), and finally it will compile the EF5 executable. The EF5 installation will be placed in the path `/ef5` **WITHIN THE RUNNING CONTAINER** (*i.e. not directly accessible to the user*). It will also define the following *volumes* (_folders_) **WITHIN THE RUNNING CONTAINER**: `/conf`, `/data`, `/results`. These will serve as communication points (_mount points_) between the container and the host machine (the user's computer), to provide inputs to EF5 (parameters and data), and to receive results (model outputs) from EF5's execution.

When this image is used to run a container, it will mount the follwing project folders, and make them available to the running image:
- **[./conf](./conf)** [RO]: where the running EF5 instance will look for a control file named [control.txt](./conf/control.txt) (*the control file __MUST__ be named `control.txt` for the default container configuration to work*). Further information regarding control files can be found in the [EF5 manual](./docs/manual.html). `This folder will be mounted on the container using read-only permissions, since EF5 only needs to read the control file.`
- **[./data](./data)** [RO]: where the running EF5 instance will look for data such as flow accumulation grids, digital elevation data, flow direction grids, kinematic wave parameter maps, and precipitation data. `This folder will be mounted on the container using read-only permissions, since EF5 only needs to read the input data and parameters.`
- **[./results](./results/)** [RW]: where the running EF5 instance will write model results and state outputs, so that the user can retain a copy of these results on the host machine once the container finishes running EF5. `This folder will be mounted on the container using read-write permissions, since EF5 must be able to write outputs to this folder.`

# Docker

## Installing Docker

# Dockerized EF5

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

## OS X

### Building the EF5 container image

### Running the EF5 container image

## Windows

### Building the EF5 container image

### Running the EF5 container image

# About EF5
EF5 was created by the Hydrometeorology and Remote Sensing Laboratory at the University of Oklahoma. The goal of EF5 is to have a framework for distributed hydrologic modeling that is user friendly, adaptable, expandable, all while being suitable for large scale (e.g. continental scale) modeling of flash floods with rapid forecast updates. Currently EF5 incorporates 3 water balance models including the Sacramento Soil Moisture Accouning Model (SAC-SMA), Coupled Routing and Excess Storage (CREST), and hydrophobic (HP). These water balance models can be coupled with either linear reservoir or kinematic wave routing. 

## Learn More

EF5 has a homepage at [http://ef5.ou.edu](http://ef5.ou.edu). The training modules are found at [http://ef5.ou.edu/training/](http://ef5.ou.edu/training/) while the YouTube videos may be found at [https://www.youtube.com/channel/UCgoGJtdeqHgwoYIRhkgMwog](https://www.youtube.com/channel/UCgoGJtdeqHgwoYIRhkgMwog). The source code is found on GitHub at [https://github.com/HyDROSLab/EF5](https://github.com/HyDROSLab/EF5).

See [./docs/manual.html](./docs/manual.html) for the **EF5 operating manual** which describes configuration options.

## Contributors

The following people are acknowledged for their contributions to the creation of EF5.

Zac Flamig

Humberto Vergara

Race Clark

JJ Gourley

Yang Hong
