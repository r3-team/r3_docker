# REI3 dockerfile
Repository for an example implementation of REI3 in Docker. It includes:
* A dockerfile to get a working REI3 image.
* Docker Compose files for x64 and arm64 architectures to get a complete REI3 system up and running.

This Docker release has been designed for development and testing purposes. Please do not use this configuration for running REI3 in production.

## How to use
1. Make sure that Docker & Docker Compose are available on your system. 
1. Download the Docker Compose file for your OS architecture (x64/arm64) from [rei3.de](https://rei3.de/en/downloads) to a location of your choice.
1. Inside the chosen directory, run: `docker compose up`
1. Once you get `Starting web server [...]` REI3 is ready to be used.
1. Use a modern browser to access REI3.
   * By default, you can access REI3 at `http://localhost:14000`
   * Default username/password are both `admin`

## How to upgrade REI3
When the Docker / Docker Compose files are unchanged, you can follow this guide to upgrade REI3. If you made changes to these files, please disregard the following as it cannot account for your changes. In any case, make sure to backup your data before attempting to upgrade your REI3 system.

To upgrade, set the environment variable R3_VERSION to the desired version (such as 3.9.2), then execute docker compose up in your corresponding docker directory.

Under Linux an upgrade procedure from REI3.8.6 to REI3.9.2 could look like this:
* `export R3_VERSION=3.9.2`
* `docker compose up`

## How to deploy an older version of REI3
Set the environment variable R3_VERSION to the version you desire before running `docker compose up`. Examples:
* Linux
  * `export R3_VERSION=3.9.2`
* Windows
  * `SET R3_VERSION=3.9.2`

The chosen version must be available on [rei3.de](https://rei3.de/en/downloads) under `all releases`. You cannot downgrade existing REI3 instances as the DB cannot be downgraded automatically. Please make sure to have recent backups available before upgrading to a later release.

## Environment parameters
* R3_VERSION: Which REI3 version to run. Useful for deploying older versions or upgrading existing REI3 containers.
* R3_DB_NAME: Name of the PostgreSQL DB, should you want to overwrite it.
* R3_DB_USER: Name of the PostgreSQL role, should you want to overwrite it.
* R3_DB_PASS: Passwort of the PostgreSQL role, should you want to overwrite it.