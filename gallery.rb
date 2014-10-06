#
# HTML Photo Gallery Generator
# ---
# This program takes a set of images and generates an HTML image gallery.
#
# Usage:
# $ ruby gallery.rb image.jpg pic.png funny.gif
#

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

def absolute_path_list(paths)
  absolute_paths = []

  paths.each do |path|
    absolute_paths.push(File.absolute_path(path))
  end

  absolute_paths
end

if __FILE__ == $PROGRAM_NAME
  # Expect a list of photo files as command line arguments.
  # Remember: ARGV will be an Array of Strings - one per argument.
  photo_paths = ARGV

  # Create an Array of absolute paths to each photo
  absolute_paths_to_photos = absolute_path_list(photo_paths)

  # Create an Array of <img> tag Strings
  image_tags = img_tag_list(absolute_paths_to_photos)

  # Join the Array of <img> tags into a single String.
  # See: http://www.ruby-doc.org/core-2.1.3/Array.html#method-i-join
  content = image_tags.join("\n")

  # Write a full HTML page to STDOUT with the list of <img> tags provided as the
  # content of the page
  puts html_template(content)
end
