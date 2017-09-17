import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.utils import np_utils
from keras import backend
from keras.preprocessing.image import ImageDataGenerator

#backend.set_image_dim_ordering('th')
height, width = 100, 100
epochs = 5
training_samples = 2048
validation_samples = 1024

train_data_dir = 'Corpus/train'
validation_data_dir = 'Corpus/validation'

np.random.seed(8952798)

# Import Data
datagen = ImageDataGenerator(rescale=1. / 255)

train_generator = datagen.flow_from_directory(
    train_data_dir,
    target_size=(width, height),
    batch_size=32,
    class_mode='binary'
)

validation_generator = datagen.flow_from_directory(
    validation_data_dir,
    target_size=(width, height),
    batch_size=32,
    class_mode='binary'
)

model = Sequential()
model.add(Conv2D(32, (3, 3), input_shape=(width, height, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(64, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Flatten())
model.add(Dense(64))
model.add(Activation('relu'))
model.add(Dropout(0.5))
model.add(Dense(1))
model.add(Activation('sigmoid'))
model.compile(loss='binary_crossentropy', optimizer='rmsprop', metrics=['accuracy'])

model.fit_generator(train_generator, samples_per_epoch=training_samples, nb_epoch=epochs,
                    validation_data=validation_generator, nb_val_samples=validation_samples)

model.save_weights('models/initial-samples-1-epoch.h5')

print("done")
