# docker-owncloud-client
A terminal-only owncloud client based on debian:latest

This docker build is based on [https://github.com/idef1x/docker-owncloud-client](https://github.com/idef1x/docker-owncloud-client),
with the following changes:

* based on debian:latest instead of ubuntu:vivid
* defaults for some of the parameters. Only USER, PASSWORD, and URL are mandatory.
* logfile goes to the data container for easier reading (no passwords go to the log, as far as I see)

### Usage

* create a file `env.txt` and make it read only for root and no access for all others. This file contains the following lines:

    USER= <your owncloud username>
    PASSWORD= <your owncloud password>
    URL= <URL to the webdav-folder you want to synchronize>
    
