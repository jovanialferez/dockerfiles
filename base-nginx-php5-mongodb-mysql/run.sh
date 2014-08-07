#!/bin/bash
if [ ! -f /.mysql_admin_created ]; then
	/scripts/create_mysql_admin_user.sh
fi

/usr/sbin/service supervisor start

# it needs to started after all other stuff
/usr/bin/supervisorctl start php5-fpm

/bin/bash
