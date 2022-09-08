module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array[0]
        array.each { |el| max_el = el if (max_el <=> el) == -1 }
             .map { |el| el.positive? ? max_el : el }
      end

      def search(array, query, left = 0, right = array.size - 1)
        return -1 if (left > right) || array.empty?

        mid = (left + right) / 2
        return mid if query == array[mid]

        if query > array[mid]
          search(array, query, mid + 1, right)
        else
          search(array, query, left, mid - 1)
        end
      end
    end
  end
end
