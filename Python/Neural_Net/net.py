import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.utils import np_utils
from keras.optimizers import SGD
from keras import backend
from keras.preprocessing.image import ImageDataGenerator

#backend.set_image_dim_ordering('th')
height, width = 640, 480
epochs = 15
training_samples = 1200
validation_samples = 450

train_data_dir = 'Corpus/train'
validation_data_dir = 'Corpus/validation'

# Import Data
datagen = ImageDataGenerator(rescale=1. / 255)

train_generator = datagen.flow_from_directory(
    train_data_dir,
    target_size=(width, height),
    batch_size=16,
    class_mode='binary',
    color_mode='grayscale'
)

validation_generator = datagen.flow_from_directory(
    validation_data_dir,
    target_size=(width, height),
    batch_size=16,
    class_mode='binary',
    color_mode='grayscale'
)

model = Sequential()
model.add(Conv2D(32, (3, 3), input_shape=(width, height, 1)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(3, 3)))

model.add(Conv2D(64, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(3, 3)))

model.add(Conv2D(128, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(3, 3)))

model.add(Flatten())
model.add(Dense(128))
model.add(Activation('relu'))
model.add(Dropout(0.1))
model.add(Dense(1))
model.add(Activation('sigmoid'))

sgd = SGD(lr=0.003, decay=1e-6, momentum=0.9, nesterov=True)
model.compile(loss='binary_crossentropy', optimizer=sgd, metrics=['accuracy'])

model.fit_generator(train_generator, samples_per_epoch=training_samples, nb_epoch=epochs,
                    validation_data=validation_generator, nb_val_samples=validation_samples)

model.save('models/single_save_for_hololens.hdf5')