tlist
=====

tlist is an extremely lightweight TODO list manager for your commandline. It was written to be the bare
minimum that would meet my particular needs. It takes its inspiration heavily from
[t](http://stevelosh.com/projects/t/), a wonderful tool in the same vein written by the amazing Steve Losh
(incidentally, owner of the prettiest website on the interwebs). tlist also borrows a workflow from
[Things](http://culturedcode.com/things/) (as described to me; I've never actually used it).

The are three primary features that separate tlist from t:

1. tlist is optimized for the single-person use case. The order of the list can be significant (it can
   represent a priority).
2. tlist has a built-in notion of labels for each task.
3. tlist can be used with a two-step workflow. Each new task is put into the "Unsorted" category, and then
   later the unsorted tasks may all be sorted at once.

Point #3 is why tlist is very efficient in my workflow. When a new task occurs to me, I can add it to my queue
of new tasks with almost no overhead (this avoids interruping my current train of thought). Later, I can sort
through my new tasks and organize them all at once.

Installation
------------

The easiest way to install tlist is to install the gem

    gem install tlist

This will install all the dependencies for you. It requires Ruby (I've tested with 1.8.7 and 1.9.2).

You can also install the latest version from Github by cloning the
[repository](https://github.com/cespare/tlist) and then adding `tlist` to your path. You'll need to make sure
the following dependencies (gems) are installed:

* trollop
* colorize
* methodchain

Usage
-----

You can get command-line completion by ...

Set up your `.bashrc` by ...

TODO: finish section

Tests
-----

The tests for tlist are in the `tests/` directory, and they're written using
[cram](https://bitheap.org/cram/). Install cram and then ...

TODO: implement tests and finish this section.

Contributions
-------------

If you'd like to hack on tlist, go ahead and [fork the project on github](https://github.com/cespare/tlist).
Open a pull request if you'd like me to incorporate your changes, but keep in mind that I'd like to keep tlist
pretty lightweight so I may not accept large new features.

Author
------

tlist was written by Caleb Spare (cespare on Github).

License
-------

[BSD 2-clause license](http://opensource.org/licenses/bsd-license.php); see LICENSE.txt.
