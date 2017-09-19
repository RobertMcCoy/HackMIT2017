import cv2


def get_frames_entire_video(video_name):
    cap = cv2.VideoCapture(video_name)
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


def get_frames_of_all_letters(video_name, input_list):
    cap = cv2.VideoCapture(video_name)

    frame_count = 1
    list_count = 0
    current_letter = input_list[0][0]
    while cap.isOpened():
        ret, frame = cap.read()
        if input_list[list_count][1] <= frame_count <= input_list[list_count][2]:
            try:
                cv2.imwrite('test_frame%d_%s.jpg' % (frame_count, current_letter), frame)
                if frame_count == input_list[list_count][2]:
                    list_count += 1
                    current_letter = input_list[list_count][0]
            except IndexError:
                break
        frame_count += 1
        print(frame_count)
        if cv2.waitKey(1) & 0xFF == ord('q') or not ret:
            break
    cap.release()
    print('end of function')


# get_frames_of_all_letters('SampleVideo_1280x720_2mb.mp4', [('a', 10, 50)])
# Note: video must be in same directory as this script. Otherwise, full path is needed.
