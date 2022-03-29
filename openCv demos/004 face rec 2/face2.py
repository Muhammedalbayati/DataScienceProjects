# Import required libraries
import cv2
import numpy as np
import matplotlib.pyplot as plt

# Load image
img = cv2.imread('muhammed.jpg')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Load existing cascade classifier for face and eyes
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier('haarcascade_eye.xml')


# Detect faces
faces = face_cascade.detectMultiScale(gray, 1.8, 6)

# For each face detected draw a detection rectangle in blue (255,0,0)
for (x, y, w, h) in faces:
    cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
    roi_gray = gray[y:y+h, x:x+w]
    roi_color = img[y:y+h, x:x+w]

    # Detect eyes (within face)
    eyes = eye_cascade.detectMultiScale(roi_gray)

    # For each set of eyes detected draw a detection rectangle in green (0,255,0)
    for (ex, ey, ew, eh) in eyes:
        cv2.rectangle(roi_color, (ex, ey), (ex+ew, ey+eh), (0, 255, 0), 2)


# Show image with detection rectangles drawn
cv2.imshow('img', img)
cv2.waitKey(0)
cv2.destroyAllWindows()
