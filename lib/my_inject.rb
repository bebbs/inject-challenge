class Array

  def my_inject(*args)
    copy = self.clone
    if args[0].is_a? Symbol || !args.any?
      memo = (initial ? initial : copy.shift)
      copy.each do |item|
        memo = yield(memo, item)
      end
    end
    memo
  end

end