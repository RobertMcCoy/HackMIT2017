"""This Module is for changing random pixels, and keeping changes if better auto prediction"""
import random
from PIL import Image
from keras.models import Sequential
from keras.models import model_from_json
from keras.applications.vgg16 import VGG16
from keras.preprocessing import image
from keras.utils import plot_model
from keras.applications.vgg16 import preprocess_input
import numpy as np

model = model_from_json(open('models/model.json').read())
model.load_weights('models/initial-samples-3-epoch.h5')

im = Image.open('test_for_model_importer.jpg')

img = im.resize((100, 100), Image.ANTIALIAS)

x = image.img_to_array(img)
x = np.expand_dims(x, axis=0)
output = model.predict(x)

#Make the output binary
for i in range(0, output[:,0].size):
    for j in range(0, output[0].size):
        if output[i][j] > 0.5 or output[i][j] == 0.5:
            output[i][j] = 1
        else:
            output[i][j] = 0
print(output)