# hackathon-vol1 -- NetApp's Hackers Night!

![alt text](https://cloud.githubusercontent.com/assets/8753615/17655610/1e46e3e4-6265-11e6-80b2-a80222830ede.jpg "Challenge #1")

![alt text](https://cloud.githubusercontent.com/assets/8753615/17655608/1caa42f6-6265-11e6-844a-8e624ff35ef7.jpg "Challenge #2")



Software in this repo includes two services:

* **camera-webservice**: Web service that exposes a RESTful API to use a local webcam to take a photo, upload it to an S3 target, and posts metadata to ElasticSearch.  The service is written in Python and configured using a json formatted conf file. This service can be deployed on a raspberry pi or your laptop.

* **webapp**: Web app that queries ElasticSearch for available cameras and  already-taken photos as well as allows you to take more.  Written in Ruby, configured using a json formatted conf file, and includes a Dockerfile for containerized use.

# Hack-night instructions

The hack-night is intended to be a lightly structured event designed to allow hackers to explore, innovate and learn.  The following instructions are provided as general roadmap to provide some structure.

## What's Level Hacker Are You?
Hackers are encouraged and should feel free to customize their work as they choose.

* **Novice hackers (newbies):**
May want to follow the activity outline more closely. They may want to pair up with another Intermediate hacker for additional support.  Novice hackers should definitely review the [PREWORK.md](PREWORK.md) document prior to the event to make sure they are prepared to get the most out of the event.

The instructions provided below are most likely not detailed enough for a novice hacker.  Please contact the hack-night lead for additional supporting documentation - which provides a few more step-by-step instructions.

* **Intermediate hackers:**
The instructions below are written with the Intermediate hacker in mind.  The instructions are intentionally terse with the assumption that the hacker will use resources like **Google** to provide missing information.  

The intermediate hacker should explore inside the files provided in Git to look for opportunities to customize, extend and improve the implementation.

If you are already familiar with learnings in a particular portion of the instructions, move along as quickly as you like to the next section where you can explore new ideas and technology.    

* **Advanced hackers:**
Advanced should scan the below instructions and then create there own roadmap or project.  Advanced users are also welcome to come in with their own project or an idea for advanced integration.

* **Other Hacker ideas:**
See the file named [OtherHackerIdeas.md](OtherHackerIdeas.md) for some potentially interesting extensions to the hack-night activity.  Please feel free to share these ideas with the rest of the team - specifically with a focus on how these help NetApp SE's better understand 3rd Platform/DevOps customers and sales motion.  

## Getting help
Google and Youtube is how the modern developer learns.  If you have a question, are getting an error message, or need to learn to do something - **Try Google first**.

If you then get stuck - ask your teammates - We are **"Team NetApp"** - never fail alone!

If you are still stuck - ask a hack-night lead for help.

## Hack-night Modules
The hack-night instructions are divided into modules to help provide structure and to help the hack-night leaders assess progress.

### *=> START HERE* Get the latest Hack-night files from GitHub
You will want to get (clone) the hack-night files from this repo (i.e. the one you are reading now!)

Hint: You will need a clone on both the RaspberryPI and your own laptop.

Once you have cloned your workspace, create a personal Git branch since you are going to make changes to the source code.  Once you have made your changes on your branch, you will do a GitHub 'Pull Request' and push your changed back to GitHub for team review.


### Module 0: Pre-Hack Night work
Look in a file named [PREWORK.md](PREWORK.md) which details suggested activities to do **BEFORE** coming to hack-night.  It is encouraged that all hackers read thru the [PREWORK.md](PREWORK.md) document - even if that means you are doing that during the event.  

### Module 1: Connect to RaspberryPI, Take Picture and View the image
1. SSH to remotely connect to your RaspberryPI.
2. Install the fswebcam and figure out how to take a picture.
   * Hint: Google "fswebcam"
   * Note: You may need to run the following command to load the camera driver.
   * *%> sudo modprobe bcm2835-v4l2*
3. Copy the image back to your PC (using SCP) and view the image.

### Module 2: Connect to S3 and Create a Bucket - Connect to ElasticSearch
* For security reasons, the instructor will provide an email which contains information on how to connect to the SGWS S3.  The same email will provide instructions for connecting to the ElasticSearch server.

1. Install a S3 browser tool like "*S3 browser*" for Windows or "*CyberDuck*" for Mac Note: CyberDuck won't allow you to set Bucket Policies, so you will have to do this in another way in a later step.
2. Connect, create a S3 bucket, then upload/download a file or image.
3. Set the bucket policy to allow anonymous access to objects in your bucket and verify access to an object you uploaded via a web browser
3. Install an ElasticSearch Toolbox and connect to the ElasticSearch server.

### Module 3: Setup RaspberryPI Camera Webservice
* The files and instructions you need are in the [camera-webservice](camera-webservice) directory.

### Module 4: Get Webservice to upload S3 images
Instructions are in the [camera-webservice/README.md](camera-webservice/README.md) file

### Module 5: Get Webservice to upload ElasticSearch data
Instructions are in the [camera-webservice/README.md](camera-webservice/README.md) file

### Module 6: Explore and search with ElasticSearch
Using the ElasticSearch Toolbox tools explore the data updated by all the hackers.  Come up with an idea of what to search.

### Module 7: Setup and run Docker on your laptop
This module will be performed on your laptop and will not require the RaspberryPI.

1. Docker needs to be installed on your laptop.  NOTE: There are different installers for Windows 10 and releases older than Windows 10 so be aware!
2. Test some containers such as Ubuntu and httpd.
3. Create your own Dockerfile based on an inherited container (aka Ubuntu or httpd)

### Module 8: Run a Docker based webservice
Clone web app from github, build a container for your web app, start container, verify you can access and take a photo.

* The files and instructions can be found in the [webapp/README.md](webapp/README.md) directory.  

### Module 9: Commit your changes back to github
Issue a GitHub 'Pull Request' to submit your changes back to GitHub for review and merging back to mainline.

### Module 10: Create your own module
The repository has a file called [OtherHackerIdeas.md](OtherHackerIdeas.md).  Attack one of those idea or come up with your own.
