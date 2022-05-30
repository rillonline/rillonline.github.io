.. title: lxml
.. slug: lxml
.. date: 2015-05-03 16:40:13 UTC-05:00
.. tags: 
.. categories: Linux 
.. link: 
.. description: 
.. type: text

When I did an upgrade today, I received a conflict between python-lxml
and the lxml package in the python tree. I fixed this by uninstalling
python-lxml and lxml via pip

::

   sudo pacman -rcns python-lxml
   sudo pip uninstall lxml

Then I reinstalled python-lxml

::

   sudo pacman -S python-lxml

Not sure why all this happened.
