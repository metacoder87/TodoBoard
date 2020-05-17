


# Phase 2: 
# So little time, so much todo

# In this phase of the project, we'll refactor our code 
# to support the following features:

# marking items as done
# deleting items
# managing multiple lists in a single board
# Extending items and lists
# Item#initialize(title, deadline, description)
# Refactor this existing method to also initialize a boolean instance variable to 
# track whether or not the item is "done". An item should be not "done" by default.

# Item#toggle, List#toggle_item(index)

# This new method should "flip" the current state the item. That is, if the item 
# is done, then change it to not done; if it is not done, then change it to done.

# Don't expose a writer method for the instance variable that tracks the done state. 
# We want to properly encapsulate all of the data within an item. Imagine that the 
# user is out to break your program! If they could write to the instance variable, 
# they could assign it to some non-boolean value. Encapsulation means that the user 
# can only manipulate the data in ways that the programmer intends.

# We need to fully integrate this new feature into our app. Create a corresponding 
# List#toggle_item(index) and modify TodoBoard#get_command to allow a user to 
# utilize this new feature with the input command toggle <index>.

# List#print, #print_full, #print_priority

# Since our items contains a new field, update the output of these methods to also 
# print out a column indicating whether or not the item is done.

# List#remove_item(index)

# This method should permanently delete the item of the list at the given index. 
# If the index is invalid, the method should return false. If the deletion is 
# successful, then the method should return true. Implement this method so that 
# there are no awkward gaps in the list after an item is removed. Allow a user to 
# utilize this new feature by supporting the input command rm <index>.

# List#purge

# This method should remove all items that are currently marked as done. Correctly 
# implementing this may be tricky.

# Checkpoint - Are we "done" yet?
# You know the drill. Test your code thoroughly before moving forward! 
# Here is how we tested ours:

# [1] pry(main)> import 'todo_board.rb'
# [2] pry(main)> my_board = TodoBoard.new('cool-tech-to-learn')
# => #<TodoBoard:0x
#  @list=
#   #<List:0x
#    @items=[],
#    @label="cool-tech-to-learn">>
# [3] pry(main)> my_board.run

# Enter a command: mktodo ruby 2019-12-04
# Enter a command: mktodo sql 2019-12-20
# Enter a command: mktodo rails 2020-01-06
# Enter a command: mktodo javascript 2020-01-08
# Enter a command: mktodo react 2020-02-08
# Enter a command: mktodo redux 2020-02-15
# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [ ]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [ ]
# 3     | javascript           | 2020-01-08 | [ ]
# 4     | react                | 2020-02-08 | [ ]
# 5     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: toggle 0

# Enter a command: print 0
# -------------------------------------------------
# ruby                            2019-12-04    [✓]

# -------------------------------------------------

# Enter a command: toggle 0

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [ ]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [ ]
# 3     | javascript           | 2020-01-08 | [ ]
# 4     | react                | 2020-02-08 | [ ]
# 5     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: toggle 0

# Enter a command: toggle 2

# Enter a command: toggle 3

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [✓]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [✓]
# 3     | javascript           | 2020-01-08 | [✓]
# 4     | react                | 2020-02-08 | [ ]
# 5     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: rm 4

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [✓]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [✓]
# 3     | javascript           | 2020-01-08 | [✓]
# 4     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: purge

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | sql                  | 2019-12-20 | [ ]
# 1     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------
# Play with your board for a bit. It's really coming together, huh?

# Implementing support for multiple lists
# Now it's time for the big one! We've been following some important object 
# oriented practices up until this point and now it's time to get the pay-off. 
# Our goal is to now manage multiple Lists in our TodoBoard. Because we have 
# separated our the logic wisely thus far, we should only have to modify our boards.

# TodoBoard#initialize

# Our board should no longer initialize with a single list. Instead, initialize a 
# board to contain an empty hash. We will allow the user to create lists at runtime. 
# This hash will eventually contain list labels as the keys and list instances as 
# the values. A hash is a great choice here because keys are unique, much like how 
# we'll want the user to refer to their different lists with unique labels.

