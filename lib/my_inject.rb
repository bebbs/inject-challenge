class Array

  # Recursive inject method
  def my_rec_inject(*args, &block)
    arr = self.dup
    memo = symbol_or_empty?(args) ? arr.shift : args[0]

    args.map{|arg| block = arg.to_proc if arg.is_a?(Symbol)}
    
    return memo if arr.empty?
    block_result = block.call(memo, arr.first)
    arr.drop(1).my_rec_inject(block_result, args, &block)
  end

  # Iterative inject method
  def my_itr_inject(*args, &block)
    arr = self.dup
    memo = symbol_or_empty?(args) ? arr.shift : args[0]

    if symbol = args.find{|arg| arg.is_a?(Symbol)} 
      block = symbol.to_proc 
    end

    arr.each {|x| memo = block.call memo, x}
    memo
  end

  def symbol_or_empty?(args)
    args[0].is_a?(Symbol) || args.empty?
  end

end
