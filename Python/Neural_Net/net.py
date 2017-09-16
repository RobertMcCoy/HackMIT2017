import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation, Flatten
from keras.layers import Convolution2D, MaxPooling2D
from keras.utils import np_utils
from keras.preprocessing.image import ImageDataGenerator

class model:

    height, width = 100, 100
    epochs = 1
    training_samples = 2048
    validation_samples = 1024

    train_data_dir = 'Corpus/train'
    validation_data_dir = 'Corpus/validation'

    np.random.seed(8952798)


    # Import Data
    datagen = ImageDataGenerator(rescale=1./255)
    train_generator = load_train_data()
    validation_generator = load_validation_data()

    model = Sequential()
    model.add(Convolution2D(32, 4, 4, input_shape = (3, width, height)))
    model.add(Activation('relu'))
    model.add(MaxPooling2D(pool_size=(3, 3)))

    model.add(Convolution2D(64, 3, 3))
    model.add(Activation('relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))

    model.add(Flatten())
    model.add(Dense(64))
    model.add(Activation('relu'))
    model.add(Dropout(0.5))
    model.add(Dense(1))
    model.add(Activation('sigmoid'))
    model.compile(loss='categorical_crossentropy', optimizer='rmsprop', metrics=['accuracy'])

    model.fit_generator(train_generator, samples_per_epoch = train_samples, nb_epoch = epochs, validatation_data = validation_generator, nb_val_samples = validation_samples)

    model.save_weights('models/initial-samples-1-epoch.h5')


    def load_train_data():
        train_generator = datagen.flow_from_directory(
            train_data_dir,
            target_size = (width, height),
            batch_size = 32,
            class_mode = 'categorical'
        )

    def load_validation_data():
        validation_generator = datagen.flow_from_directory(
            validation_data_dir,
            target_size = (width, height),
            batch_size = 32,
            class_mode = 'categorical'
        )