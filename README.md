# REI3 dockerfile
Central repo for the REI3 dockerfile.

## How to use
1. Make sure that docker & docker compose are available on your system. 
1. Download the docker compose file for your OS architecture (x64/arm64) from [rei3.de](https://rei3.de/en/downloads) to a location of your choice.
1. Inside the chosen directory, run: ```docker compose up```

## How to run an older version of R3
Set the environment variable R3_VERSION to the version you desire. Examples:
* export R3_VERSION=3.2
* export R3_VERSION=3.1.3
* export R3_VERSION=3.0.1

The chosen version must be available on [rei3.de](https://rei3.de/en/downloads) under 'all releases'.
