import os
import os.path
from image_processor import ImageProcessor

for dirpath, dirnames, filenames in os.walk(r"C:/Users/Robert/Documents/GitHub/HackMIT2017/Python/Neural_Net/Corpus"):
    for filename in [f for f in filenames if f.endswith(".jpg")]:
        imageprocessor = ImageProcessor()
        imageprocessor.greyscale_image('' + dirpath + '/' + filename)