module Hastings
  class Dsl
    # Coercions into date, time, DateRange and TimeRange
    module DateTime
      def date(date_str = nil, format = nil)
        date_str ? parse(Date, date_str, format) : Date
      end

      def date_range(from, to)
        DateTimeRange.new date(from), date(to)
      end

      def time(time_str, format = nil)
        time_str ? parse(Time, time_str, format) : Time
      end

      def time_range(from, to)
        DateTimeRange.new time(from), time(to)
      end

      private

        def parse(klass, str, format = nil)
          format ? klass.strptime(str, format) : klass.parse(String(str))
        end
    end

    include DateTime
  end
end
