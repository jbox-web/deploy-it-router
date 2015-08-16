## Deploy'It - Router

A simple systemd service based on docker-gen that generates reverse proxy configs for Nginx and reloads Nginx when containers are started and stopped. (Largely based on [nginx-proxy](https://github.com/jwilder/nginx-proxy))

## Installation

Grab docker-gen :

    $ wget https://github.com/jwilder/docker-gen/releases/download/0.4.0/docker-gen-linux-amd64-0.4.0.tar.gz
    $ tar xvzf docker-gen-linux-amd64-0.4.0.tar.gz
    $ mv docker-gen /usr/bin

Clone the repository

    $ git clone https://github.com/jbox-web/deploy-it-router.git
    $ cd deploy-it-router

Create configuration directory

    $ mkdir /etc/docker-gen
    $ cp nginx.tmpl notify.sh /etc/docker-gen
    $ cp docker-gen.service /lib/systemd/systemd
    $ systemctl enable docker-gen.service
    $ systemctl start docker-gen.service


## Copyrights & License

DeployIt is completely free and open source and released under the [AGPL3 License](https://github.com/jbox-web/deploy-it-router/blob/master/LICENSE).

Copyright (c) 2015 Nicolas Rodriguez (nrodriguez@jbox-web.com), JBox Web (http://www.jbox-web.com)
