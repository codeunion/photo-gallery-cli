def img_tag(source_file)
  # Write an HTML <img> tag with the photo file provided
  # as the value for the src attribute
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

  puts img_tag(absolute_path_to_photo)
end

