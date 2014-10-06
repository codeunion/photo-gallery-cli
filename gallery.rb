
#
# HTML Photo Gallery Generator
# ---
# This program takes a set of images and generates an HTML image gallery.
#
# Usage:
# $ ruby gallery.rb image.jpg pic.png funny.gif
#

require "fileutils"

def html_template(content)
  layout = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
  <style type="text/css" media="screen">
    body {
      font-family: "Helvetica", sans-serif;
    }

    .container {
      margin: 0 auto;
      width: 720px;
    }

    img {
      width: 200px;
      height: 200px;
      padding: 0px;
      margin-right: 24px;
      border: 3px solid #ccc;
      border-radius: 2px;
      box-shadow: 3px 3px 5px #ccc;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>My Gallery</h1>
    #{content}
  </div>
</body>
</html>
HTML

  layout
end

def img_tag(source_file)
  "<img src=\"#{source_file}\">"
end

def img_tag_list(source_files)
  img_tags = []

  source_files.each do |source_file|
    img_tags.push(img_tag(source_file))
  end

  img_tags
end

# For a photo in "/path/to/photo.jpg" we need the HTML to contain
# <img src="images/photo.jpg"> since we'll be moving photo.jpg to that
# directory.
def html_file_paths(dirname, file_paths)
  html_paths = []

  file_paths.each do |path|
    html_paths.push(File.join(dirname, File.basename(path)))
  end

  html_paths
end

# Did you know we can put '!' at the end of a method name?
# Seems weird, but Ruby treats it like any other character. It often signals
# that a method does something irreversable or destructive.
def create_dir_if_needed!(dirname)
  unless Dir.exist?(dirname)
    Dir.mkdir(dirname)
  end
end

def build_gallery(gallery_dir, file_paths)
  images_dir = File.join(gallery_dir, "images")
  index_file = File.join(gallery_dir, "index.html")

  create_dir_if_needed!(gallery_dir)
  create_dir_if_needed!(images_dir)

  file_paths.each do |file_path|
    FileUtils.cp(file_path, images_dir)
  end

  html_paths = html_file_paths("images", file_paths)

  content = img_tag_list(html_paths).join("\n")

  File.write(index_file, html_template(content))
end

if __FILE__ == $PROGRAM_NAME
  # Expect a list of photo files as command line arguments.
  # Remember: ARGV will be an Array of Strings - one per argument.
  file_paths = ARGV

  build_gallery("gallery", file_paths)
end
