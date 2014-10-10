#Base Doocker build

---
#### This is a nginx+php5+mongodb build which is a very basic and common setup for most projects. This does not contain the mysql since it has be moved to a separate server or container or connect to local host machine.


To build this image:

	```
	docker build —tag=jovani/base-web .
	```

Test if everything in it is setup correctly, create a temporay container:

	```
	docker run -it --rm jovani/base-web
	```

then you should see that nginx welcome page when you open this container via a browser.
