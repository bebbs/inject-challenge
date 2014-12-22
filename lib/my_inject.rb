class Array

  def my_inject(*args, &block)
    arr = self.dup
    temp, next_value = arr.shift, 0 if args[0].is_a?(Symbol) || args.empty?
    temp, next_value = args[0], 0 if !args[0].is_a?(Symbol) && !args[0].nil?
    args.map{ |arg| block = arg.to_proc if arg.is_a?(Symbol) }
    return temp if arr.empty?

    temp = block.call temp, arr[next_value]

    arr.drop(1).my_inject(temp, args, &block)
  end
end