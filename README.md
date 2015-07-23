# docker-owncloud-client
A terminal-only owncloud client based on debian:latest

This docker build is based on [https://github.com/idef1x/docker-owncloud-client](https://github.com/idef1x/docker-owncloud-client),
with the following changes:

* based on debian:latest instead of ubuntu:vivid
* defaults for some of the parameters. Only USER, PASSWORD, and URL are mandatory.

### Usage

Create a file `env.txt` and make it read only for root and no access for all others. This file contains the following lines:

     USER= <your owncloud username>
     PASSWORD= <your owncloud password>
     URL= <URL to the webdav-folder you want to synchronize>

Create and run the docker container like this:

    sudo docker run -d --env-file env.txt -v <host-folder>:/srv/owncloud --name <name for the container> rgwch/docker-owncloud-client:latest

### Examples

    USER=jemand
    PASSWORD=topSecret
    URL=https://www.some.where/owncloud/remote.php/webdav/synced/ebooks

and then:

    sudo docker run -d -env-file env.txt -v /srv/ebooks:/srv/owncloud --name calibre-books rgwch/docker-owncloud-client:latest

or

    sudo docker run -d -env-file env.txt -v /srv/owncloud --name calibre-books rgwch/docker-owncloud-client:latest

The first example will use a physical directory on the host to collect files from owncloud, while the second one creates and uses a docker data-container. A second docker container could use this data container like this:

    sudo docker run --volumes-from calibre-books -d -P rgwch/calibre-server
