module HTMLGenerator
  DEFAULT_CSS = <<-CSS
    * {
      font-family: "Helvetica", sans-serif;
    }

    .container {
      margin: 0 auto;
      width: 720px;
    }
  CSS

  def html_template(options)
    title      = options.fetch(:title)      { 'Page Title' }
    custom_css = options.fetch(:custom_css) { '// no custom styles' }
    content    = options.fetch(:content)    { ['Page Content'] }

    # Use the heredoc syntax to create a multi-line string for defining the
    # template of the html page to be generated
    layout = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title>#{ title }</title>
  <style type="text/css" media="screen">
    /* Default styles from HTMLGenerator */
    #{ DEFAULT_CSS }

    /* Custom styles */
    #{ custom_css }
  </style>
</head>
<body>
  <div class="container">
    <h1>#{ title }</h1>
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
end
