# Simple Python Project for Barbara Platform

This project provides a basic template for developing Python applications designed to run on the Barbara platform. The basic functionality will print:

* `appConfig` contents
* `globalConfig` contents
* `SECRET1`and `SECRET2`values stored in Secrets (environment variables defined in `barbarasecrets.env`).

## Docker Compose Files

The project includes two Docker Compose files:

* `docker-compose.yml`: This file is used for deploying the application **on a Barbara Edge Node**.
* `docker-compose_dev.yml`: This file is intended for development purposes **on your local machine**.

## Development Setup

To develop the project locally, use the following command:

```ShellSession
docker-compose -f docker-compose_dev.yml up --build
```

## Configuration

The code leverages Barbara's configuration features:

* **Appconfig Device Level (`global.json`)**: Provides device-level configuration settings.
* **Appconfig Application Level (`appconfig.json`)**: Stores application-specific configuration.
* **Secrets (environment variables defined in `barbarasecrets.env`)**: Holds sensitive information managed through environment variables.

## Deployment on Barbara

When you upload the project to Barbara, the platform automatically utilizes the docker-compose.yml file. Barbara also injects the necessary configuration and environment variables during the deployment process.

> [!IMPORTANT]  
> Ensure that your `docker-compose_dev.yml` and `docker-compose.yml` files are synchronized (except for configuration elements) to prevent inconsistencies between your development and deployment environment.
