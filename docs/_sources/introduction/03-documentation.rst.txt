Documenting Your project
########################

..	include::	/header.inc

We will begin this project by using Sphinx_ to generate our documentation. We
will need to process |RST| files using this tool many times, and the required
command is a bit obnoxious to remember. Instead we will use another common tool
in the development world to help us: **make**.

Step 3: Add a Makefile
**********************

I know many developers use fancy *Integrated Development Environments* to build
their projects. Those tools are powerful and complex. Learning one means
spending a fair amount of time getting to the point where you become proficient
enough to speed up your work. My problem with using an IDE is that many of them
force a structure on your project that is hard to figure out. Also, they tend
to lock you into one tool, which may not be the tool you will need to use when
you get that first "real" job. Furthermore, relying on an IDE when you are
learning the development craft hides details about the process you really should
understand. Finally, all IDE tools require a graphical interface, something not
found on servers sitting in that 'cloud'. many projects require some code to be
run on a remote server, and knowing how to work on those machines is a valuable
addition to your resume! 

So, we will be using the command line for our work.

But I am not going to force you to run every command manually. That would be
silly and time consuming. Instead, we will use a classic tool from the Unix
world called **make**. 

Make uses a simple (well, simple after you learn a few things) text file to
describe the steps needed to perform some task. Some developers think a project
must be using C/C++ programs when they see a **Makefile** in a project, but
Make_ does not care about the project language. You use a **Makefile** to
define a task you need to do over and over, then Make_ will run those steps for
you with one short command. 

let's start off our makefile by describing how we set up our project for modern
Python development. Here is the start.

..   literalinclude;;    /examples/makefile-1
    ;linenos;

There are three tasks we need to perform in this file. The makefile documents
the commands we need to run to perform each one

init
====

A Python project is usually run inside of something called a 8virtual
Environment*, something that isolates your project and all the specific
versions of supporting projects you include in your project, from every other
project on your system. This allows two projects to use different versions of
the same dependency without messing up either project. 

We will list our dependencies in a special file named **requirements.txt** that
looks like this for our project:

..  literalinclude::    /examples/requirements-1

A Python *Virtual Environment* is a self-contained copy of the python
installation, and a private area where project dependency code will be
installed using the python **pip** tool. The directory where all of this python
code will live is named **_venv** in my project directory. The **Makefile**
example above first checks to see if this folder already exists. If so, it does
nothing. If not, it runs a Python command to create the directory and the local
python installation. Next, it "activates" that new installation so ll python
commands from this moment on (until you close your command line window) will
use the local version of python and its tools. The last line just makes sure
that we use the latest version of **pip** to install dependencies.

You can run this set of commands as often as you like using this simple command
on the command line;

..  code-block;; bash

    $ make init

The first time you run the command, there will be a long string of messages as
Python sets up your *Virtual Environment*. If you run it again, the *Virtual
Environment* directory will exist, and the command will do nothing. 

reqs
====

The second set of commands is used to make sure your *Virtual Environment* has
the dependencies you need installed locally. The first line in this set asks
**pip** to load the dependencies listed in the **requirements.txt** file. The
next command in this list creates directories for the documentation we will be
processing using Sphinx_. Github_ has a neat feature available for free called
*Github Pages*. If you load web pages, such as those that Sphinx_ will build
for you into a directory named **docs** in your project, Github_ will make
those web pages visible on the Internet for free. We will set that up in a bit.

The last line in this set adds one file needed for *Github Pages* to work with
our project. The **.nojekyll** file, which has nothing in it, prevents further
processing of your web pages by Github_ before they get displayed on the web. 

docs
====

The last set of commands will be run any time you add new pages to your
documentation. This command first changes to the documentation folder, named
**rst** since it holds |RST| documentation and Sphinx_ control files, then runs
the Sphinx_ command to build your web pages and place them in the **docs**
directory.

Update .gitignore
*****************

At this point, we need to make an addition to the **.gitignore** file. We do
not want all of the code in the **_venv** directory included in our Github_
account, and we do not want anything extra constructed by Sphinx_ included
either. Here are the changes that keep those areas out of the official version
on Github_:

..  literalinclude::    /examples/gitignore-2
    :caption:   .gitignore

Sphinx Setup
************

Before we can build web pages for this project, we need two additional files in
the **rst** directory. These can be created using the **sphinx-quickstart**
command documented in the Sphinx_ documentation. I am just going to show those
files from this project. (I have already created them and cleaned them up for
the notes I am writing now. 

conf.py
=======

This file is a configuration file for Sphinx_. It includes some basic
information about the project that will need to be modified for each project. 

..  literalinclude::    /examples/conf.py
    :caption: cond.py

index.rst
=========

The top-level file in your documentation is the main web page for your
documentation. In this file we will tell Sphinx_ exactly where the
documentation pages should appear. In my example, I start off by placing
introductory pages in an **introduction** directory under the **rst**
directory. I use a simple convention that numbers each page in that
subdirectory with two leading digits so Sphinx will load then in the correct
order automatically. If I add new pages to this section, they will be processed
without modifying the **index.rst** file. Here is my starting file:

..  literalinclude::    /examples/index.rst
    :caption:   index.rst

Add Document Files
******************

Now, we just create new |RST| files under the **rst** directory, and run our
set of commands with Make_:

..  code-block:: bash

    $ make docs

Using your file explorer tool, navigate to the **docs** flder and double-click
on the **index.html** file. You will see the nice web pages produced by Sphinx.
When they look like you want, let's get them on Github_ so the world can see
them

Update Github
*************

First, make sure you have "pushed" your project with some files in the **docs**
folders. That means you have actually run Sphinx_ at least once on your
development machine. 

Before Github_ will display your new web pages, you need to tell it to do so.
Log into your Github_ account and navigate to your project repository. Find the
**settings** menu item, then scroll down to the *Github Pages* area.

Under *Source*, select "master branch/docs folder"

Shortly after making this change on Github_. You can see your new project
website at **https://<githubusername>.github.com/<projectname>/**

Here is a link to this project's documentation:

    * https://rblack42.github.io/pyrst/

..  note::

    I add this link to the **README.rst** file so folks browsing projects on
    Github_ can find the documentation easily.

