from PIL import Image
import glob
import os

frontPicPaths = glob.glob(os.getcwd() + '/**/front.png', recursive=True)
backPicPaths = glob.glob(os.getcwd() + '/**/back.png', recursive=True)

files = frontPicPaths + backPicPaths

print(files)

for f in files:
    try:
        im = Image.open(f)
# rearrage the palette
        paletteArray = im.getpalette()

        color1R = paletteArray[3]
        color1G = paletteArray[4]
        color1B = paletteArray[5]

        paletteArray[3] = paletteArray[6]
        paletteArray[4] = paletteArray[7]
        paletteArray[5] = paletteArray[8]

        paletteArray[6] = color1R
        paletteArray[7] = color1G
        paletteArray[8] = color1B

        im.putpalette(paletteArray)

#change image data to reflect the new palette

        pixels = im.load() # create the pixel map

        for i in range(im.size[0]): # for every pixel:
            for j in range(im.size[1]):
                if pixels[i,j] == 1:
                    pixels[i,j] = 2
                elif pixels[i,j] == 2:
                    pixels[i,j] = 1	

        im.save(f)
    except:
	    print("Unable to process " + f)
