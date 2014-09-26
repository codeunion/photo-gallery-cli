# Photo Gallery - Command Line Interface

We're going to write a program that takes a set of images and generates an HTML image gallery.

## Getting Started

To get started, you'll need to

1. Fork this repository to your own GitHub account
- Open a Terminal and clone this repository to your local computer
- Navigate to the repository on your local computer
- Open the repository in Sublime Text

### Files In This Repository

- `gallery.rb` is the source code for this project
- `photos` is a directory containing sample photos

Example solutions can be found in the `solution` branch [TODO: add link to branch]. There are solutions for all iterations up to and including v1.0 [TODO: add link to tag].

### Code Reviews and Feedback

Remember, the absolute, tip-top, #1 priority is asking for and receiving feedback on your code. It's better to "fall short" of an iteration and ask for feedback on an incomplete version than it is to get stuck. It's better to ask for feedback on a hacked-together-but-working version than worry about whether it's "polished enough."

Indeed, even if you know your code is unpolished or incomplete, you may as well ask for feedback so that we can be working on that feedback in parallel while you're polishing or completing your code. The worst that could possibly happen is that we give you feedback you are already aware of.

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
