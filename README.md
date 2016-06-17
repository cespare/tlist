**NOTE: I neither use nor maintain this project anymore.**

tlist
=====

tlist is an extremely lightweight TODO list manager for your commandline. It was written to be the bare
minimum that would meet my particular needs. It takes its inspiration heavily from
[t](http://stevelosh.com/projects/t/), a wonderful tool for the same purpose written by the amazing Steve Losh
(incidentally, owner of the prettiest website on the interwebs). tlist also borrows a workflow from
[Things](http://culturedcode.com/things/) (as described to me; I've never actually used it).

The are three primary features that separate tlist from t:

1. tlist is optimized for the single-person use case. The order of the list can be significant (it can
   represent a priority).
2. tlist has a built-in notion of labels for each task.
3. tlist can be used with a two-step workflow. Each new task is put into the "Unsorted" category, and then
   later the unsorted tasks may all be sorted at once.

Point #3 is why tlist is very efficient in my workflow. When a new task occurs to me, I can add it to my queue
of new tasks with almost no overhead (this avoids interrupting my current train of thought). Later, I can sort
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

After you've got tlist, you should set up a few things in your `.bashrc`/`.bash_profile`. First, specify your
chosen todo-list file as follows:

    export TLIST_FILE=path/to/tlist_file.txt

(Protip: put this in your Dropbox folder as a quick way to share your todo list between multiple computers.)
Next, you can get tab completion by sourcing the included file. Download `tlist_completion.bash` and put it
somewhere on your machine. Then

    source path/to/tlist_completion.bash

(This is optional.) Finally, if you want to get really crazy, you might alias `tlist` to something shorter. I
do this as follows:

    alias t=tlist
    complete -F _tlist t

Now you should be ready to go. Make sure it works by checking that you see the following output at your
command line (be sure to source your `.bashrc` or open a new terminal first):

    $ tlist
    Unsorted
    (No tasks)

Usage
-----

You can see the full list of options by typing

    $ tlist --help

However, there are only a few that you'll typically need. I'll guide you through a typical workflow using
those commands.

Let's start by adding a few tasks.

    $ tlist -a "Go to the bank"
    Added task 'Go to the bank' to label 'Unsorted'.
    $ tlist -a "Set up dentist appointment"
    Added task 'Set up dentist appointment' to label 'Unsorted'.
    $ tlist -a "Buy milk"
    Added task 'Buy milk' to label 'Unsorted'.
    $ tlist -a "Buy coffee"
    Added task 'Buy coffee' to label 'Unsorted'.

(Note: tlist will join all arguments together, so you can type `$ tlist -a Go to the bank` with no quotes.
However, if you've got any `'` characters in the task it will be interpreted as the start of a single-quoted
string by bash, so it's good to get in the habit of quoting the whole task.) You can inspect your tasks by
simply using `tlist`:

    $ tlist
    Unsorted
    * Go to the bank
    * Set up dentist appointment
    * Buy milk
    * Buy coffee

Now, adding new tasks is extremely quick, but they go to this "Unsorted" label. Now let's suppose you have a
few spare minutes, so you decide to organize all your tasks.

    $ tlist -s
    Sorting 4 unsorted tasks.

    Unsorted task:
    > Go to the bank
    No existing labels.
    Other options:
    n  Create a new label
    s  Skip this task
    q  Abort
    Select an option: n
    Enter new label name: Errands
    Added task 'Go to the bank' to new label 'Errands'.
    Removed task 'Go to the bank' from label 'Unsorted'.

    Unsorted task:
    > Set up dentist appointment
    ...

I'm ommitting extra output here, but you can see how this interactive sorting step lets you quickly sort the
tasks you made earlier. Let's suppose that your current task list looks like this:

    $ tlist
    Errands
    1. Go to the bank
    2. Set up dentist appointment

    Groceries
    1. Buy milk
    2. Buy coffee

    Unsorted
    (No tasks)

We can easily remove tasks:

    $ tlist -d
    Errands
    1. Go to the bank
    2. Set up dentist appointment

    Groceries
    3. Buy milk
    4. Buy coffee

    Select a task to delete (1-4 or q to abort): 3
    Removed task 'Buy milk' from label 'Groceries'.

It's also easy to restrict many of these operations to a specific label:

    $ tlist -l Groceries -a Buy yogurt
    Added task 'Buy yogurt' to label 'Groceries'.
    $ tlist -l Groceries -a Buy fruit
    Added task 'Buy fruit' to label 'Groceries'.
    $ tlist -l Groceries
    Groceries
    1. Buy coffee
    2. Buy yogurt
    3. Buy fruit

    $ tlist -l Groceries -d
    Groceries
    1. Buy coffee
    2. Buy yogurt
    3. Buy fruit

    Select a task to delete (1-3 or q to abort): 2
    Removed task 'Buy yogurt' from label 'Groceries'.

Advanced usage
--------------

In addition to these basic operations, there is a concept of a "working" label from which you are actively
completing items. You can get and set your working label as follows:

    $ tlist -g
    No working label set. Use $ tlist --current to set a working label.
    $ tlist -c Errands
    Set current working label to 'Errands'.
    $ tlist -g
    Errands

Once you've set a working label, you can quickly pop items from the list and delete them as you finish with
the `--next` and `--finish` commands:

    $ tlist -n
    Go to the bank
    $ tlist -f
    Removed task 'Go to the bank' from label 'Errands'.
    $ tlist -n
    Set up dentist appointment
    $ tlist -f
    Removed task 'Set up dentist appointment' from label 'Errands'.
    Removed empty label 'Errands'.

One last command that is very useful is `--edit`. Just type

    $ tlist -e

and the tlist file will be opened in your `$EDITOR`. Be careful not to change the formatting. The blank lines
are significant, as are the colons (signify labels) and `>` (signifies current label). It's often quickest to
do complex reorganization of your tasks in your editor, rather than the one-by-one operations that tlist
natively supports.

Tests
-----

The tests for tlist are in the `tests/` directory, and they're written using
[cram](https://bitheap.org/cram/). Install cram and then run all the tests with

    $ cram test/*.t

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
