# Makefile to resize images

# Find all png images in portraits_large
SRC_IMAGES := $(wildcard portraits_large/*.png)

# Create a list of target images in the current directory
TARGET_IMAGES := $(notdir $(SRC_IMAGES))

# Default target: resize all images
all: $(TARGET_IMAGES)

# Rule to resize an image
# $< is the source file (e.g., portraits_large/drunkard.png)
# $@ is the target file (e.g., drunkard.png)
%.png: portraits_large/%.png
	convert $< -resize 256x256 $@

# Clean up resized images
clean:
	rm -f $(TARGET_IMAGES)

.PHONY: all clean
