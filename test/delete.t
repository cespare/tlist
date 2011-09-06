# Deleting tasks.

# Setup
  $ cp $TESTDIR/files/many_labels.txt tlist_file
  $ export TLIST_FILE=tlist_file
  $ PATH=$TESTDIR/../bin:$PATH

# Tests
# The long line below is confusing. There is no newline after ": " because '4' is echoed in. When the user
# inputs '4' from the prompt, a newline will separate the prompt from the response.
  $ echo "4" | tlist --delete
  Foo
  1.  foo task 1
  2.  foo task 2
  
  Bar
  3.  bar task 1
  
  Baz
  4.  baz task 1
  5.  baz task 2
  6.  baz task 3
  
  Unsorted
  7.  unsorted 1
  8.  unsorted 2
  9.  unsorted 3
  10. unsorted 4
  
  Select a task to delete (1-10 or q to abort): Removed task 'baz task 1' from label 'Baz'.
  $ tlist
  Foo
  1. foo task 1
  2. foo task 2
  
  Bar
  1. bar task 1
  
  Baz
  1. baz task 2
  2. baz task 3
  
  Unsorted
  * unsorted 1
  * unsorted 2
  * unsorted 3
  * unsorted 4
  
  $ echo "3" | tlist -d -l unsor
  Unsorted
  1. unsorted 1
  2. unsorted 2
  3. unsorted 3
  4. unsorted 4
  
  Select a task to delete (1-4 or q to abort): Removed task 'unsorted 3' from label 'Unsorted'.
  $ tlist
  Foo
  1. foo task 1
  2. foo task 2
  
  Bar
  1. bar task 1
  
  Baz
  1. baz task 2
  2. baz task 3
  
  Unsorted
  * unsorted 1
  * unsorted 2
  * unsorted 4
  
