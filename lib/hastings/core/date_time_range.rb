module Hastings
  # Range to be used in conjunction with searches
  # Class must consistently use either Date or Time
  class DateTimeRange
    attr_accessor :start, :end

    # @param start_date [Date|Time]
    # @param end_date [Date|Time]
    def initialize(start, ended)
      self.start = start
      self.end   = ended
    end

    # Span of time in the range
    # @return [Fixnum]
    def span
      self.end - start
    end

    # Returns whether a date is in a date range
    # @param date_time [Date|Time]
    # @return [Boolean]
    def include?(date_time)
      (start..self.end).cover?(date_time)
    end
  end
end
