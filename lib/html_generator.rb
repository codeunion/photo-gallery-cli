module HTMLGenerator
  def html_template(*content)
    # Use the heredoc syntax to create a multi-line string for defining the
    # template of the html page to be generated
    layout = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
  <style type="text/css" media="screen">
    #{ _style }
  </style>
</head>
<body>
  <div class="container">
    <h1>My Gallery</h1>
    #{ content.join("\n    ") }
  </div>
</body>
</html>
    HTML

    layout
  end

  def img_tag(source_file)
    # Write an HTML <img> tag with the photo file provided
    # as the value for the src attribute
    "<img src=\"#{source_file}\">"
  end

  def _style
    <<-CSS
* {
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
    CSS
  end
end
