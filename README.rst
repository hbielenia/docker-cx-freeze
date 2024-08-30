================
docker-cx-freeze
================
This repository holds configuration for building `Python's Docker image`_
with `cx_Freeze`_ installed. Currently it supports only the
``3.11-windowsservercore-1809`` platform.

Download
========
Images built from this repository are available from `Docker Hub`_ as
`hbielenia/cx-freeze`_ and from `GitHub Container Registry`_
as ``ghcr.io/hbielenia/docker-cx-freeze``.

Usage
=====
Usually, one will want to mount a local directory with Python code
and run ``cxfreeze`` on it. This is done with following command::

  docker run -v "%CD%":"C:\\Users\\ContainerUser\\SourceCode" --rm hbielenia/cx-freeze

Check `cx_Freeze`_ documentation for information on supported command line flags
and more.

Building locally
================
Windows-based images can only be built on Windows, with
`Docker Desktop`_ installed and ``docker`` available in the command line.
You also need to switch your installation to work with Windows
containers - this option is available after launching the Docker Desktop
via the context menu on it's system tray icon.

After completing these steps, clone this repository, open the Windows
command line program in it's directory and execute::

  docker build -t cx-freeze:latest -f 3.11-windowsservercore-1809.Dockerfile .

This will create an image tagged ``cx-freeze:latest`` in your local Docker image
store. You can change this tag name to whatever you like, as long as it
doesn't conflict with other image tags.

Issues and support
==================
Bug reports and feature requests are collected at `GitHub Issues`_.
For questions and usage help, please use `Discussions`_ instead. Bear in mind
that this project isn't a full time job and no one is under any obligation
to answer. However, there is genuine intent of providing support on a
best effort basis.

If you or your company require more commitment, you can inquire about
paid support at ``13271065+hbielenia@users.noreply.github.com``.

Copyright
=========
This configuration isn't very original, but in case it's copyrightable
now or in the future, in whole or in part, it's released under the terms
of `CC0 1.0 Universal`_ license. This license is pretty much the same as
public domain, but adjusted for countries where author can't simply release
into public domain. See ``COPYING.txt`` for full license text.

.. _Python's Docker image: https://hub.docker.com/_/python
.. _cx_Freeze: https://marcelotduarte.github.io/cx_Freeze/
.. _Docker Hub: https://hub.docker.com/
.. _hbielenia/cx-freeze: https://hub.docker.com/r/hbielenia/cx-freeze
.. _GitHub Container Registry: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
.. _Docker Desktop: https://www.docker.com/products/docker-desktop/
.. _GitHub Issues: https://github.com/hbielenia/docker-cx-freeze/issues
.. _Discussions: https://github.com/hbielenia/docker-cx-freeze/discussions
.. _CC0 1.0 Universal: https://creativecommons.org/publicdomain/zero/1.0/