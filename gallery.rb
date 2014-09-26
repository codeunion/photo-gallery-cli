#
# HTML Photo Gallery Generator
# ---
# This program takes a set of images and generates an HTML image gallery.
#
# Usage:
# $ ruby gallery.rb image.jpg pic.png funny.gif
#

require_relative './lib/html_generator.rb'
require_relative './lib/gallery_exporter.rb'

class PhotoGallery
  include HTMLGenerator
  include GalleryExporter

  # We don't want these utility methods to be part of the public interface
  private *HTMLGenerator.instance_methods
  private *GalleryExporter.instance_methods

  GALLERY_CSS = <<-CSS
    img {
      width: 200px;
      height: 200px;
      padding: 0px;
      margin: 0px 24px 24px 0px;
      border: 3px solid #ccc;
      border-radius: 2px;
      box-shadow: 3px 3px 5px #ccc;
    }
  CSS

  def initialize(photos)
    @original_photo_files = photos
  end

  def export(export_directory = default_directory_path)
    # Build directory structure to export into
    build_directory_struture(export_directory)

    # Copy the photo files into the new directory
    copy_photos

    # Get the relative paths for all photos
    photo_paths = copied_photo_paths(relative_path: true)

    # Write to the default HTML file
    File.write( export_filepath, self.to_html(photo_paths) )
  end

  def photos
    # If there are any copied photos, return them.
    # Otherwise, just use the originals.
    # Will always return _absolute paths_ of the photos
    copied_photo_paths(relative_path: false) || original_photo_files
  end

  def to_html(photo_paths = photos)
    # Generate an array of <img> tags
    images = photo_paths.map { |photo| img_tag( photo ) }

    # Return the full HTML template with the images in place
    html_template( title: "My Gallery",
                   custom_css: GALLERY_CSS,
                   content: images )
  end

private

  attr_reader :original_photo_files

  def default_directory_path
    # The default save directory is called `public/` and lives in the root path
    # of the application
    File.expand_path('../public', __FILE__)
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

  # Export a full HTML page to the default directory with the list of <img> tags
  # provided as the content of the page
  gallery.export

  # Exit process with a success message
  exit 0
end
