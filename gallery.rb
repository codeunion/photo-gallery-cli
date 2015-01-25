#Photo Gallery - Command Line Interface
#
#This program takes a set of images and generates an HTML image gallery
#
#Usage:
# $ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
#

def html_template(image_tag)
  #Heredoc for multi-line string
  template = <<-HTML
  <!DOCTYPE html>
  <html>
  <head>
    <title>My Gallery</title>
  </head>
  <body>
    <h1>My Gallery</h1>
    #{image_tag}
  </body>
  </html>
  HTML
  return template
end

def img_tag(file_path)
  #img tag syntax
  "<img src=\"#{file_path}\">"
end

def img_tags_list(file_paths_array)
  img_tags = []

  file_paths_array.each do |photo_file_path|
    img_tags.push(img_tag(photo_file_path))
  end
  return img_tags
end

def full_path_array(photo_files_array)
  #gets the absolute paths of the photo files
  full_file_paths = []
  photo_files_array.each do |photo_file|
    full_file_paths.push(File.absolute_path(photo_file))
  end
  return full_file_paths
end

def tests
  #Need to write more test
  #full file path test
  img_tag("/Users/qavila/projects/codeunion/photo-gallery-cli/photos/bunny-1.jpg") == "<img src=\"/Users/qavila/projects/codeunion/photo-gallery-cli/photos/bunny-1.jpg\">"

end


if __FILE__ == $PROGRAM_NAME
  #Creates the array of cli arguments specifying the photo files
  photo_files = ARGV
  #Sends the ARGV array to method thats gets full path
  list_file_paths = full_path_array(photo_files)
  #Builds the image tags from the array of full file photo paths
  image_tags = img_tags_list(list_file_paths)
  #joins the array of img tags for normalization into the html template
  html_img_tags = image_tags.join("\n")
  #Puts the img tags in the html heredoc template
  puts html_template(html_img_tags)
  #p tests
end
