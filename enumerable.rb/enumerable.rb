# require "myscript"
# load "myscript.rb" to reload after changes to file

module Enumerable
  
  def my_each
    if block_given?
      for i in self do
        yield(i)
      end
      self
    else
      to_enum(__method__)
    end
  end

  def my_each_with_index
    if block_given?
      idx = 0
      self.my_each do |i|
        yield(i, idx)
        idx+=1
      end
      self
    else
      to_enum(__method__)
    end
  end

  def my_select
    output = []
    my_each do |i|
      output.push(i) if yield i
    end
    output
  end

  def my_all?
    ret = true
    my_each do |i|
      ret = false unless yield i
    end
    ret
  end

  def my_any?
    ret = false 
    my_each do |i|
      ret = true if yield i
    end
    ret
  end

  def my_none?
    ret = true
    my_each do |i|
      ret = false if yield i
    end
    ret
  end

  def my_count 
    return self.length unless block_given?
    count = 0
    my_each do |i|
      count += 1 if yield i
    end
    count
  end

  def my_map(procedure=nil)
    ret = []
    if procedure.nil?
      my_each do |i|
        ret.push(yield(i))
      end
    else 
      my_each do |i|
        ret.push(procedure.call(i))
      end
    end
    ret
  end

  def my_inject(value=nil)
    if value == nil
      value = self[0]
      index = 1
    else
      index = 0
    end

    for i in index...self.length
      value = yield(value, self[i])
    end
    value
  end

end

def multiply_els(arr)
  arr.my_inject {|value, i| value * i }
end

a = [1,2,3,4,5]

a.my_each { |i| puts i * 2 }
a.my_each_with_index { |i, index| puts i * 2 if (index % 2) == 1 }
p a.my_select { |i| i.odd? }
p a.my_all? { |i| i > 2 }
p a.my_any? { |i| i != 2 }
p a.my_none? { |i| i != 2 }
p a.my_count
p a.my_map {|i| i + 2 }
procedure = Proc.new { |i| i**3 }
p a.my_map(procedure)
p a.my_inject{ |value, index| value * index }
p a.my_inject(2) { |value, index| value * index }
p multiply_els(a)