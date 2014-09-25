#
# HTML Photo Gallery Generator
# ---
# This program takes a set of images and generates an HTML image gallery.
#
# Usage:
# $ ruby gallery.rb image.jpg pic.png funny.gif
#

require_relative './lib/html_generator.rb'

class PhotoGallery
  include HTMLGenerator

  attr_reader :photos

  def initialize(photos)
    @photos = photos
  end

  def to_html
    # Generate an array of <img> tags
    images = photos.map { |photo| img_tag(photo) }

    # Return the full HTML template with the images in place
    html_template( images )
  end
end

# Only execute the following code if the program being run is this same file,
# i.e. this will only run if you enter the command
#
#   $ ruby gallery.rb some-photo.jpg
#
# in the command line.
#
# This way, if other programs want to use the utility functions declared
# in this file, they can `require` the file _without_ actually executing
# the code below, which expects an argument and writes to STDOUT.
if __FILE__ == $PROGRAM_NAME
  # Expect a list of photo files
  photo_files = ARGV

  # Create an array of absolute paths to each photo
  absolute_paths_to_photos = photo_files.map { |file| File.absolute_path(file) }

  # Build a new photo gallery
  gallery = PhotoGallery.new(absolute_paths_to_photos)

  # Write a full HTML page to STDOUT with the list of <img> tags provided as the
  # content of the page
  puts gallery.to_html
end

