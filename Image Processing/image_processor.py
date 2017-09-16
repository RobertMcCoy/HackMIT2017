from PIL import Image


class ImageProcessor:

    def __init__(self):
        self.IMAGE_HEIGHT = 500
        self.IMAGE_WIDTH = 500

    def save_image(self, img, filename):
        img.save(filename)

    def resize_image(self, img):
        im = Image.open(img)
        resized_image = im.resize((self.IMAGE_WIDTH, self.IMAGE_HEIGHT))
        return resized_image


# image_processor = ImageProcessor()
# y = image_processor.resize_image('test.png')
# image_processor.save_image(y, 'test_resized.png')

