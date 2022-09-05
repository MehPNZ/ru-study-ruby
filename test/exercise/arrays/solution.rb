module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array[0]
        count = array.size - 1

        (max_el <=> array[count]) == -1 ? max_el = array[count] : count -= 1 while count != 0

        array.map { |el| el.positive? ? max_el : el }
      end

      def search(array, query)
        arr_sort = array.sort

        iter = lambda { |low, high, mid|
          return -1 if low > high
          return mid if arr_sort[mid] == query

          if query > arr_sort[mid]
            iter.call(mid + 1, high, (low + + high) / 2)
          else
            iter.call(low, mid - 1, (low + high) / 2)
          end
        }
        iter.call(0, array.size - 1, arr_sort.size / 2)
      end
    end
  end
end
