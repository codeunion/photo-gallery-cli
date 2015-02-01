#Photo Gallery - Command Line Interface
#
#This program takes a set of images and generates an HTML image gallery
#
#Usage:
# $ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
#
require "fileutils"

def html_template(image_tag)
  #Heredoc for multi-line string
  template = <<-HTML
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

def img_tags_list
  img_tags = []
  files = Dir["public/imgs/*"]
  files.each do |file|
    img_tags.push(img_tag(file.match(/imgs\/.*/)))
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

def directory_structure()
  #Making the directory structure - File public/gallery.html image directory public/imgs/
  #photo_gallery/public/
  directory = "public/imgs"
  #Creates directory or if the directory exists nothing is done
  unless Dir.exist?(directory)
    FileUtils.mkdir_p(directory)
  end
end

def create_html_file(html_template)
  File.write("public/index.html", html_template)
end

def copy_files(file_paths)
  file_paths.each do |path|
    FileUtils.cp(path, "public/imgs")
  end
end

def tests
  #Need to write more tests
  #full file path test
  img_tag("/Users/qavila/projects/codeunion/photo-gallery-cli/photos/bunny-1.jpg") == "<img src=\"/Users/qavila/projects/codeunion/photo-gallery-cli/photos/bunny-1.jpg\">"

end


if __FILE__ == $PROGRAM_NAME
  #Creates the array of cli arguments specifying the photo files
  photo_files = ARGV
  #Sends the ARGV array to method thats gets full path
  list_file_paths = full_path_array(photo_files)
  copy_files(list_file_paths)
  #Builds the image tags from the array of full file photo paths
  image_tags = img_tags_list
  #joins the array of img tags for normalization into the html template
  html_img_tags = image_tags.join("\n")
  #creating directory
  directory_structure
  #Puts the img tags in the html heredoc template
  create_html_file(html_template(html_img_tags))
  #p tests
end
