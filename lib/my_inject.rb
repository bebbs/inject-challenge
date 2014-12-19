class Array

  def my_inject(initial = nil)
    copy = self.clone
    memo = (initial ? initial : copy.shift)
    copy.each do |item|
      memo = yield(memo, item)
    end
    memo
  end

end