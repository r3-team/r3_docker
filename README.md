# REI3 dockerfile
Central repo for running REI3 in Docker. It includes:
* A dockerfile to get a working REI3 image.
* Docker Compose files for x64 and arm64 architectures to get a fully contained REI3 system up and running.

This Docker release has been designed for development and testing purposes. Please do not use this configuration for running REI3 in production.

## How to use
1. Make sure that Docker & Docker Compose are available on your system. 
1. Download the Docker Compose file for your OS architecture (x64/arm64) from [rei3.de](https://rei3.de/en/downloads) to a location of your choice.
1. Inside the chosen directory, run: `docker compose up`
1. Once you get `Starting web server [...]` REI3 is ready to be used.
1. Use a modern browser to access REI3.
   * By default, you can access REI3 at `http://localhost:14000`
   * Default username/password are both `admin`

## Environment parameters
* R3_VERSION: Which REI3 version to run.
* R3_DB_NAME: Name of the PostgreSQL DB.
* R3_DB_USER: Name of the PostgreSQL role.
* R3_DB_PASS: Passwort of the PostgreSQL role.

## How to run an older version of REI3
Set the environment variable R3_VERSION to the version you desire before running `docker compose up`. Examples:
* Linux
  * export R3_VERSION=3.7.3
  * export R3_VERSION=3.5.4
* Windows
  * SET R3_VERSION=3.7.3
  * SET R3_VERSION=3.5.4

The chosen version must be available on [rei3.de](https://rei3.de/en/downloads) under `all releases`.

## How to upgrade REI3
When the Docker / Docker Compose files are unchanged, you can follow this explanation to upgrade REI3. If you made changes to these files, please disregard the following as it cannot account for your changes.

In any case, make sure to backup your data before attempting to upgrade your REI3 system.

In the default configuration, the REI3 database and data directory are both placed in Docker volumes; these volumes contain the application state. This means that to upgrade REI3, you can delete active REI3 containers (NOT the volumes!) and boot them up again with a newer version. To update to a specific version, you can set the environment variable `R3_VERSION` to the version you want to upgrade to.

Under Linux an upgrade procedure from REI3.5.4 to REI3.6 could look like this (check `docker ps` to get your container names):
* docker stop r3.5.4_app r3.5.4_db
* docker rm r3.5.4_app r3.5.4_db
* export R3_VERSION=3.6
* docker compose up
