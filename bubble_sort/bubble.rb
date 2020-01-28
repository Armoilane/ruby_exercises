a = [4,3,78,2,0,2]

def bubble_sort(arr)
  n = arr.length
  until n <= 1 do
    newn ||= 0
    i = 1
    while i < n do 
      if arr[i-1] > arr[i]
        arr[i-1], arr[i] = arr[i], arr[i-1]
        newn = i
      end
      i += 1
    end
    n = newn
  end
end
      
bubble_sort(a)

p a
