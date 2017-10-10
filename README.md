# docker-centos-mariadb
## MariaDB running on CentOS 7.4rrent running on CentOS 7.4
### Build Version: 3
Date of Build: 10th October 2017

CentOS 7 container with MariaDB installed. The EPEL repository is added for the supervisor daemon.

The /var/lib/mysql volume should be imported from a host filesystem, as this contains the actual MariaDB data. The supervisor daemon is responsible for managing the httpd and crond processes and has a web based management utility exposed on port 9004 with a default username and password combination of admin:admin.

The container can be started as follows:

    docker run -d -h <hostname of container> -n <name of container> -e TZ="Europe/London" -v <location of MariaDB data on host>:/var/lib/mysql -p 3306:3306 -p 9004:9004 jervine/docker-centos-mariadb
  
The TZ variable if not set will default ot using UTC.

We should probably expose the my.cnf file and my.cnf.d directory (or point to a custom configuration directory and then import this volume from the host filesystem. I should also modify the start.sh script to go through the mysql_safe_installation parts - I can take this from the Icinga2 container though. 
