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

            def initialize
                @lists = Hash.new()
                @lsts = []
            end

# TodoBoard#get_command
# This method should prompt the user to enter a command and perform the 
# appropriate action on the list.

# The entirety of this new feature has to do with how the user interfaces with 
# their many lists, so our only task is to refactor this method. It is quite an 
# interesting refactor though. For our existing commands, the user now needs to 
# specify which list to apply the action to.

            def get_command
                puts "\nEnter a command:"
                cmd, *args = gets.chomp.split(' ')
                lbl = args.slice!(0)

                case cmd

                when 'mklist'
                    list = List.new(lbl)
                    @lsts << list
                    @lists[list.label] = list.items

                when 'ls'
                    puts @lists.keys

                when 'showall'
                    @lsts.each { |ele| ele.print }

                when 'mktodo'
                    @lsts.select { |ele| ele.add_item(*args) if ele.label == lbl }

                when 'up'
                    if args.count == 1
                        @lsts.select { |ele| ele.up(args.first.to_i, 1) if ele.label == lbl }
                    else @lsts.select { |ele| ele.up(args.first.to_i, args.last.to_i) if ele.label == lbl }
                    end

                when 'down'
                    if args.count == 1
                        @lsts.select { |ele| ele.down(args.first.to_i, 1) if ele.label == lbl }
                    else @lsts.select { |ele| ele.down(args.first.to_i, args.last.to_i) if ele.label == lbl }
                    end

                when 'swap'
                    @lsts.select { |ele| ele.swap(args.first.to_i, args.last.to_i) if ele.label == lbl }

                when 'sort'
                    @list.sort_by_date!
                when 'priority'
                    @list.print_priority
                when 'print'
                    if args.empty?
                        @list.print
                    else @list.print_full_item(args.first.to_i)
                    end
                when 'help'
                    puts "\nYou may enter one of the following:\n 
                        mktodo <title> <deadline> <optional description>
                        down <index> <optional amount>
                        up <index> <optional amount>
                        swap <index_1> <index_2>
                        print <optional index>
                        priority
                        sort
                        help
                        quit"
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
                until get_command == false
                    get_command
                end
            end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/TodoBoard