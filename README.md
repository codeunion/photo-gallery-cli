# Photo Gallery - Command Line Interface

We're going to write a program that takes a set of images and generates an HTML image gallery.

Here is a (fake) story to give context to the kind of problem we are going to solve:

> I'm a professional photographer and have my own personal website.  Whenever I take a new batch of photos, I like to select the best examples, use Dreamweaver create a new "gallery" page on my website, and upload the updated version of my website to my website host.
>
> Each gallery page is mostly the same, but it takes me 15-45 minutes after each shoot to select the photos, create the page, make whatever small edits I might want to make, and upload it.  The process is tedious, very manual, and error-prone.

Can you identify this hypothetical photographer's core problem? _As a developer_, your job is to take stories such as this one, identify the ways in which software could help, and then build that software.

Take a moment to think about how you might tackle the problem above given what you know now. If you feel like it, you can sketch your ideas down.

In the case of this project, we're going to start by boiling down the story with two simple questions:

- What is the raw material going in (the **input**)?
- What is the desired result (the **output**)?

Answer the questions for yourself before continuing.

The answers to these question will help us identify the key components of what is needed. Reducing large, complex stories into smaller and simpler component parts is what programming is all about.

Luckily for us, this story isn't _too_ complex. The answers to the above questions are straight-forward:

- The **input** is a set of _photograph files_.
- The **output** is a photo gallery rendered on an _HTML page_.  Here's [a screenshot of an example photo gallery page](https://raw.githubusercontent.com/codeunion/assets/master/images/photo-gallery-cli-page-view.png).

Now we have to figure out how what goes in the middle! Let's get started.

## Getting Started

To get started, you'll need to

