#Docker build for the Klooma-API project
---

**This build is based on jovani/base build.**

1. Update your machine’s /etc/hosts pointing api.dev.klooma.com to your docker VM ip.

2. Build the docker image:

	```
	docker build —t jovani/klooma-api .
	```

3. Run a container with that image:

	```
	docker run -it --name klooma-api -p 80:80 -p 27017:27017 -p 443:443 -p 3306:3306 -p 9001:9001 -v /full/path/to/your/ontap/folder:/var/www jovani/klooma-api
	```

**MySQL can be access via the Docker VM ip**

```
port 3306
user admin
password @dm1n
```
