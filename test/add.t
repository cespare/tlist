# Test adding new tasks

# Setup
  $ touch tlist_file
  $ export TLIST_FILE=tlist_file
  $ PATH=$TESTDIR/../bin:$PATH

# Tests
  $ tlist
  Unsorted
  (No tasks)
  
  $ tlist -a task 1
  Added task 'task 1' to label 'Unsorted'.
  $ tlist
  Unsorted
  * task 1
  
  $ tlist --label "Label1" --add task 2
  Added task 'task 2' to new label 'Label1'.
  $ tlist
  Label1
  1. task 2
  
  Unsorted
  * task 1
  
  $ tlist -l "Label1" -a task 3
  Added task 'task 3' to label 'Label1'.
  $ tlist
  Label1
  1. task 2
  2. task 3
  
  Unsorted
  * task 1
  
  $ tlist -l "Label2" -a task 4
  Added task 'task 4' to new label 'Label2'.
  $ tlist
  Label1
  1. task 2
  2. task 3
  
  Label2
  1. task 4
  
  Unsorted
  * task 1
  