- Fork this repository to your own GitHub account
- Open a Terminal and clone this repository to your local computer
- Navigate to the repository directory on your local computer
- Open the repository directory with [Sublime Text 3](http://www.sublimetext.com/3), [Atom](https://atom.io/), or your editor of choice.

### Files In This Repository

- `gallery.rb` is the source code for this project
- `photos` is a directory containing sample photos

There is example code for all iterations up to and including [v1.0](../../tree/iterations/v1.0).

### Code Reviews and Feedback

Remember, the absolute, tip-top, #1 priority is asking for and receiving feedback on your code. It's better to "fall short" of an iteration and ask for feedback on an incomplete version than it is to get stuck. It's better to ask for feedback on a hacked-together-but-working version than worry about whether it's "polished enough."

Indeed, even if you know your code is unpolished or incomplete, you may as well ask for feedback so that we can be working on that feedback in parallel while you're polishing or completing your code. The worst that could possibly happen is that we give you feedback you are already aware of.

## Iterations

It is time to start working. Before you read any further or jump into writing code, take a minute (or five) to sketch out a rough plan for how you would solve this problem. Ask yourself questions like:

- How will this program be used?
- What are the smaller steps in between the input and output?
- Which tools (e.g. Ruby methods, UNIX utilities) might be needed?

You may not have clear answers. That is OK. Over time, you will build habits that help lead you to better answers more quickly. The first step is building a habit of asking the right questions.

In the iterations to follow, we will build up to a [functionally correct](http://en.wikipedia.org/wiki/Correctness_(computer_science)) answer by starting small and taking incremental steps. By the end of version 0.4, we will have written a program that can be executed from the command line like this

```console
$ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
```

...and will output HTML looking something like this

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
</head>
<body>
  <h1>My Gallery</h1>
  <img src="/absolute/path/to/photos/bunny-1.jpg">
  <img src="/absolute/path/to/photos/bunny-2.jpg">
  <img src="/absolute/path/to/photos/bunny-3.jpg">
</body>
</html>
```

So, where do we start?

### [v0.1] Output the filename as an absolute path

Take a look at the HTML above. The key element on this document is the `<img>` tag. The `<img>` tag is how a browser knows to display an image (like your photosgraphs) when it loads a webpage.  It's worth reading the [MDN page for the <img> tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img).

In order to do that, the browser needs to know _where_ to find the image file. The data for the image file does not live directly in the HTML document. Instead, it is a separate file that the browser needs to download.

Since these image files reside on your local computer, the browser needs to know their [absolute path](https://github.com/codeunion/fundamentals-of-web-development/wiki/Glossary#absolute-path).

So, how do we find out the absolute path? That, it turns out, is our first task: write a Ruby program that takes the name of a file as input and outputs the absolute path to that file.

For example, if we run this inside the `/Users/tanner/photo-gallery` directory

```console
$ ruby gallery.rb my-pic.jpg
```

it should output

```text
/Users/tanner/photo-gallery/my-pic.jpg
```

If you don't already know how to do this, that is fine. But you will need to do the research on your own to figure it out. Since we are getting started, and you may still be learning how to research effectively, here are some search queries you might want to try:

- What is an absolute path?
- How to access command-line arguments in Ruby?
- How to find the absolute path of a file in Ruby?

Those should kick-start some good information gathering. And you might learn some extra stuff along the way.

When you have finished your own answer, you can view example code by checking out [iteration v0.1](../../tree/iterations/v0.1). Of course, you can also use this example as inspiration if you are feeling super-duper stuck. But it's usually best to wrestle with the problem for a bit first.

### [v0.2] Output a full image tag (`<img>`)

The next step is to create the smallest possible bit of HTML that we can.  We will extend our existing program so that so that it will print out an `<img>` tag with the absolute path to the file set as the `src` attribute.  That means if you run this command


```console
$ ruby gallery.rb my-pic.jpg
```

it will output

```html
<img src="/absolute/path/to/my-pic.jpg">
```

This is just a stepping stone on the way to printing out multiple such `<img>` tags.

If you want, you can copy and paste the output into a file, give the file a name like `my-pic.html`, and open it in your browser of choice. Does it work? If not, you might want to investigate the `<img>` tag further.

**Hint**

When searching for information about HTML (or the DOM, or JavaScript), prefix your queries with `mdn` (for "Mozilla Developer Network"). They're the best in the business.

[Example code for v0.2](../../tree/iterations/v0.2).

### [v0.3] Generate a full, valid HTML page

Now that we can create an image tag successfully, it should not be too difficult to add some more HTML to the mix, making it a valid HTML page with tags like `<title>` and `<body>`. Let's extend the program so that it will print a full HTML page with the image nested inside of the `<body>` tag.

When we are finished, running this command

```console
$ ruby gallery.rb my-pic.jpg
```

will output

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
</head>
<body>
  <h1>My Gallery</h1>
  <img src="/absolute/path/to/my-pic.jpg">
</body>
</html>
```

**Hint**

Even though we are now printing out many tags on many lines, in Ruby we can still treat the HTML as one long string. Ruby offers many ways to represent strings: you may want to check out Ruby's [here document](http://en.wikibooks.org/wiki/Ruby_Programming/Here_documents) and the [%Q{}](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals#The_.25_Notation) syntax for strings.

### [v0.4] Support multiple images

Up until this point, our program has only been working with a single image file. But of course, a photo gallery that can only display a single photograph is not very useful.

Let's remedy that by extending out program so that it accepts many image file names as arguments and prints out an HTML document with one `<img>` tag for every argument.

When we're finished, we will be able to run this command

```console
$ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
```

and it will output

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
</head>
<body>
  <h1>My Gallery</h1>
  <img src="/absolute/path/to/photos/bunny-1.jpg">
  <img src="/absolute/path/to/photos/bunny-2.jpg">
  <img src="/absolute/path/to/photos/bunny-3.jpg">
</body>
</html>
```

In other, more technical words, the program should accept a _variable number of arguments_ (as opposed to before, when it had a _fixed argument length_).

This means we can pass the program _any_ number of image files. If we wanted to add all the files in the `photos` directory that end in `.jpg`, we could run this command

```console
$ ruby gallery.rb photos/*.jpg
```

Nifty, huh? To see what that `*` is doing, try running `echo photos/*.jpg` on your command line.

### [v0.5] Make it look nicer with CSS

Congratulations. You've built a program that is a genuinely useful tool for building a photo gallery web page.  We're well on our way, but it would be nice to make it look more like a photo gallery!

The overall look of a page is called _styling_ and we can change a page's styling by using _Cascading Style Sheets_ or CSS. Let's add some CSS to improve the styles on the generated gallery page.

Here is an example of how a slightly improved page might look:

![img](https://raw.githubusercontent.com/codeunion/assets/master/images/photo-gallery-cli-page-view.png)

At the very least, we should style our [<img> tags](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) so that they have a better layout. We could also include a [border](https://developer.mozilla.org/en-US/docs/Web/CSS/border). Maybe even a [box-shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow)?

### [v1.0] Generate a gallery directory

We're almost there. To get to v1.0 (a feature-complete implementation of our program), there is one final step.  Instead of printing out HTML, let's modify the program so that it creates a self-contained directory containing all the HTML documents and images we need to display the gallery.  This will make it possible to upload or share.

Up until this point, the generated HTML references the _original image files_ in their _original location_ on your computer. This is not a problem if the HTML will only ever be viewed on your computer, but what happens if you wanted to share that HTML by publishing it on the world wide web? If you push your page up to a website, say `http://www.my-website.com/gallery.html`, and someone visits that site, their browser will download the HTML and attempt to load the image files using their `src` attribute. There is one problem: the _file paths are for images stored on your computer_, and those photos obviously won't exist on the computers of whoever visits your website.

So, how do we resolve this issue? Think back to what a good MVP (Minimum Viable Product) looks like. We need to deliver a photo gallery that can be easily uploaded to a website. It makes sense that a deliverable package would include both the HTML _and_ the photo files themselves (or, better yet, a copy of them). That way, the HTML can include `<img>` tags that reference the photo files with a [relative path](https://github.com/codeunion/fundamentals-of-web-development/wiki/Glossary#relative-path) instead of an absolute path. Then, so long as the path from the HTML files to the photo files is maintained wherever the gallery is moved, the photos will load on the page.


Once we have finished this iteration, running this command

```console
$ ruby gallery.rb photos/bunny*.jpg
```

will create a new directory called with an HTML file inside of it and a subdirectory with copies of each of the photo files. In the example below, running the command will create a directory called `public`:

```console
$ ruby gallery.rb photos/bunny*.jpg
$ ls public/**
public/gallery.html

public/imgs:
bunny-1.jpg bunny-2.jpg bunny-3.jpg bunny-4.jpg
$
```

You will need to learn some new tools to make this work. Use your research skills to learn how to do the following in your version of Ruby:

- Create a new directory
- Create and write to a file
- Copy files from one directory to another

- - -

**Note**: the remaining iterations do not have any example code. We will still have fun and learn a lot by completing them.

### [v1.1] Use ERB templates instead of strings

Now that we have a solid MVP, let's [refactor](http://refactoring.com/) our code to use some more appropriate and flexible features of Ruby.

In previous iterations, we built HTML by using Ruby's string interpolation (and/or concatenation) tools. This can get clunky and difficult when working with very long strings like full HTML pages.

Luckily for us, the Ruby standard library has a class called [ERB](http://ruby-doc.org/stdlib/libdoc/erb/rdoc/ERB.html) (for Embedded Ruby) which is like string interpolation for whole files.

Use ERB to define an HTML template for generate new galleries.

We can put the ERB file in a new directory called `views`, and name it something like `views/gallery-template.html.erb`.

### [v1.2] File and directory options

It would be useful if, when running this program, the user could specify the names of the HTML file and directory that the program generates.  A good way to build this feature is to allow the program to accept additional arguments, called **options**, which modify the behavior of the program.

Let's modify the program so that it accepts command-line options for specifying a file and directory name.

For example, we could add a `--file` option to allow a user to decide the name of the HTML file to be generated, like this

```console
$ ruby gallery.rb photos/*.jpg --file pics.html
```

And/or a `--directory` option to specify the name of the directory generated, like this

```console
$ ruby gallery.rb photos/*.jpg --directory my-photos
```

**HINT**

Ruby's standard library comes with a class called [OptionParser](http://ruby-doc.org/stdlib/libdoc/optparse/rdoc/OptionParser.html). It may prove useful.

### [v1.3] Index and detail view [multi-page]

The final iteration in the version `1.x` family is to make a more interesting gallery that includes both a _master_ page showing all of the photos as well as _detail_ pages for each photo. Photos on the master page would link to their respective detail pages.

Let's add a `--multi-page` option to the program to make it generate a gallery with separate master and detail pages.

When we are finished, running the command with a `--multi-page` option would generate an index page at `public/index.html` with detail pages in a subdirectory, like this

```console
$ ruby gallery.rb photos/*.jpg --multi-page
$ ls public/**
public/index.html

public/photo-pages:
bunny-1.html bunny-2.html bunny-3.html bunny-4.html

public/imgs:
bunny-1.jpg bunny-2.jpg bunny-3.jpg bunny-4.jpg
```

This might require the creation of two separate ERB templates: one for the master page and one for the detail page.

We can also get creative with this iteration, say by adding a "slideshow" feature where each detail page contains a link to the previous and next photos in the gallery.

## Finishing Up

Congratulations! You worked hard to build your program, and now you can bask in the satisfaction of your accomplishment.

One of the primary goals of this project is to learn how to **identify a goal and build incrementally towards that goal**. The operative skill in executing this effectively is the skill of [decomposition](http://en.wikipedia.org/wiki/Decomposition_(computer_science)): breaking a complex problem into simpler parts. If you can do this well--if you can see difficult problems as nothing more than a series of less-difficult problems--you will be able to accomplish great things with software. Do you feel more competent now than at the start?

At the end of any project, it is good practice to reflect back on the process and the product.

- What did you learn?
- How would you have done it differently if you could start over?
- Where would you make improvements or add features?
- What did you struggle with the most and why?

The answers to these questions will help propel you along your course of learning. Enjoy the journey.

- - -

## Explore Farther

Hungry for more? Here are two more iteration ideas to get your brain-wheels turning.

### [v2.0] Make it a gem!

RubyGems is the package management and distribution system for the Ruby community. Packaging your program as a gem allows you to publish and share your code with others.

Read [this tutorial on building a gem](http://guides.rubygems.org/make-your-own-gem/) and then package your own code as a gem.

Once you've finished, your friends will be able to install the gem on their own computers, like this

```console
# when you install the gem from wherever it is hosted
# (most likely GitHub)...
$ gem install https://url.for.gallery.repo.git
# ...it gives you access to a `gallery` command that
# can be executed from _any directory_ on your computer!
$ gallery photos/*.jpg
```
