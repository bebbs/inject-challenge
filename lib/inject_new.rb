class Array

  def my_inject(initial = 0)
    copy = self.clone
    if initial
      memo = initial 
    else
      memo = 0
    end

    copy.each do |item|
      memo = yield memo, item
    end
    memo
  end
end