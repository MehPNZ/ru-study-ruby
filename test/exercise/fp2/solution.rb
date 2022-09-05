module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in self do
          yield i
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |elem| result << yield(elem) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_map { |el| result << el unless el.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc.nil?
          acc = self[0]
          MyArray.new(self[1..size - 1]).my_map { |el| acc = yield acc, el }
        else
          my_map { |el| acc = yield acc, el }
        end
        acc
      end
    end
  end
end