# TodoBoard#get_command

# The entirety of this new feature has to do with how the user interfaces with 
# their many lists, so our only task is to refactor this method. It is quite an 
# interesting refactor though. For our existing commands, the user now needs to 
# specify which list to apply the action to.

# We'll leave it to you to refactor this method. Here are all of the commands you 
# need to support (note that some of these are new):

# mklist <new_list_label>
# make a new list with the given label
# ls
# print the labels of all lists
# showall
# print all lists
# mktodo <list_label> <item_title> <item_deadline> <optional_item_description>
# add a new item to the specified list with the given information
# toggle <list_label> <item_index>
# toggle "done" for the specified item on the given list
# rm <list_label> <item_index>
# remove the specified item on the given list
# purge <list_label>
# remove all "done" items on the given list
# up <list_label> <item_index> <optional_amount>
# move the specified item higher on the given list
# down <list_label> <item_index> <optional_amount>
# move the specified item higher on the given list
# swap <list_label> <item_index_1> <item_index_2>
# swap the positions of the specified items on the given list
# sort <list_label>
# sort the given list by deadline
# priority <list_label>
# print the all information for the item at the top of the given list
# print <list_label> <optional_index>
# print all items of the given list if index is not provided
# print the specific item of the given list if index is provided
# quit
# Finish out your application by making it runnable outside of pry. Simply create 
# and #run an instance of TodoBoard at the bottom of todo_board.rb. Then you can 
# execute your app with a simple ruby todo_board.rb from the terminal.

# Here is an example of our final product in action:

# Enter a command: mklist groceries
# Enter a command: mklist tech
# Enter a command: ls
#  groceries
#  tech

# Enter a command: mktodo groceries butter 2019-10-24
# Enter a command: mktodo groceries milk 2019-10-23
# Enter a command: mktodo groceries candy 2019-10-31 sugar-free
# Enter a command: mktodo groceries toothpaste 2019-10-29
# Enter a command: print groceries
# -------------------------------------------------
#                 GROCERIES
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | butter               | 2019-10-24 | [ ]
# 1     | milk                 | 2019-10-23 | [ ]
# 2     | candy                | 2019-10-31 | [ ]
# 3     | toothpaste           | 2019-10-29 | [ ]
# -------------------------------------------------

# Enter a command: print groceries 2
# -------------------------------------------------
# candy                           2019-10-31    [ ]
# sugar-free
# -------------------------------------------------

# Enter a command: mktodo tech ruby 2019-10-24
# Enter a command: mktodo tech rails 2019-11-02
# Enter a command: mktodo tech javascript 2019-11-30
# Enter a command: showall
# -------------------------------------------------
#                 GROCERIES
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | butter               | 2019-10-24 | [ ]
# 1     | milk                 | 2019-10-23 | [ ]
# 2     | candy                | 2019-10-31 | [ ]
# 3     | toothpaste           | 2019-10-29 | [ ]
# -------------------------------------------------
# -------------------------------------------------
#                 TECH
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-10-24 | [ ]
# 1     | rails                | 2019-11-02 | [ ]
# 2     | javascript           | 2019-11-30 | [ ]
# -------------------------------------------------

# Enter a command: toggle groceries 1
# Enter a command: toggle groceries 3
# Enter a command: toggle tech 2
# Enter a command: showall
# -------------------------------------------------
#                 GROCERIES
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | butter               | 2019-10-24 | [ ]
# 1     | milk                 | 2019-10-23 | [✓]
# 2     | candy                | 2019-10-31 | [ ]
# 3     | toothpaste           | 2019-10-29 | [✓]
# -------------------------------------------------
# -------------------------------------------------
#                 TECH
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-10-24 | [ ]
# 1     | rails                | 2019-11-02 | [ ]
# 2     | javascript           | 2019-11-30 | [✓]
# -------------------------------------------------