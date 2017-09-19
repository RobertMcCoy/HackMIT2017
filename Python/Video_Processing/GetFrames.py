import cv2
import logging
import os


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
    video_string_split = video_name.split('-')
    translator_id = video_string_split[0]
    cd = video_string_split[2]
    cd_trimmed = cd[:-4]
    cap = cv2.VideoCapture(video_name)
    photo_count = 1
    frame_count = 1
    list_count = 0
    current_letter = input_list[0][0]
    while cap.isOpened():
        if os.path.isdir('%s' % current_letter) is False:
            os.mkdir('%s' % current_letter)

        ret, frame = cap.read()
        print(frame_count)
        if cv2.waitKey(1) & 0xFF == ord('q') or not ret:
            break

        if input_list[list_count][1] <= frame_count <= input_list[list_count][2]:
            try:
                cv2.imwrite('%s/%s_%s_%d.jpg' % (current_letter, str(translator_id), str(cd_trimmed), photo_count),
                            frame)
                photo_count += 1
                if frame_count == input_list[list_count][2]:
                    list_count += 1
                    photo_count = 1
                    current_letter = input_list[list_count][0]
            except IndexError:
                logging.warning('IndexError caught, index out of bounds in get_frames_of_all_letters.')
                break
        frame_count += 1

    cap.release()
    print('end of function')


get_frames_of_all_letters('07-A-C.mp4', [('a', 10, 50)])
# 07-A-C.avi
# Note: video must be in same directory as this script. Otherwise, full path is needed.
