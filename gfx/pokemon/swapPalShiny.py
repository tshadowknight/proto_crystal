from PIL import Image
import glob
import os

files = glob.glob(os.getcwd() + '/**/shiny.pal', recursive=True)

print(files)

for f in files:
    try:
        fh = open(f, "r")
        lines = fh.readlines()
        fh.close()
        lines = lines[::-1]
        fh = open(f, "w")
        fh.write("".join(lines))
        fh.close()
    except Exception as e:
	    print("Unable to process " + f + " " + str(e))
