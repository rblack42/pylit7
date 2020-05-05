Testing Your Code
#################

..  include:: /header.inc

Do you test your code? Of course you do. You run it and make sure it produces
the expected results. That is one form of testing, but not the best form.

In today's development world, you never make a change to your code without
first writing some form of test to automatically make sure your changes work as
expected. This is called **Test Driven Development** and it requires at least
three steps (we will actually use five!)

    1. Decide what feature to add next.

    2. Write a simple test that proves that this new feature works.

    3. Run the test and prove that it fails (it will, you have not written any
       code yet!)

    4. Write code to make the test pass.

    5. Clean up your code and make it better, without changing how it works.
       This is called *refactoring*.

We will be using this process as we proceed in the development work on
**pyrst**. But before we begin, we need to do a bit more setup work.

Adding Test Tools
*****************

We do not want to manually run a bunch of tests, so we will use a test
discovery tool to run them for us. I use a simple tool called **nosetests** to
do this for Python projects. (Where to folks come up with these names?).

Add **nose** to your **requirements.txt** file, then run **make reqs** to add
this package.

Python has support for basic unit testing built in, Create a **tests**
directory in your project and add this starting test:

..  literalinclude::    /examples/test_sanity.py
    :linenos:
    :caption: test_sanity.py

This test file shows the pattern we will use for future tests. We have nothing
to test yet, so this test simply makes sure our tests system works.

You can verify this by running this command:

..  code-block:: bash

    $ nosetest

    .
    ----------------------------------------------------------------------
    Ran 1 test in 0.008s

This is what we want to see. The test "passed", meaning no errors were seen. If
the test had "failed" I would see a message telling me I have more work to do.

..  note::

    Once you get into testing, you never walk away from a project unless all
    tests pass. That way, your work has not broken the project others might be
    working on. You wil experience evil feelings if you break a big project (or
    worse!)

Create A Test Task in Makefile
******************************

Since we will be testing a lot, we need to add another task to our Makefile:

..  literalinclude::    /examples/Makefile-2

With this addition, all tests we write will be run with one simple Make_ command:

..  code-block::    bash
    
    $ make test
    
Adding Travis-CI Support
************************

Another great tool you can use for free is automatic testing on Travis-CI_.
This service will watch your Github_ repository, and any time you update
things, it will automatically create a clone of your project and run commands
you specify. If all of that works with no errors, you will be issued a "badge"
that you can place a link to on your project repository **READMErst** file. That
way you can instantly see that this project is being tested and is in good
shape. Broken projects, indicated by tests that fail, are not good places to
spend time, too much work is needed to to get this project in a shape that
makes it interesting enough to study!

To use Travis-CI_, you need to set up an account on their system, then add your
project repository to the list of projects to watch Once that is done, we add a
control file to our project named **.travis.yml**. For our simple project, here
is a start on this file:

..  literalinclude::    /examples/.travis.yml
    :caption:   .travis.yml

This file tells Travis-CI_ what language we are using, what to do to get the
project ready to run, then the project command we want to run to test things.
Travis-CI actually builds a virtual machine for this project, clones your
project into that machine, then does the setup needed for your project to run
inside that machine. By default this test machine runs Linux, which should be no
problem for Python projects. All we want to do is verify that our tests (all
one of them) run without errors on this different machine.  This gets rid of
silly developers saying "it runs on my machine" when your code does not run
elsewhere!

..  note::
    
    You can atch Travis-CI_ do all this work by logging into your account and
    clicking on your project name. Every time the server starts a new "build"
    (which it does every time you push changes to Github_), the build will run
    and the badge will be updated. Check out the project page on Github_ to see
    the results!

Hey! We are ready to write some code!
