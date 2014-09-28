# Photo Gallery - Command Line Interface

We're going to write a program that takes a set of images and generates an HTML image gallery.

Here is a (fake) story to give context to the kind of problem we are going to solve:

> As a professional photographer, I am always publishing new sets of photos to the web for my clients to view. My preferred method is to host a page on my own website and protect it either with a hard-to-guess URL or some authentication. As a result, I am constantly building custom HTML pages in Dreamweaver for my photo shoots. This is tedious and boring. There must be a better way...

Ignoring the melodrama of the above story, can you find the core problem? _As a developer_, your job is to take stories such as this one, identify the ways in which software could help, and then build that software.

Take a moment to think about how you might tackle the problem above given what you know now. If you feel like it, you can sketch your ideas down. Recording your thoughts is a good way to track your progress as you learn, like distance markers on a trail.

In the case of this project, we're going to start by boiling down the story with two simple questions:

- What is the raw material going in (the **input**)?
- What is the desired result (the **output**)?

Answer the questions for yourself before continuing.

The answers to these question will help us identify the key components of what is needed. Reducing large, complex stories into smaller and simpler component parts is what programming is all about.

Luckily for us, this story isn't _too_ complex. The answers to the above questions are straight-forward:

- The **input** is a set of _photograph files_.
- The **output** is a photo gallery rendered on an _HTML page_.

Now we have to figure out how what goes in the middle. :D And where do we start? With the _simplest possible solution_. Let's get started.

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

It is time to start working. Before you read any further or jump into writing code, take a minute (or five) to sketch out a rough plan for how you would solve this problem. Ask yourself questions like:

- How will this program be used?
- What are the smaller steps in between the input and output?
- Which tools (e.g. Ruby methods, UNIX utilities) might be needed?

You may not have clear answers. That is OK. Over time, you will build habits that help lead you to better answers more quickly. The first step is building a habit of asking the right questions.

In the iterations to follow, you will build up to a correct solution by starting small and taking incremental steps. [TODO: link to explanation of diff. between _correct_ and _functional/working_ programs] By the end of version 0.4, you will have written a program that can be executed from the command line like this

```shell
$ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
```

...and will output HTML looking something like this

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

So, where do we start?

### [v0.1] Output the filename as an absolute path

Take a look at the HTML above. The operative element on this document is the `<img>` tag. This is what a web browser uses to render an image (like a photograph) on a computer screen.

In order to do that, the browser needs to know _where_ to find the image file. The data for the image file does not live directly in the HTML document. Instead, it is a separate file that the browser needs to go fetch.

Since these image files reside on your local computer, the browser just needs to know their _absolute path_. [TODO: add link/entry to glossary]

So, how do we find out the absolute path? That, it turns out, is your first task.

**Write a Ruby program that takes a file and prints out the absolute path to that file**.

For example, if you run this

```shell
$ ruby gallery.rb my-pic.jpg
```

it will output this

```
/path/to/my-pic.jpg
```

If you don't already know how to do this, that is fine. But you will need to do the research on your own to figure it out. Since we are just getting started, and you may still be learning how to research effectively, here are some search queries you might want to try asking the internet:

- What is an absolute path?
- How to access command-line arguments in Ruby?
- How to find the absolute path of a file in Ruby?

Those should kick-start some good information gathering. And you might learn some extra stuff along the way.

When you have finished your own solution, you can take a look at an example solution by checking out the tag v0.1 [TODO: add link to tag v0.1]. Of course, you can also use this solution as inspiration if you are feeling super-duper stuck. But it's usually best to wrestle with the problem for a bit first.

### [v0.2] Generate an image tag as a string

The next step is to create the smallest possible bit of HTML that we can.

HTML is a flexible markup language, and it won't get mad if you omit a `<head>` tag or forget to declare your `DOCTYPE`. In fact, if you created a file `page.html` with the content `hi!` and opened it in your browser, your browser will read it without complaining. (Don't believe me? Try it out!)

So, with that in mind, what is the _smallest possible bit_ of HTML that we can write in order to render an image? Well, that would have to be a plain old `<img>` tag.

**Extend your program so that it will print out an `<img>` tag with the given file set as the `src` attribute.**

Now, if you run this command

```shell
$ ruby gallery.rb my-pic.jpg
```

it will output

```
<img src="/path/to/my-pic.jpg">
```

If you want, you can copy and paste the output into a file, give the file a name like `my-pic.html`, and open it in your browser of choice. Does it work? If not, you might want to investigate the `<img>` tag further.

> **PRO TIP**: when searching for information about HTML (or the DOM, or JavaScript), prefix your queries with `mdn` (for "Mozilla Developer Network"). They're the best in the business.

Example solution for v0.2. [TODO: add link to tag v0.2]

### [v0.3] Generate a full, valid HTML page

