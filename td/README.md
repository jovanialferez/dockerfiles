#Docker build for the onTapCars project
---

**This build is based on bywave/base build.**

1. Update your machine’s /etc/hosts pointing www.dev.transdirect.com.au to your docker VM ip.

2. Build the docker image:

	```
	docker build —tag=bywave/td .
	```

3. Run a container with that image:

	```
	docker run -it --name td -p 27017:27017 -p 443:443 -p 3306:3306 -p 9001:9001 -p 2222:22 -v /full/path/to/your/td/folder:/var/www bywave/td
	```


**MySQL can be access via the Docker VM ip**

```
port 3306
user admin
password @dm1n
```
