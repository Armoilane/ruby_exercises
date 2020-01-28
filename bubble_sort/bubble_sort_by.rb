# This first version I did on my own for numbers, because I couldn't 
# wrap my head around the yield. Such brainfog those days. 
# Made it yield something though.

a = [4,3,78,2,0,2]

def bubble_sort_by(arr)
  n = arr.length
  until n <= 1 do
    newn ||= 0
    i = 1
    while i < n do 
      j = i - 1
      if arr[j] > arr[i]
        yield(arr,i,j)
        newn = i
      end
      i += 1
    end
    n = newn
  end
end

bubble_sort_by(a) { |a, i, j| a[j], a[i] = a[i], a[j] }

p a

# This second version is a copy from another students solution.
# I typed this in to get a better understanding of how it should've
# been done and how it works.

def bubble_sort_by(arr)
  n = arr.length
  (n-1).times do
    switched = false
    (n-1).times do |i|
      if yield( arr[i], arr[i+1] ) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        switched = true
      end
    end
    break unless switched
    n -= 1 
  end
  return arr

end

p bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length }