Now that you can create an image tag successfully, it should not be too difficult to add some more HTML to the mix, making it a valid HTML page with tags like `<title>` and `<body>`.

**Extend your program so that it will print a full HTML page with the image nested inside of the `<body>` tag.**

When you are finished, running this command

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

> **HINT**: Even though you are now printing out many tags on many lines, in Ruby you can still treat the HTML as one long string. Ruby offers many ways to represent strings: you may want to check out `heredoc`s and the `%Q()` syntax.

### [v0.4] Support multiple images

Up until this point, your program has only been working with a single image file. But of course, a photo gallery that can only display a single photograph is not very useful.

Let's remedy that.

**Modify your program so that it accepts many image files as arguments and packs them all neatly into one HTML page.**

In other, more technical words, your program should accept a _variable number of arguments_ (as opposed to before, when it had a _fixed argument length_).

When you're finished, you will be able to run this command

```shell
$ ruby gallery.rb photos/bunny-1.jpg photos/bunny-2.jpg photos/bunny-3.jpg
```

and it will output

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

Of course, you can pass the program _any_ number of image files. If you wanted to add all the files in the `photos` directory that end in `.jpg`, you could run this command

```shell
$ ruby gallery.rb photos/*.jpg
```

Nifty, huh? To see what that `*` is doing, try running `echo photos/*.jpg` on your command line.

> **A Brief Note on Repetition**
> You may be wondering why we didn't just start at v0.1 with a program that accepted more than one argument, if we knew all along that this is the behavior we wanted. The answer to that question is twofold, and it is a very important part of programming.
> The first reason is that _you should always solve the simplest case first_. One argument is simpler than many arguments. Therefore, start with one.
> The second reason is that _computers are really good at doing the same thing over again_. If you can tell a computer to perform a routine once (i.e. "convert this filename into an `<img>` tag for me, please"), it is not difficult to tell it to do the same thing `n` times for `n` arguments.

### [v0.5] Make it look nicer with CSS

Congratulations. You've built a program that is a genuinely useful tool for building a photo gallery web page.

At this point, however, it probably doesn't look very good. Just some photos on a page, no styling or layout at all.

**Write some CSS to improve the styles on your generated gallery page.**

Usually, you would write your CSS in a separate file and then link to that file in your HTML with a `<link>` tag. However, in the interest of keeping things as simple as possible, you can start by writing your CSS directly in your HTML using a `<style>` tag.

At the very least, you should style your `<img>` tags so that they have a better layout. You could also include a `border`. Maybe even a `box-shadow`?

### [v1.0] Generate a gallery directory

You're almost there. To get to v1.0 (a feature-complete implementation of your program), there is one final step.

Up until this point, the generated HTML references the _original image files_ in their _original location_ on your computer. This is not a problem if the HTML will only ever be viewed on your computer, but what happens if you wanted to share that HTML by publishing it on the world wide web? If you push your page up to a website, say `http://www.my-website.com/gallery.html`, and someone visits that site, their browser will download the HTML and attempt to load the image files using their `src` attribute. There's just one problem: the _file paths are for images stored on your computer_, and those photos obviously won't exist on the computers of whoever visits your website.

So, how do we resolve this issue? Think back to what a good MVP (Minimum Viable Product) looks like. We need to deliver a photo gallery that can be easily uploaded to a website. It makes sense that a deliverable package would include both the HTML _and_ the photo files themselves (or, better yet, a copy of them). That way, the HTML can include `<img>` tags that reference the photo files with a **relative path** [TODO: add link/term to glossary] instead of an absolute path. Then, so long as the path from the HTML files to the photo files is maintained wherever the gallery is moved, the photos will load on the page just fine.

**Instead of printing out HTML, modify your program so that it builds a new directory with an HTML file and a copy of all the image files.**

Once you have finished this iteration, running this command

```shell
$ ruby gallery.rb photos/bunny*.jpg
```

will create a new directory called with an HTML file inside of it and a subdirectory with copies of each of the photo files. In the example below, running the command will create a directory called `public`:

```shell
$ ruby gallery.rb photos/bunny*.jpg
$ ls public/**
public/gallery.html

public/imgs:
bunny-1.jpg bunny-2.jpg bunny-3.jpg bunny-4.jpg
```

You will need to learn some new tools to make this work. Use your research skills to learn how to do the following in your version of Ruby:

- Create a new directory
- Create and write to a file
- Copy files from one directory to another

