#Docker setup for onTap

---

1. Update your machine’s /etc/hosts pointing www.dev.ontap.com.au and api.dev.ontap.com.au to you docker VM ip (e.g. 192.168.59.103 if using boot2docker in OS X)
2. Build the docker image:

	```
	docker build —tag=bywave/ontap .
	```

3. Run a container with that image:

	```
	docker run -it --name ontap -p 80:80 -p 27017:27017 -p 443:443 -p 3306:3306 -p 9001:9001 bywave/ontap
	```

4. While inside the container (a bash shell should be prompted after that docker run command):
	* Clone repo as /var/www/ontapcars. You may add this container's ssh key to your github account:
	
	```
	git clone git@github.com:Bywave/ontapcars.git /var/www/ontapcars
	```
	
	* Setup the project:
	
	```
	cd /var/www/ontapcars
	php init	
	composer install
	chown -R www-data:www-data /var/www
	```

**MySQL can be access via the Docker VM ip (e.g. 192.168.58.103)**

```
port 3306
user admin
password @dm1n
```

### For Windows and OS X, the project needs to be shared via samba:

Check it here: https://registry.hub.docker.com/u/svendowideit/samba/

Then you can use your fave IDE and begin coding inside that samba shared folder.

