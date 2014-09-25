# We're only concerned with the first argument for now
photo_file = ARGV[0]

# Use the absolute path of the photo file
absolute_path_to_photo = File.absolute_path(photo_file)

# Write an HTML <img> tag with the photo file provided
# as the value for the src attribute
puts "<img src=\"#{absolute_path_to_photo}\">"