> **A Brief Note on Versioning**
> You may have noticed that this iteration alters the _output_ of our program: the previous iterations all printed HTML to the screen, while this iteration creates a new directory and file structure. Nothing is printed to the screen. This is fine for now because you are the only user of this program, but imagine if other programmers had access to an earlier iteration and were using it to do work: this change would likely break other code that _depended upon_ the earlier version of our program to print out HTML.
> What about future changes? As soon as your program gets into the wild, how do you make updates and improvements without breaking other software that depends on your program?
> This is the problem that a good versioning system is intended to mitigate. Up until version 1.0, the **interface** [TODO: add link/term to glossary] of your program can change in all kinds of wacky ways, and that's OK. It is expected to be volatile and undependable. But, as soon as you reach version 1.0, any subsequent changes _should be backwards-compatible with previous 1.x versions_. In other words, using the program as defined in version 1.2 would produce the same outputs for a given input even if you updated to version 1.5 or 1.7.
> [TODO: add link to semantic versioning site]

- - -

_Note: subsequent iterations do not have example solutions. You will still have fun and learn a lot by completing them._

### [v1.1] Use ERB templates instead of strings

Now that you have a solid MVP, let's **refactor** [TODO: add link/term to glossary] your code to use some more appropriate and flexible features of Ruby.

In previous iterations, you built HTML by using Ruby's string interpolation (and/or concatenation) tools. This can get clunky and difficult when working with very long strings like full HTML pages.

Luckily for you, the Ruby standard library has a module called **ERB** (for Embedded Ruby [TODO: add link]) which is like string interpolation for whole files.

**Use ERB to define an HTML template for generate new galleries.**

You can put the ERB file in a new directory called `views`, and name it something like `views/gallery-template.html.erb`.

> **A Brief Note on the Binding Object**
> As you dive into and start learning about ERB, you will come across a very interesting feature of Ruby: the `binding` object. This object is like a container holding all of the variables available in the current scope. If that sounds confusing to you, then this is a great opportunity to explore Ruby by experimenting with `binding` and its relation to ERB.
> You may not use this object very often in your code, but it is a very useful feature of the language and it is a great way to learn about how Ruby works.

### [v1.2] File and directory options

It would be useful if, when running this program, the user could specify the names of the HTML file and directory that the program generates.

A good way to build this feature is to allow the program to accept additional arguments, called **options**, which modify the behavior of the program.

For example, you could add a `--file` option to allow a user to decide the name of the HTML file to be generated, like this

```shell
$ ruby gallery.rb photos/*.jpg --file pics.html
```

And/or a `--directory` option to specify the name of the directory generated, like this

```shell
$ ruby gallery.rb photos/*.jpg --directory my-photos
```

**Modify your program so that it accepts command-line options for specifying a file and directory name.**

> **HINT**: Ruby's standard library comes with a module called `OptParse` [TODO: add link]. It may prove useful for you.

### [v1.3] Index and detail view [multi-page]

The final iteration in the version `1.x` family is to make a more interesting gallery that includes both a _master_ page showing all of the photos as well as _detail_ pages for each photo. Photos on the master page would link to their respective detail pages.

**Add a `--multi-page` option to your program to make it generate a gallery with separate master and detail pages.**

When you are finished, running the command with a `--multi-page` option would generate an index page at `public/index.html` with detail pages in a subdirectory, like this

```shell
$ ruby gallery.rb photos/*.jpg --multi-page
$ ls public/**
public/index.html

public/photo-pages:
bunny-1.html bunny-2.html bunny-3.html bunny-4.html

public/imgs:
bunny-1.jpg bunny-2.jpg bunny-3.jpg bunny-4.jpg
```

This might require you to create two separate ERB templates: one for the master page and one for the detail page.

You can also get creative with this iteration, say by adding a "slideshow" feature where each detail page contains a link to the previous and next photos in the gallery.

## Finishing Up



- - -

## Explore Farther

Hungry for more? Here are two more iteration ideas to get your brain-wheels turning.

### [v2.0] Build a proper UNIX utility script

The UNIX philosophy [TODO: add link] states that good software is composed of programs that have a simple, well-defined function. The value of software comes from the unique interaction between programs, not the programs themselves; you know, "The whole is greater than the sum of its parts" and all that jazz.

One of the key concepts in UNIX is the idea of chaining programs together, often by building a "pipeline" of programs using the UNIX `|` ("pipe") command. A pipeline means that the outputs of one program become the inputs to another.

**Modify your program so that it can be used with a UNIX pipeline.**

To do this, `gallery.rb` needs to be able to read in the names of photo files from `STDIN` and print out the generated HTML to `STDOUT`. Once that is the case, you can run commands like this:

```shell
# this writes an HTML gallery to the file `index.html`
$ ls photos/*.jpg | ./gallery.rb > index.html

# what does this do? you'll have fun finding out ;D
# hint: run `man nc` to read the manual on the `nc` (netcat) command
$ ls photos/*.jpg | ./gallery.rb | nc -l 7777
```

### [v3.0] gem

```shell
# when you install the gem from wherever it is hosted
# (most likely GitHub)...
$ gem install https://url.for.gallery.repo.git
# ...it gives you access to a `gallery` command that
# can be executed from _any directory_ on your computer!
$ gallery photos/*.jpg
```
