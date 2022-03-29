import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

# img = cv.imread('IMG_4.jpg')
# cv.imshow('My image',img)

capture = cv.VideoCapture(0)
while True:  # to read video frame by frame
    isTrue, frame = capture.read()
    cv.imshow('my video', frame)

# cv.waitKey(0) #infinit wait time to press key
    if cv.waitKey(20) == ord('q'):  # press q to quit
        break

capture.release()
cv.destroyAllWindows()
