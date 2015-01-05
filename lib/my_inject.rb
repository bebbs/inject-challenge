class Array

  # Recursive inject method
  def my_rec_inject(*args, &block)
    arr = self.dup
    temp, next_value = arr.shift, 0 if symbol_or_empty?(args)
    temp, next_value = args[0], 0 if not_symbol_or_empty?(args)
    args.map{|arg| block = arg.to_proc if arg.is_a?(Symbol)}
    
    return temp if arr.empty?
    block_result = block.call(temp, arr[next_value])
    arr.drop(1).my_rec_inject(block_result, args, &block)
  end

  # Iterative inject method
  def my_itr_inject(*args, &block)
    arr = self.dup
    temp = self[0] if symbol_or_empty?(args)
    temp = args[0] if not_symbol_or_empty?(args)
    args.map{|arg| block = arg.to_proc if arg.is_a?(Symbol)}

    arr.shift if symbol_or_empty?(args)
    arr.each {|x| temp = block.call temp, x}
    temp
  end
end

def symbol_or_empty?(args)
  args[0].is_a?(Symbol) || args.empty?
end

def not_symbol_or_empty?(args)
  !args[0].is_a?(Symbol) && !args[0].nil?
end