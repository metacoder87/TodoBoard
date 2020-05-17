load 'list.rb'
my_list = List.new('Groceries')
my_list.size
my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
my_list.add_item('toothpaste', '2019-10-25')
my_list.add_item('shampoo', '10-24-2019')
my_list.add_item('shampoo', '2019-10-24')
my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
my_list
my_list.size
my_list.priority
my_list.swap(0,  2)
my_list.priority
my_list

my_list.swap(1,  7)
my_list[1]
my_list[3]
my_list.swap(1,  3)
my_list[1]
my_list[3]
my_list.print
my_list.print_full_item(1)
my_list.print_priority
my_list.up(3,2)
my_list.print
my_list.down(0,1)
my_list.print