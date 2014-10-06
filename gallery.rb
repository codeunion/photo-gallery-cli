def html_template(content)
  # Use the heredoc syntax to create a multi-line string for defining the
  # template of the html page to be generated.
  layout = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
</head>
<body>
  <h1>My Gallery</h1>
  #{content}
</body>
</html>
HTML

  layout
end

def img_tag(source_file)
  # Write an HTML <img> tag with the photo file provided
  # as the value for the src attribute.
  "<img src=\"#{source_file}\">"
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
  # We're only concerned with the first argument for now
  photo_file = ARGV[0]

  # Use the absolute path of the photo file
  absolute_path_to_photo = File.absolute_path(photo_file)

  # Write a full HTML page to STDOUT with the <img> tag provided as the
  # content of the page
  puts html_template(img_tag(absolute_path_to_photo))
end
