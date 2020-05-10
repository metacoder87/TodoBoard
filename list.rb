            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/TodoBoard

            require_relative 'item'

class List

# An instance of List may contain many items. To do this, our List will have an 
# underlying array. A list will also have a label.

# List#initialize(label)
# This method should accept a label as an argument and store the label of the 
# list as an instance variable. Also initialize instance variable called items 
# to an empty array. The array will eventually contain instances ofItem.
# List#label
# This method should return the list's label.
# list#label=(new_label)
# This method should set the list's label.

            attr_accessor :label

            def initialize(label)
                @label = label
                @items = []
            end

# List#add_item(title, deadline, description)
# This method should accept a title, deadline, and optional description as 
# arguments. This method should create a new Item with the given information 
# and add it to the end of the items array. When no description is passed in, 
# the new item should have an empty description. If the given deadline is not 
# valid, then no item should be added and the method should return false. If the 
# item is successfully added, then the method should return true. Don't forget 
# to require your 'item.rb' file into 'list.rb'.

            def add_item(title, deadline, description)

            end

# List#size
# This method should return the number of items currently in the list.

            def size

            end

# List#valid_index?(index)
# This method should return a boolean indicating whether or not the given number 
# is a valid position in the list. The first item of the list has index 0, the 
# second item has index 1, and so on. A number is not a valid index if it is 
# negative or too large given the current amount of items in the list.

            def valid_index?(index)

            end

# Here's some food for thought. This method is similar to Item::valid_date?. 
# However, why did we decide to make Item::valid_date? a class method but 
# List#valid_index? an instance method? The reason is that #valid_index? 
# requires knowledge about a specific List instance. That is, an index may be 
# valid or invalid depending on the size of the list it is to be used on. 
# On the flip side, valid_date? does not require any knowledge of a specific Item. 
# That is, we do not need to know any information about any item to know if the 
# date is formatted correctly. Ah, such practical design decisions!

# List#swap(index_1, index_2)
# This method should swap the position of the items at the given indices in the list. 
# If either index is invalid, then don't swap any items and return false. 
# If the indices are valid, then swap the items and return true.

            def swap(index_1, index_2)

            end

# Bracket method for list List#[](index)
# This method should return the item of the list that is stored at the given index. 
# If the index is invalid, then return nil. It is important that we define access 
# to items of the list with a custom bracket method and not expose a reader or 
# writer for the instance variable directly (@items). This is to prevent a user 
# from manually manipulating the list in silly ways, like adding non Item instances
# to the list or having empty entries in the list. We encourage users to only 
# manipulate the list according to the rules and methods that we have defined.

            def [](index)

            end

# List#priority
# This method should return the item at the the top of the list.

            def priority

            end

# List#print_full_item(index)
# This method should print all information for the item at the given index, 
# including the title, deadline, and description. The method should not print 
# anything if the index not valid. Here is how we formatted our output for 
# #print_full_item:

            def print_full_item(index)

            end

# List#print_priority
# The method should print all information for the item at the top of the list.

            def print_priority

            end

# List#up(index, amount)
# This method should move the item at the given index up the list by continually 
# swapping it with the item directly above it the given amount of times. 
# If the given index is not valid, then it should return false without modifying 
# the list. If the index is valid, then it should return true. When the specified 
# item needs to move up further, but is already at the top of the list, then it 
# should remain at the top. If an amount is not passed in, then move the 
# item up 1 position.

            def up(index, amount)

            end

# List#down(index, amount)
# This method should move the item at the given index down the list by continually 
# swapping it with the item directly below it the given amount of times. If the 
# given index is not valid, then it should return false without modifying the list. 
# If the index is valid, then it should should return true. When the specified 
# item needs to move down further, but is already at the bottom of the list, then 
# it should remain at the bottom. If an amount is not passed in, then move the 
# item down 1 position.

            def down(index, amount)

            end

# List#sort_by_date!
# This method should sort the items in the list according to their deadlines. 
# The method should mutate the list's underlying array.

            def sort_by_date!

            end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/TodoBoard