require 'fileutils'

module GalleryExporter
  IMG_DIRNAME = 'imgs'

  def build_directory_struture(target_directory)
    self.export_directory = target_directory
    self.img_directory = File.join(export_directory, IMG_DIRNAME)
  end

  def copy_photos
    original_photo_files.each do |photo_file|
      # Copy each original photo file into the new image directory
      FileUtils.cp(photo_file, img_directory)
    end
  end

  def copied_photo_paths(opts = {})
    relative_path = opts.fetch(:relative_path) { true }

    # The copied photo files will live in their own image directory
    photos = img_directory && Dir[ File.join(img_directory, '*') ]

    if relative_path
      # Return the relative path to the photos
      photos.map { |abs_path| abs_path.sub(export_directory, '.') }
    else
      # Otherwise return the absolute paths
      photos
    end
  end

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

  attr_reader :img_directory

  def img_directory=(directory)
    # If the directory where the images will be stored to does not already
    # exist, we need to create it.
    Dir.mkdir(directory) unless Dir.exists?(directory)

    @img_directory = directory
  end
end
