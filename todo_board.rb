            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/TodoBoard

require_relative 'list'

class TodoBoard

# This is where things comes together. The TodoBoard class will be responsible 
# for receiving user input and performing the correct action on the stored list. 
# In this phase of the app, the board will only manage a single list. 
# Because of this, you may find it trivial to implement these board methods since 
# they simply delegate responsibility to the list methods. We design it in this 
# way in order to have an extensible class that we can easily refactor for 
# more features in phase two.

# You should be using many List methods in the following steps. 
# There is a method to the madness!

# TodoBoard#initialize(label)
# For now, a TodoBoard will only need create a single List with the given label 
# and store it as an instance variable.

            def initialize(label)
                @list = List.new(label)
            end

# TodoBoard#get_command
# This method should prompt the user to enter a command and perform the 
# appropriate action on the list.

            def get_command
                puts "\nEnter a command:"
                cmd, *args = gets.chomp.split(' ')

                case cmd
                when 'mktodo'
                    @list.add_item(*args)
                when 'up'
                    if args.count == 1
                        @list.up(args.first.to_i, 1)
                    else @list.up(args.first.to_i, args.last.to_i)
                    end
                when 'down'
                    if args.count == 1
                        @list.down(args.first.to_i, 1)
                    else @list.down(args.first.to_i, args.last.to_i)
                    end
                when 'quit'
                    return false
                else
                    puts "\nSorry, that command is not recognized."
                end
                true
            end

# TodoBoard#run
# This method will contain our main loop that will keep prompting the user until 
# #get_command returns false.

            def run

            end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/TodoBoard