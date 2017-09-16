import cv2

cap = cv2.VideoCapture('ENTER VIDEO NAME HERE')
count = 0
while cap.isOpened():
    ret, frame = cap.read()
    cv2.imshow('window-name', frame)
    cv2.imwrite("VIDEO_NAME/frame%d.jpg" % count, frame)
    count = count + 1
    if cv2.waitKey(10) & 0xFF == ord('q'):
        break

cap.release()
cap.destroyAllWindows()
