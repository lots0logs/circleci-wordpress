# CircleCI WordPress
[![Docker Automated build](https://img.shields.io/docker/automated/lots0logs/circleci-wordpress.svg?style=flat-square)](https://hub.docker.com/r/lots0logs/circleci-wordpress/) &nbsp;[![Docker Build Status](https://img.shields.io/docker/build/lots0logs/circleci-wordpress.svg?style=flat-square)](https://hub.docker.com/r/lots0logs/circleci-wordpress/)

Docker image for running acceptance tests on a WordPress website using CircleCI 2.0 and Browserstack.

## Image Base
* Alpine 3.4

## What's Included
|Component|Version|
|---------|-------|
|WordPress|4.7.3  |
|WP-CLI   |1.1.0  |
|Composer |1.4.1  |
|Nginx    |1.11.13|
|PHP-FPM  |5.6.30 |
|NodeJS   |6.10.2 |
|Ruby     |2.3.1  |

## Requirements
* A separate, database container with port `3306` exposed.
