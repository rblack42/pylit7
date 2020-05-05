Getting Started
###############

..  include::   /header.inc

How do we even begin a project? I am going to assume that you are familiar with
the basic development process, so some of what we will do is based on having
some experience, including using the *command-line* to activate programs and
manage the file system.

..  note::

    If you have never used the *command line*, you should spend some time
    learning that skill. You will be much better prepared to use modern
    machines living in that "cloud" we hear about, most of which have no fancy
    graphical mouse-driven interface!

Step 1: Pick a Project Name
***************************

You need a simple name for your project. Convention tells us to keep the name
all lower case, do not use dashes in the name (underscores are OK) and the
shorter the better. I chose **pylit7**.

We begin the project by establishing a home for it on our development system. I
keep all my active development work in a directory named **_projects** on my friendly
Macbook Pro laptop. The leading underscore is used to force that directory name
to the top of alphabetical lists of directory contents in my *Fiinder* tool
(file explorer for you Windows folks).

..  code-block::`bash

    $ cd ~/projects
    $ mkdir pylit7

We will be documenting this project using Sphinx (for now) and hosting the
project on Github_. All self-respecting developers use some form of
source-code-control, and Git is the most popular tool out there at the moment.
Github_ is the home for millions of software projects. My Github_ user name is
**rblack42**, so I will show how I set things up for this new project in my
account.

Step 2: Get the Project on Github
*********************************

Even though the project is just a simple directory, we can take the next step
and create the home for it on Github_. Assuming you have Git_ installed on your
system, here is how we proceed:

..  code-block::    bash

    $ cd pylit7
    $ git init 
    Initialized empty Git repository in /Users/rblack/projects/pyrst/.git/

Of course it is empty, we have not added any files to the project yet!

Next, we need to add a special file to the project, to keep Git from copying
useless files to Github_. Ideally, all we will copy there are files needed t
actually build our code, not anything we can create from that code later.

The file we need is named **.gitignore**

..  literalinclude:: ../../.gitignore

Mac system create a funny file named **.DS_Store** in every directory they
find.  This is used to speed up searches on the file system. Those files are
not part of our development work, and we do NOT want them on Github_. The
**.gitignore** file details file names and directories  we do not want managed
by Git. We will add more to this file later. As you see in the above example,
you can add Python-style comments to this file. 

Next, you need to create a repository for this project on Github_. Log into
that system and create the repository with the project name we chose. Do not
add anything else at the moment. When you create this new repository, you will
see instructions detailing how to connect your current project directory to
Github_. You will need to run two commands on your development machine to make
this connection:

..  code-block:: bash

    $ cd pylit7
    $ git remote add origin https://github.com/rblack42/pylit7.git
    $ git push -u origin master

The first line is only needed if you are not currently working inside the
project directory. The next line actually tells your local version of Git_ where
this project is hosted. The name of the remote server is **origin**, and the
place on that server to connect to is shown. (Remember that I am using my
Github_ account in this example. Your  will need to use your own account name.

the last line "pushes" new files from your development system to Github_. The
**-u** option tells Github_ to track changes to the project on the server. We
will only add that option once when we copy files to the server.

Once this process completes, you have a home for your project that can be viewed by
millions of developers. Open-Source projects are wonderful places to explore and see how
developers set up projects and produce their code.  

A New Way to Think
******************

Great! We have created a home for the project, and have a start in our actual
development work. We should begin thinking that Github_ has our real code. What
we have locally is called a "working copy" of that code. We will do our work
locally in our working copy, then "push" new work to the server when we think it is an
appropriate time to do so. Most serious developers "push" every time they reach
some kind of milestone, however small that may be. Once the "push"  completes,
we can always get a fresh copy of everything on the server any time we need, on
any machine we want to use. That can be very handy if you work on multiple
machines. 

..  note::

    In my teaching, I always kept machines for each of the three major systems
    developers use: Linux, Windows, and Macs. I would set up a project on my
    Macbook, then "clone" the project on each of the other systems to make sure
    everything would work for all of my students. It was quite an adventure
    dealing with the variety of systems students brought to my classes! This
    process was not actually needed for a single project, but I had to hep
    students get the development rool they would need for my classes running on
    their particular machines!

We are ready to actually produce some code, but we will be taking "baby-steps"
from here. There is a reason for this and that has to do with creating code
that actually works, and proving that it does!
