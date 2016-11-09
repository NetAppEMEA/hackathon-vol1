# hackathon-vol1 -- NetApp's Hackers Night @ Insight EMEA!

![alt text](https://cloud.githubusercontent.com/assets/8753615/17655610/1e46e3e4-6265-11e6-80b2-a80222830ede.jpg "Challenge #1")

![alt text](https://cloud.githubusercontent.com/assets/8753615/17655608/1caa42f6-6265-11e6-844a-8e624ff35ef7.jpg "Challenge #2")

Software in this repo includes two services:

* **camera-webservice**: Web service that exposes a RESTful API to use a local webcam to take a photo, upload it to an S3 target, and posts metadata to ElasticSearch.  The service is written in Python and configured using a json formatted conf file. This service can be deployed on a raspberry pi or our laptop.

* **webapp**: Web app that queries ElasticSearch for available cameras and already-taken photos as well as allows you to take more.  Written in Ruby and includes a Dockerfile for containerized use.

# Hack-night instructions

The hack-night is intended to be a lightly structured event designed to allow hackers to explore, innovate and learn. The following instructions are provided as general roadmap to provide some structure.

## Getting help
* Google and YouTube are your best friends. If you have a question, are getting an error message, or need to learn something, then google first
* If you then get stuck, ask your teammates
* If you are still stuck, ask a hack-night lead for help

## Hack-night Steps

The hack-night instructions are divided into modules to help provide structure and to help the hack-night leaders assess progress.

1. You will want to get (clone) the hack-night files from this repo (i.e. the one you are reading now!)
 * Hint: You will need a clone on both the RaspberryPI and your own laptop.
1. Look in a file named [PREWORK.md](PREWORK.md) which details suggested activities to do before coming to hack-night.
1. Create S3 Bucket and set Bucket Policies
1. Deploy webservice on Rapsberry Pi - more infos under [camera-webservice/README.md](camera-webservice/README.md)
1. Make sure the webservice is posting pictures to S3
 * Install a S3 browser tool like "*S3 browser*" for Windows or "*CyberDuck*" for Mac
 * FYI, CyberDuck won't allow you to set Bucket Policies, so you will have to do this in another way in a later step.
 * Set the bucket policy to allow anonymous access to objects in your bucket and verify access to an object you uploaded via a web browser
1. Setup Docker on your Laptop, see information in [webapp/README.md](webapp/README.md)
1. Build the container witht the webapp fronted
1. Run the containerized webapp frontend on your laptop

## Do more!
The repository has a file called [OtherHackerIdeas.md](OtherHackerIdeas.md). Attack one of those idea or come up with your own.
