# Test printing various pre-made tlist files.

# Setup
  $ PATH=$TESTDIR/../bin:$PATH

# Tests
  $ TLIST_FILE=$TESTDIR/files/empty.txt tlist
  Unsorted
  (No tasks)
  
  $ TLIST_FILE=$TESTDIR/files/empty.txt tlist --print
  Unsorted
  (No tasks)
  
  $ TLIST_FILE=$TESTDIR/files/empty.txt tlist -p
  Unsorted
  (No tasks)
  
  $ TLIST_FILE=$TESTDIR/files/empty_labels.txt tlist
  Foo
  (No tasks)
  
  Bar
  (No tasks)
  
  Baz
  (No tasks)
  
  Unsorted
  (No tasks)
  
  $ TLIST_FILE=$TESTDIR/files/only_unsorted.txt tlist
  Unsorted
  * unsorted 1
  * unsorted 2
  * unsorted 3
  * unsorted 4
  
  $ TLIST_FILE=$TESTDIR/files/only_one_label.txt tlist
  Foo
  1. foo task 1
  2. foo task 2
  3. foo task 3
  
  Unsorted
  (No tasks)
  
  $ TLIST_FILE=$TESTDIR/files/one_label_and_unsorted.txt tlist
  Foo
  1. foo task 1
  2. foo task 2
  
  Unsorted
  * unsorted 1
  * unsorted 2
  
  $ TLIST_FILE=$TESTDIR/files/many_labels.txt tlist
  Foo
  1. foo task 1
  2. foo task 2
  
  Bar
  1. bar task 1
  
  Baz
  1. baz task 1
  2. baz task 2
  3. baz task 3
  
  Unsorted
  * unsorted 1
  * unsorted 2
  * unsorted 3
  * unsorted 4
  
  $ TLIST_FILE=$TESTDIR/files/many_labels.txt tlist --unsorted
  Unsorted
  * unsorted 1
  * unsorted 2
  * unsorted 3
  * unsorted 4
  
  $ TLIST_FILE=$TESTDIR/files/only_one_label.txt tlist -u
  Unsorted
  (No tasks)
  
