            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/TodoBoard


class Item

# Item::valid_date?(date_string)
# This method should accept a string and return a boolean indicating if it is 
# valid date of the form YYYY-MM-DD where Y, M, and D are numbers, such as 
# 1912-06-23. The month should be a number from 1 to 12 and the day should be 
# a number from 1 to 31.

            def self.valid_date?(date_string)
                chunks = date_string.split('-')
                if (1900...2021).include?(chunks[0].to_i) && (01..12).include?(chunks[1].to_i) && (01..31).include?(chunks[2].to_i)
                    return true
                else false
                end
            end

# Item#initialize(title, deadline, description)
# This method should accept a title, deadline, and a description as arguments. 
# These three pieces of data should be stored as instance variables of an Item. 
# If the deadline is not a valid date, raise an error.
# Item#title
# This method should return the item's title.
# Item#title=(new_title)
# This method should set the item's title.
# Item#deadline
# This method should return the item's deadline.
# Item#description
# This method should return the item's description.
# Item#description=(new_description)
# This method should set the item's description.

# Refactor this existing method to also initialize a boolean instance variable to 
# track whether or not the item is "done". An item should be not "done" by default.

            attr_accessor :title, :description, :deadline, :done

            def initialize(title, deadline, description)
                @title = title
                @description = description
                if self.class.valid_date?(deadline)
                    @deadline = deadline
                else raise "Invalid date format, please enter YYYY-MM-DD."
                end
                @done = false
            end
            
            end     

# Item#deadline=(new_deadline)
# This method should set the item's deadline. However, if the new deadline is not 
# a valid date, then it should raise an error and not change the deadline.

            def deadline=(new_deadline)
                if valid_date?(new_deadline)
                    @deadline = new_deadline
                else raise "Invalid date format, please enter YYYY-MM-DD."
                end   
            end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/TodoBoard