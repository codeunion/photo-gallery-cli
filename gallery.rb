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

  GALLERY_CSS = <<-CSS
    img {
      width: 200px;
      height: 200px;
      padding: 0px;
      margin-right: 24px;
      border: 3px solid #ccc;
      border-radius: 2px;
      box-shadow: 3px 3px 5px #ccc;
    }
  CSS

  attr_reader :photos

  def initialize(photos)
    @photos = photos
  end

  def export(export_directory = default_directory_path)
    self.export_directory = export_directory

    # Write to the default HTML file
    File.write(export_filepath, self.to_html)
  end

  def to_html
    # Generate an array of <img> tags
    images = photos.map { |photo| img_tag(photo) }

    # Return the full HTML template with the images in place
    html_template( title: "My Gallery",
                   custom_css: GALLERY_CSS,
                   content: images )
  end

private

  def export_filepath
    # The file where the generated HTML will be saved
    File.join(export_directory, 'gallery.html')
  end

  attr_reader :export_directory

  def export_directory=(directory)
    # If the directory where the gallery will be exported to does not already
    # exist, we need to create it.
    Dir.mkdir(directory) unless Dir.exists?(directory)

    @export_directory = directory
  end

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

