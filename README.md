# circleci-wordpress
Lightweight Docker image for CircleCI 2.0 to test WordPress sites.

## Image Base
* Alpine 3.4

## What's Included
|Component|Version|
|---------|-------|
|WordPress|4.7.3  |
|Nginx    |1.11.13|
|PHP-FPM  |5.6.30 |
|NodeJS   |6.10.2 |
|Ruby     |2.3.1  |

## Requirements
* A separate, linked database container named "database".
