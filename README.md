Inject Challenge
================

An exercise in rewriting core Ruby kernel methods. The inject method is used to reduce the numbers in an array, by passing it either:

* A block to simply perform an operation to combine the numbers within the array, for example:
`[1,2,3,4].inject {|memo, item| memo = memo + item}`
* An argument to start the operation from the number within the argument, for example: 
`[1,2,3,4].inject(10) {|memo, item| memo = memo + item}`
* A symbol as an argument, as shorthand for passing it a block, for example: 
`[1,2,3,4].inject(:*)`

##Solution
I've replicated the behaviour of the inject method using both recursion and iteration. The solution is fully tested using RSpec to ensure all edge cases are covered, and include expectations of the built in Ruby inject method for reference and comparison.


