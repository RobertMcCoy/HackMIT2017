from PIL import Image


class ImageProcessor:

    def __init__(self):
        self.IMAGE_HEIGHT = 128
        self.IMAGE_WIDTH = 128

    def resize_image(self, filename):
        img = Image.open(filename)
        resized_image = img.resize((self.IMAGE_WIDTH, self.IMAGE_HEIGHT))
        return resized_image

    def greyscale_image(self, filename):
        filename = filename.replace('\\','/')
        img = Image.open(filename).convert('L') # make image greyscale
        img.save(filename);
        return img

# image_processor = ImageProcessor()
# y = image_processor.resize_image('test.png')
# image_processor.save_image(y, 'test_resized.png')
# image_processor.greyscale_image('test.png', 'grey_test.png')
