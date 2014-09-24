# Photo Gallery - Command Line Interface

We're going to write a program that takes a set of images and generates an HTML image gallery.

## Getting Started

### Code Reviews and Feedback

## Iterations

### [v0.1] Output the filename as an absolute path
```shell
$ ruby gallery.rb my-pic.jpg
```

will output

```
/path/to/my-pic.jpg
```

### [v0.2] Generate an image tag as a string
```shell
$ ruby gallery.rb my-pic.jpg
```

will output

```
<img src="/path/to/my-pic.jpg">
```

### [v0.3] Generate a full, valid HTML page
```shell
$ ruby gallery.rb my-pic.jpg
```

will output

```
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
</head>
<body>
  <h1>My Gallery</h1>
  <img src="/path/to/my-pic.jpg">
</body>
</html>
```

### [v0.4] Support multiple images
```shell
$ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
```

will output

```
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
</head>
<body>
  <h1>My Gallery</h1>
  <img src="/path/to/photos/bunny-1.jpg">
  <img src="/path/to/photos/bunny-2.jpg">
  <img src="/path/to/photos/bunny-3.jpg">
</body>
</html>
```

### [v0.5] Make it look nicer with CSS

### [v1.0] Generate a gallery directory
```shell
$ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
$ ruby gallery.rb photos/*.jpg
```
 #=> all the html

### [v1.1] File and directory options
```shell
$ ruby gallery.rb photos/*.jpg --file pics.html
```
Writes HTML to given file

```shell
$ ruby gallery.rb photos/*.jpg --directory my-photos
```
Writes file [w/ default name] to given directory

### [v1.2] Index and detail view [multi-page]
```shell
$ ruby gallery.rb photos/*.jpg --multi-page
```
Writes index page to index.html with detail pages in a subdirectory, defaults to `/pages`

### [v1.3] Use ERB templates


### [v2.0] unix utility
 $ ls photos/*.jpg | ./gallery.rb > index.html
 $ ls photos/*.jpg | ./gallery.rb | nc -l 7777

### [v3.0] gem
 $ gem install https://url.to.gallery.repo.git
 $ gallery photos/*.jpg

## Why Are We Doing This?

### Some Practical Scenarios
