# REI3 dockerfile
Central repo for running REI3 in docker. It includes:
* A dockerfile to get a working REI3 image.
* Docker compose files for x64 and arm64 architectures to get a fully contained REI3 system up and running.

This docker release has been designed for development and testing purposes. Please do not use this configuration for running REI3 in production.

## How to use
1. Make sure that docker & docker compose are available on your system. 
1. Download the docker compose file for your OS architecture (x64/arm64) from [rei3.de](https://rei3.de/en/downloads) to a location of your choice.
1. Inside the chosen directory, run: ```docker compose up```
1. Once you get ```Starting web server [...]``` REI3 is ready to be used.
1. Use a modern browser to access REI3.
   * By default, you can access REI3 at ```http://localhost:14000```
   * Default username/password are both ```admin```

## How to run an older version of R3
Set the environment variable R3_VERSION to the version you desire before running ```docker compose up```. Examples:
* Linux
  * export R3_VERSION=3.2
  * export R3_VERSION=3.1.3
* Windows
  * SET R3_VERSION=3.2
  * SET R3_VERSION=3.1.3

The chosen version must be available on [rei3.de](https://rei3.de/en/downloads) under 'all releases'.
