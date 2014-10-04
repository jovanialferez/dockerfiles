#Base Doocker build

---
#### This is a nginx+php5+mysql+mongodb build which is a very basic and common setup for most projects for Bywave.


To build this image:

	```
	docker build —tag=bywave/base .
	```

Test if everything in it is setup correctly, create a temporay container:

	```
	docker run -it --rm bywave/base
	```

then you should see that nginx welcome page when you open this container via a browser.
