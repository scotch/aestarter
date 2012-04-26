=========
AEStarter
=========

About
=====
AEStarter ...

Installation
============
First install the needed libraries before running de development server.
Here's how:

- Access the project directory and call the bootstrap script. We pass the
  command --distribute because it is preferable to the default setuptools.
  This will prepare buildout to run:

    python bootstrap.py --distribute

- Build the project calling bin/buildout. This will download and setup
  Engine-Starter and all libraries inside the /app directory. It may take a while.

  .. Note::
    If you are on Windows `Junction`_ must be installed to create the symbolic links

    bin/buildout

- Start the development server calling bin/dev_appserver. It will use the
  application from /app by default:

    bin/dev_appserver

- Open a browser and test the URLs:

    http://localhost:8080/


.. _Junction: http://technet.microsoft.com/en-us/sysinternals/bb896768.aspx