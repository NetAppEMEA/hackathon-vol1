# webapp

One service is available:

* `webapp.rb`: Web app written in Ruby using Sinatra. Includes a Dockerfile for containerized use.
* Use the dockerfile to build a container and run it on your laptop/host


### Setup Docker and web app (webapp)
1. Install docker machine on your laptop.
2. Test that Docker is running properly. Test some containers (try docker/whalesay, Ubuntu and nginx examples).
  * Complete the Docker quickstart if you need to learn about Docker.  Did you try Whalesay?
3. Clone hacker event code from github to your laptop.
4. Build a container for your webapp, the run the container.
  * Verify you can access the webapp and take a photos from remote RaspPis.

*Hints*

* Use git to clone the repo and configure the `webapp`
* Show local container images:
 *  `docker images`
 * Build a container (don't miss the dot '.' at the end):
  *  `docker build -t <image_name> .`
* Run a container:
 *  `docker run --rm -it -p <host_port>:<container_port> <image_id>`
* Show all running and non-running containers:
 *  `docker ps`
 *  `docker ps -a`
* Stop a running container:
 *  `docker stop <id>`
* Exec a command (like a shell) into a running container:
 *  `docker exec -it <container-name-or-id> bash`
* To detach yourself from the container, use the escape sequence CTRL+P followed by CTRL+Q.

## *Cheaters* Detailed instructions for running the Docker webclient

1. Download and install docker on your pc.

2. Complete both the Docker installation and Quickstart instructions.
  * https://docs.docker.com/engine/getstarted/step_one/

3. Run a simple container to verify it works (try other words instead of boo):
  * `docker images`
  * `docker run --rm -it egray/cmatrix`
  * `docker ps –a`
  * `docker images`

4. And another, this time lets run Ubuntu latest with an interactive shell:
  * `docker run -it ubuntu:latest bash`
  * `root@93330ed8220c:/# cat /etc/*rel*`

  ```
  DISTRIB_ID=Ubuntu
  DISTRIB_RELEASE=16.04
  DISTRIB_CODENAME=xenial
  DISTRIB_DESCRIPTION="Ubuntu 16.04 LTS"
  ```

  * `root@93330ed8220c:/# ps -ef`

  ```
  UID        PID  PPID  C STIME TTY          TIME CMD
  root         1     0  1 09:45 ?        00:00:00 bash
  root         9     1  0 09:45 ?        00:00:00 ps –ef
  ```

  * `root@93330ed8220c:/# exit`

5. Or a webserver with nginx latest:
  * `run -d -p 80:80 --name webserver nginx`
  * `docker ps`

  ```
  CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS           
    PORTS                         NAMES
  0edfb82709c1        nginx               "nginx -g 'daemon off"   About a minute ago   Up About a minute   
    0.0.0.0:80->80/tcp, 443/tcp   webserver                     hungry_williams
  ```

  * So this is mapping port 80 in the container to port 80 on the docker host.  
  * Get your docker host IP using the `docker inspect <image_id>`.  
  * `docker inspect -f '{{ .NetworkSettings.IPAddress }}' <image_id>`
  * Then open http://localhost:80 and see if it works. Now exec a command to open shell in that container
  * Now start a second ngix instance on port 81.  How might you do this?  Connect to both instances.  Now kill off the nginx running on port 80 and see if you can still connect to both services.

6. Clone the hackathon repo from git to get the webclient code and cd into it:
  * `git clone https://github.com/NetAppEMEA/hackathon-vol1-insight`
  * `cd hackathon-vol1-insight/webapp`

7. Edit the webapp to set your desired camera IP
	  * `cd hackathon-vol1-insight/webapp`
	  * `nano webapp.rb`
      check that the path to the Elastricsearch server is correct.  Look at the webapp.rb code.

8. Build and run container
	  * `cd hackathon-vol1-insight/webapp`
	  * `docker build -t netapp/webapp .`
	  * `docker images`
	  * `docker run -it -p 8081:8081 netapp/webapp`

    To detach yourself from the container, use the escape sequence CTRL+P followed by CTRL+Q.  

    If you change the webapp.rb file, you need to rebuild the docker image to use the updated Ruby file.

9. Go to `http://localhost:8081` and see if it loads.  Take a picture and see if it loads.

10. Start hacking.  Change to manage a different camera (don’t forget to stop your container or run a new one on a different port), or extend the service to allow taking photos from multiple cameras, or whatever.  Hack!

## More hacking ideas - Keep Going!
1. Learn HAML and create a nicer webpage.
2. Improve the Elasticsearch search to look for RaspberryPI units which posted in the last hour.  In other words filter out RaspberryPI entries from prior hacker events.
3. Update the HAML to show the image captured by the remote RaspberryPI.  
