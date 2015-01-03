class Array

  # Recursive inject method
  def my_rec_inject(*args, &block)
    arr = self.dup
    temp, next_value = arr.shift, 0 if args[0].is_a?(Symbol) || args.empty?
    temp, next_value = args[0], 0 if !args[0].is_a?(Symbol) && !args[0].nil?
    args.map{|arg| block = arg.to_proc if arg.is_a?(Symbol)}
    return temp if arr.empty?

    block_result = block.call temp, arr[next_value]

    arr.drop(1).my_rec_inject(block_result, args, &block)
  end

  # Iterative inject method
  def my_itr_inject(*args, &block)
    arr = self.dup
    temp = self[0] if args[0].is_a?(Symbol) || args.empty?
    temp = args[0] if !args[0].is_a?(Symbol) && !args[0].nil?
    args.map{|arg| block = arg.to_proc if arg.is_a?(Symbol)}
  end
end