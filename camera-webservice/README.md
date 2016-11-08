#camera-webservice

## Summary: 
A Python webservice called webservice.py was written for this Hack-night event.  Google won't help you with any information specifically about the script, but you will find lots of information about the libraries used in the script.  

The process to getting the webservice running can be done in one go, but many find it easier to build it up in steps:

1. Install dependencies and then get the basic webservice running
2. Get the webservice to snap pictures
3. Get the webservice to upload images to S3
4. Get the webservice to upload meta data to ElasticSearch.

### Key learnings
Now is a good time to make sure you understand all the dependencies and packages that are needed.  Part of the learning is to understand what *'python-pip'* is, what *'boto3'* is used for and how it, and how to install Python packages.  Learn about *flask*.  The hack-night leader might stop and ask you what they are.

This is a good time to **"Ask Google"** - *"what is boto3"* or *"how to install boto3*.  These are all open source libraries and tools.    

### Step 0 - Configure service - `config.json` ###
1. First rename the `config.json.example` to `config.json`
2. Next, update all parameters to meet your needs
**Note:** Use the same values you used previously.  
3. For the `camera_command` parameter these might be helpful:
  * Example linux USB camera: `fswebcam -r 640x480 --jpeg 85 --no-banner`
  * Example native raspberry camera module: `raspistill -o`
  * Example windows usb camera: `CommandCam.exe /quiet /filename`

### Step 1 - Install required packages.  Test the webservice.
The webservice.py script has the following dependencies. Make sure these are installed.

* OS Package dependencies (use `apt-get` to install): `python-pip` 
* Python module dependencies (use `pip` to install): `flask flask-restful pillow boto3 elasticsearch picamera`
* On Windows: [CommandCam](https://batchloaf.wordpress.com/commandcam/) photo software placed in same directory as `webservice.py`

* Start the webservice and check that it is running.

### Step 2 - Test the webservice is running
* Load the browser to `http://ip_address:8080`
* Debug: if errors, check that the program packages are installed.

### Common: Step 3 - Test taking a simple picture
* Load the browser to `http://ip_address:8080/take_photo`
* Did you see a picture.  If the camera did not work, go back and test that taking the photo is working.

## More hacking ideas - Keep Going!
1. Add more key/value pair information to the ElasticSearch post.  If you were going to add meta data to an image, what sort of meta data might you include about the picture?
2. Upload a file to ElasticSearch - think what if I uploaded a perfstat to Elasticsearch every hour, then let Elasticsearch search and report on the information in the perfstat file.  Is this practical application.
3. Add object attributes to the S3 upload.  
4. Change the RESTful API calls.  If you don't like `http://ip_address/test`, change it to something else. 