# circleci-wordpress
Lightweight Docker image for CircleCI 2.0 to test WordPress sites.

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
