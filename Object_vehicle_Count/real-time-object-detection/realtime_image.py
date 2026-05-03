# USAGE
# python real_time_object_detection.py

# import the necessary packages
from imutils.video import VideoStream
import smtplib
import mimetypes
from email.message import EmailMessage
from imutils.video import FPS
import numpy as np
import argparse
import imutils
import time
import cv2
import sys

# construct the argument parse and parse the arguments
'''ap = argparse.ArgumentParser()
ap.add_argument("-p", "--prototxt", required=True,
	help="path to Caffe 'deploy' prototxt file")
ap.add_argument("-m", "--model", required=True,
	help="path to Caffe pre-trained model")
ap.add_argument("-c", "--confidence", type=float, default=0.2,
	help="minimum probability to filter weak detections")
args = vars(ap.parse_args())'''

# initialize the list of class labels MobileNet SSD was trained to
# detect, then generate a set of bounding box colors for each class
CLASSES = ["background", "aeroplane", "bicycle", "bird", "boat",
	"bottle", "Truck", "car", "cat", "chair", "cow", "diningtable",
	"dog", "horse", "motorbike", "person", "pottedplant", "sheep",
	"sofa", "train", "tvmonitor"]
COLORS = np.random.uniform(255, 255, size=(len(CLASSES), 3))

# load our serialized model from disk
print("[INFO] loading model...")
net = cv2.dnn.readNetFromCaffe('MobileNetSSD_deploy.prototxt.txt', 'MobileNetSSD_deploy.caffemodel')

# initialize the video stream, allow the cammera sensor to warmup,
# and initialize the FPS counter
print("[INFO] starting video stream...")
#vs = VideoStream(src=0).start()
time.sleep(2.0)
#fps = FPS().start()

# loop over the images from the video stream
#while True:
aeroplane=0
bicycle=0
Truck=0
motorbike=0
car=0;
person=0;
# grab the image from the threaded video stream and resize it
# to have a maximum width of 400 pixels
image = cv2.imread(sys.argv[1])
(h,w) = image.shape[:2]
blob = cv2.dnn.blobFromImage(cv2.resize(image, (300, 300)),
	0.007843, (300, 300), 127.5)
	# pass the blob through the network and obtain the detections and
# predictions
net.setInput(blob)
detections = net.forward()
	# loop over the detections
for i in np.arange(0, detections.shape[2]):
	# extract the confidence (i.e., probability) associated with
	# the prediction
	confidence = detections[0, 0, i, 2]
		# filter out weak detections by ensuring the `confidence` is
	# greater than the minimum confidence
	if confidence > 0.2:
		# extract the index of the class label from the
		# `detections`, then compute the (x, y)-coordinates of
		# the bounding box for the object
		idx = int(detections[0, 0, i, 1])
		box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
		(startX, startY, endX, endY) = box.astype("int")
			# draw the prediction on the image
		label = "{}: {:.2f}%".format(CLASSES[idx],
			confidence * 100)
		cv2.rectangle(image, (startX, startY), (endX, endY),
			COLORS[idx], 2)
		y = startY - 15 if startY - 15 > 15 else startY + 15
		cv2.putText(image, label, (startX, y),
			cv2.FONT_HERSHEY_SIMPLEX, 1, COLORS[idx], 2)
		if CLASSES[idx] == "car":
			car=car +1;
		
		if CLASSES[idx] == "person":
			person=person +1;
			
		if CLASSES[idx] == "bicycle":
			bicycle=bicycle +1;
			
		if CLASSES[idx] == "Truck":
			Truck=Truck +1;
			
		if CLASSES[idx] == "motorbike":
			motorbike=motorbike +1;
			
cv2.putText(image, "Car="+str(car), (10, 50),cv2.FONT_HERSHEY_SIMPLEX, 1, COLORS[idx], 2)
cv2.putText(image, "Person="+str(person), (10, 100),cv2.FONT_HERSHEY_SIMPLEX, 1, COLORS[idx], 2)
cv2.putText(image, "Bicycle="+str(bicycle), (10, 150),cv2.FONT_HERSHEY_SIMPLEX, 1, COLORS[idx], 2)
cv2.putText(image, "Truck="+str(Truck), (10, 200),cv2.FONT_HERSHEY_SIMPLEX, 1, COLORS[idx], 2)
cv2.putText(image, "Motorbike="+str(motorbike), (10, 250),cv2.FONT_HERSHEY_SIMPLEX, 1, COLORS[idx], 2)		
# show the output image
#cv2.imshow("image", image)

# Filename
filename = 'snap.png'
  
# Using cv2.imwrite() method
# Saving the image
cv2.imwrite(filename, image)
	# update the FPS counter
#fps.update()
# stop the timer and display FPS information
#ps.stop()
# do a bit
message = EmailMessage()
sender = "projectotpdetail@gmail.com"
recipient = "projectotpdetail@gmail.com"
message['From'] = sender
message['To'] = recipient
message['Subject'] = 'Vehicle Car count'
body = """Hello User, Pls find attached Image for vehicle Count."""
message.set_content(body)
mime_type, _ = mimetypes.guess_type('snap.png')
mime_type, mime_subtype = mime_type.split('/')
with open('snap.png', 'rb') as file:
 message.add_attachment(file.read(),
 maintype=mime_type,
 subtype=mime_subtype,
 filename='snap.png')
print(message)
mail_server = smtplib.SMTP_SSL('smtp.gmail.com')
mail_server.set_debuglevel(1)
mail_server.login(sender, 'isxynjzzywpbscyd')
mail_server.send_message(message)
mail_server.quit()