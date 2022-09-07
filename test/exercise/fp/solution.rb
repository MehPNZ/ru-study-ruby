module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def rating(array)
        arr_filter_rating = array.map do |film|
          film['rating_kinopoisk'].to_f if film['rating_kinopoisk'].to_f.positive? && !film['country'].nil? && film['country'].rstrip.split(',').size > 1
        end.compact

        arr_filter_rating.reduce(0) { |acc, el| acc + el } / arr_filter_rating.size
      end

      # Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению
      def chars_count(films, threshold)
        films.map { |film| film['name'] if film['rating_kinopoisk'].to_f >= threshold }
             .compact
             .reduce(0) { |acc, el| acc + el.count('и') }
      end
    end
  end
end
