EMacspeak on a Mac
==================

Introduction
------------

Installing emacspeak on a mac is different from installing it on a Linux
machine, especially in a debian-based system.

Getting Ready
-------------

1.  Install `xcode` from the mac app store. It is free. This is a 4gb
    download so it takes a while.
2.  I make `/usr/local` available to myself:

        sudo chown -r rill:staff /usr/local

    I do the same for my home directory.

3.  Install `homebrew`. I used this one-line script:

        #!/bin/bash

        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)

4.  Next install `emacs`.

        brew install emacs

5.  This emacs is incomplete. I added:

        brew install homebrew/emacs/markdown-mode
            brew install /homebrew/emacs/auto-complete
            brew install homebrew/emacs/org-mode
            brew install homebrew/emacs/applescript-mode

Installing Emacspeak
--------------------

1.  Now you must make a decision. You can clone the stable release of
    `emacspeak` or the current state of the project. The current one has
    extra documentation files.
2.  Download and untar the latest stable release of `emaspeak`. As of
    2016/03/23/ this is 43.0 Sound Dog:

        brew install wget
            wget https://github.com/tvraman/emacspeak/releases/download/emacspeak-43.0.tar.bz2
            tar -xf emacspeak-43.0.tar.bz2

    &gt;

3.  Alternatively, clone the current state of the project:

        git clone https://github.com/tvraman/emacspeak.git

    &lt;

    You may be prompted to install git.

4.  Change directory to the cloned `emacspeak-43.0` or `emacspeak` and
    do:

        make config
          make

5.  Either in the initialization file (.emacs or init.el) or in a bash
    csource file, `DTK_PROGRAM` needs to be set to mac, e.g.,:

        export DTK_PROGRAM="mac"

    This works if I do it from the command line, but
    `.bashrc is not the place to put it for a consistent experience. I don't know how to do it in an emacs configuration file.   `

6.  This is where my knowlege gets murkey.
    -   In Linux, I would do `sudo make install` after the `make` but
        this didn't work.
    -   I installed `texinfo` with homebrew for the documentation but I
        don't know if `texinfo` is fully installed or if this had
        any impact.

            brew install texinfo

    -   I copied the `emacspeak` directory into
        `/usr/local/share/emacs/site-lisp` because that is where it
        resides in Linux.
    -   I uased the command
        `emacs -l /usr/local/share/emacs/site-lisp/emacspeak/lisp/emacspeak-setup.el`.
        I don't know how this affects running `emacs` from the
        Applications in the gui. Ideally, we would want to run `emacs`
        from the dock.
    -   It is necessary to understand how to use the `init.el` and
        `.emacs` file to customize `emaspeak`. I couldn't use anything I
        found online.
    -   I installed `sox`, but I don't know if this is necessary.

            brew install sox

**Note**: A lot of the instructions I found are very old and I think
some things are done differently now, especially "init.el" and ot of the
"emacspeak" commands are obselete.

Happily, the changes in voice pitch work.
