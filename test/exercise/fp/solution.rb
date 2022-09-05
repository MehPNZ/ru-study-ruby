module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        arr_filter_rating = array
                            .select { |el| el['rating_kinopoisk'] != '0' && !el['rating_kinopoisk'].nil? }
                            .select { |el| !el['country'].nil? && el['country'].include?(',') }

        arr_filter_rating.reduce(0) { |acc, el| acc + el['rating_kinopoisk'].to_f } / arr_filter_rating.size
      end

      def chars_count(films, threshold)
        films.select { |el| el['rating_kinopoisk'].to_f >= threshold }
             .map { |el| { 'name' => el['name'] } }
             .reduce(0) { |acc, el| acc + el['name'].count('и') }
      end
    end
  end
end
