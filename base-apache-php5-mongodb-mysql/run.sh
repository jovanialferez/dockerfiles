#!/bin/bash

/usr/sbin/service supervisor start

# it needs to started after all other stuff
/usr/bin/supervisorctl start php5-fpm
/usr/bin/supervisorctl start apache

/bin/bash
