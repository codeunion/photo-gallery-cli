# We're only concerned with the first argument for now
photo_file = ARGV[0]

# Write the absolute path to the file to STDOUT
puts File.absolute_path(photo_file)
