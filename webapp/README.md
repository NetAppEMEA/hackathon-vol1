# webapp (Frontend)

* `webapp.rb`: Web app written in Ruby using Sinatra. Includes a Dockerfile for containerized use
* Use the `Dockerfile` to build a container and run it on your laptop or host
* Look at the `Dockerfile` to see how the app is build and configured

# Steps
1. Install Docker on your laptop (Docker for Windows or Mac)
2. Test that Docker is running properly, e.g., `docker run docker/whalesay`, or `docker run --rm -it egray/cmatrix`
3. Clone code from github to your laptop
4. Build a container for your webapp
5. Run the container and take and show photos

# Hints

* Use git to clone the repo and then configure the `webapp`
* Show local container images:
 * `docker images`
 * Build a container (don't miss the dot '.' at the end):
  * `docker build -t <image_name> .`
* Run a container:
 * `docker run --rm -it -p <host_port>:<container_port> <image_name>`
* Show all running and non-running containers:
 * `docker ps`
 * `docker ps -a`
* Stop a running container:
 * `docker stop <id>`
* Exec a command (like a shell) into a running container:
 * `docker exec -it <container-name-or-id> bash`
* To detach yourself from the container, use the escape sequence CTRL+P followed by CTRL+Q.
