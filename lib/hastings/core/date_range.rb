module Hastings
  # Date range to be used in conjunction with searches
  class DateRange
    # @param start_date [Date]
    # @param end_date [Date]
    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date   = end_date
    end

    # Returns whether a date is in a date range
    # @param date [Date]
    # @return [Boolean]
    def include?(date)
      (@start_date..@end_date).cover?(date)
    end
  end
end
