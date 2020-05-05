Preface
#######

Developers love to write documentation!

Yeah, right!

Documenting Software
********************

Developers traditionally spend the major part of their time thinking about how
to get their project running. They come up with ideas, code those ideas, then
test them.  Maybe they write documentation, but that is not really what they
think about the most. At some point, hopefully, their code matures sufficiently
and it is released to those "end-users".

At that point the software enters a different phase: maintenance. Someone,
maybe even someone different from the original developer, has to maintain this
code. Maintain means fixing bugs, and adding new features.

Hopefully, the maintainer will find documentation for this code. That will make
their work easier!

Right!

"What" Documentation
====================

Far too many developers focus their documentation on telling the world exactly
*what* their code does. The code itself does that. If only we could read it.

The worst kind on documentation you will ever find tells you to just "read the
code" to figure things out! If you did not write that code, you may be able to
figure things out, but it is going to take far too much of your time doing so!

Well written code is often "self-documenting", up to a point. If the original
developer used good names for program components, it may be possible to figure
out how things work sufficiently well to fix problems or add features. A lot of
developers seem to feel that writing writing self-documenting code takes a lot
of effort, and that interferes with getting code running and delivered! They
are under a lot of pressure, and time is valuable!

Some developers go overboard in adding documentation to their code in the form
of comments. There are tools available that extract properly structured
comments and produce pretty web pages to help the maintainer navigate the code.
Again, there is a problem with this. The resulting code is hard to read, since
it ends up buried between lengthy comment blocks.

Obviously, we need to make documentation more valuable, and studies of
successful software projects show that the code is a small part of what makes a
project successful! Over the life of a project, time spent in documentation
pays off rewards hard to see in the heat of development.

"Why" Documentation
===================

The main issue for a maintainer is not in the code itself. It may run just fine
and may be clearly written. The problem is that the code was written by someone
who had an immense amount of knowledge about that code stuck in that head of
theirs, and that knowledge is not sitting anywhere in that code. Too often,
that developer never wrote anything down to help explain the decisions that
were made in building the code.

The maintainer needs to understand *why* the code is structured as it is.  That
information is too often completely missing. We need tools that the developer
can use to write down their thinking, and several have evolved.

Since this is a Python project, we will focus on the documentation tool set
most commonly used today in Python development.

Documentation Tools
*******************

Developers are tied to their favorite editing tool, and will not pick up
something like Microsoft word to produce anything. If we hope to get them to do
a better job of documenting their work, we need to give them better tools.

Docutils
========

In 2000, David Goodger created a simple markup language he called
reStructuredText. This markup was simple to use. Documentation files could be
created using any text editor, and the resulting pages were readable with no
further processing David hoped this markup would be simple enough that
developers would be encouraged to produce better documentation. BY 2002 he had
developed a tool set for processing this markup into nice web pages and LaTeX
documents. His work succeeded, and developers did start creating better
documentation, but things really took off in 2008 when a second tool was
introduced.

Python Sphinx 
=============

Georg Brandl decided to add a layer on top of Docutils, with the intent of
making it easier to produce larger documentation products. Using Sphinx,
collections of reStructuredText pages could be stitched together with a table
of contents to produce a real "document". Tools were added to produce
publication quality PDF files, and even ebooks. 

Sphinx was originally designed to produce the documentation for the Python
project itself. Since everything is freely available, sphinx has become a
standard tool for documenting projects in all kinds of languages. I have used
Sphinx for over 15 years to produce lecture notes for Computer Science courses
I taught at Austin Community College in Austin, Texas. 

In spite of all of those years using this fine tool, I have still found the
need to add features to the program. Specifically, I wanted my lecture notes to
be able to include high-quality diagrams and figures, include code fragments,
and actual program output, and ultimately to produce book quality outputs.
Sphinx is almost capable of doing all of that, especially if you add custom
extensions to the tool. Many such extensions are available, but I still needed
to add a few of my own. Unfortunately, for a tool designed to support
documentation, most of the Sphinx documentation seems to be 'what'
documentation, making is hard to figure out how to extend the program. Reading
the code is painful, unless you are ready to spend quite a lot of time looking
for guidance others have dug out. 

..	note::

    Sorry, goerge. you should have written better 'why' documentation! Of
    course, thqt is just my opinion, and is not meant to take anything away
    from a tool that has done much to improve the state of documentation in
    this development world!


So how should we document a project?

Literate Programming
********************

In 1984, Dr. Donald Knuth knew about this documentation problem. He developed a
new philosophy he wanted developers to follow in building their code. He called
it `Literate Programming`. Basically, Dr. Knuth wanted to give the developer a
set of tools they could use to tell the story of their work. They would write
up that story so humans could follow along and see *why* the code was put
together in the way it is presented. The code could then be extracted from that
story and processed normally. It was a very innovative idea that,
unfortunately, did not take off as Dr. Knuth hoped it would.

When Knuth's original paper on this idea first came out, I was beginning my
work as an educator, teaching at the U.S. Air Force's graduate school in Dayton
Ohio. It struck me then that getting students to explain *why* they were
building their code some way would be an excellent way to spot problems with
their approach, and would help me correct any bad habits early. Unfortunately,
I never was able to take that idea further, as my Air Force career sent me to
other assignments.

I did write a simple Literate Programming tool I called PyLiT as part of my work on a Master's
Degree in Computer Science in 2003. In that project I constructed a wiki engine that supported
a simple form of Knuth's Literate Programming tools enabling developers to write code fragments
embedded in their wiki pages, that could be extracted to form normal code files
later.

..  note::

    This idea was not something KNuth wanted to see, since he believed they
    shoudl focus on the document they were writing. The code should only be
    seen in final form by processing tools, like their friendly compiler!)

Missing in that previous work was the ability to produce high-quality
documentation in forms other than web pages.

PyLiT7
******

That leads me to the development of the current tool which I am simply calling
**pylit7**. I came up with this name in 2003, while working on a project for my
Computer Science Master's Degree. However, I failed to get that name locked
down, and lost it to another developer. Not before I did register **pylit.org**
as my domain name, though!

Why this name? This tool is currently being written in Python, but may be
rewritten later in Go for reasons that will be explained as these notes
progress. The project will include ideas from Knuth's *Literate Programming*
concepts, but adapted to my own ideas about how Computer Science should be
taught today, and how documentation should be produced. The seven is simple:
this is the seventh version I have created.  The first six were used privately,
although remnants of those versions still live on my GitHub_ account.

The timing of this project may seem all wrong, since I
have actually retired from teaching now (and everything else!) However, I find
that I now have the time to put something together, and get that work out there
for others to use, extend, or trash! My hope is that the ideas I present make
enough sense to enough developers that something new will appear in the
development world. Maybe that will lead us in new directions, building better
products for future users!

The notes you will find here are in the form of a development diary. I want to
take the reader on a journey through the complete process of building a new
Python product, and detail all the steps taken to get that product out. Much of
what I will show is based on years of teaching software development to new
students, and doing that work professionally as well. My approach may differ
from that of others, but I will explain my reasoning as we proceed. 

I hope you enjoy the journey!
