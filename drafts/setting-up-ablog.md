---
blogpost: true
date: August 15, 2021
category: Tech
location: Earth
---

# Setting up Ablog #

## Background ##

This has been difficult for me. I went down a number of alleys which
did not lead to joy. In the end, I decided on a very generic
presentation so that `ablog` works.

I decided on the generic approach for two reasons:

1.  I got it working. I didn't want anything to break which led me
   initially to despair and to work late.
   2. My blog posts are more or less temporary. They may stay in the
      blog repository, but I will be moving most of them to another
      repository where they will be stored in writing collections.
      This means they don't have to stay searchable and I don't expect
      my readers to have to search through pages of archives to find
      them. The most likely person to search is me.

## Let's Get Started ##

[ablog][ablog] is written in `python` so you will need to have `pip`
installed. I am using a `Debian` installation so I had to install it
manually. I already had [Jupyter Book][jb] installed. This means I
already had `Sphinx` and the `myst-parser` installed. With [jb][jb]
installed, I was running `Spinx 3.5.4` running, but was able
subsequently to update both `Spinx` and `myst-parser` to later
versions. I think this helped me but I can't say for sure. Your
mileage may vary.

My install command is simple:

	sudo pip3 install ablog

## Starting Ablog ##

I created a new repository on [github][github] which I cloned so
basically I had a blank repository. Then I was able to set up the
initial framework for [ablog][ablog]. This is important because
[ablog][ablog] cannot be installed in a directory with an existing
conf.`py` file. 
	ablog start

You will be prompted for several bits of information including where
to install [ablog][ablog]. The directory must exist. The other pieces
of information will be written into your conf.`py` file.

## Restructured Text or Markdown? ##

The first decision  you need to make is whether you want to write your
posts in Restructured Text (rst) (the language of Sphinx) or use Markedly
Structured Text ([myst][guide]). Myst uses `.md` for files while Restructured
Text uses `.rst`. You will notice that [ablog][ablog] uses `.rst`.
Fortunately, once you have Myst set up, you can use both.

If you already know markdown, you can get along fine with Myst. I
became familiar with Myst through [jb][jb] and its a handy reference
with its [Myst [cheat sheet][cheat].

## Get Myst Working ##

You need to add myst_`parser` to the `extensions` variable in
`conf.py`. Remember, this is `python` so follow the format of the
other extensions. 

    extensions = [
        ...
        "myst_parser",
        ...
    ]

```{tip}
Be sure to notice the square brackets `[]`.
```

You also need to add this statement. I put
mine at the end of the `conf.py` file:

    myst_update_mathjax = False

I also put this to enable additional features of `myst`.

    myst_enable_extensions = [
        "amsmath",
        "colon_fence",
        "deflist",
        "dollarmath",
        "html_admonition",
        "html_image",
        "linkify",
        "replacements",
        "smartquotes",
        "substitution",
        "tasklist",
    ]

My previous tip about square brackets `[]` applies here, too.

## Front Matter ##

Finally, each post needs front matter. I am using the `yml` format.

    ---
    blogpost: true
    date: August 15, 2021
    category: Tech
    ---
	
	Note particularly the three hyphens `-` on a separate line to
	start and end the front matter. There are several other possible
	pieces of information, but these are the most critical.
	
## The `index.rst file ##

I almost left the `index.rst` file alone. In my various iterations of
dealing with [ablog][ablog] this gave me the most trouble. That's why
my blog page looks so generic and boring. It just works.


  * I took out the references to *about me* because I reference that info
elsewhere.

  * I also deleted the file in the directory and the `index.rst` file.

## Building the Blog ##

To build the blog you simply type:

	ablog build

You will get a warning about `mathjax`. Review other warnings as
needed. Your new web site is in the `_website` directory.

## Cleaning ##

I find it useful to delete the `_website` directory before a build.
[ablog][ablog] has a command for this:

	ablog clean

## Getting Online ##

I use `ghp-import` to get my pages published. It's another `python`
program I learned about from [jb][jb]. [ablog][ablog] has its own
`deploy` function but I haven't checked that out yet. `ghp-import`
only handles `gh-pages` so I have to commit my own source files to
[github][github] which is just fine with me for right now.

## Conclusion ##

I was using [nikola][nikola] to publish my blog. It's fine, but it's
heavier to use. There's a lot of flexibility and the option of
building pages, too. I just want a simple blog program and so far,
[ablog][ablog] satisfies this requirement. I need to learn more about
the `.. toctree` directive in Sphinx to clean up my landing page and
add some more interesting elements to it.

[ablog]: https://ablog.readthedocs.io
[nikola]: https://getnikola.com/
[jb]: https://jupyterbook.org/intro.html
[guide]: https://myst-parser.readthedocs.io/en/latest/syntax/syntax.html
[github]: https://github.com
[cheat]: https://jupyterbook.org/reference/cheatsheet.html 

