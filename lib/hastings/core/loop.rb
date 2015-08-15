module Hastings
  # A basic loop that coerces given objects into enumerables
  class Loop
    # @param list
    # @param block [Block] code block yielded to enumerator
    def initialize(list, &block)
      @list     = list
      @block    = block
      @enum     = enum
    end

    # Enumerable interface
    # @return [Enumerator] with block
    def each
      enum.each(&@block)
    end

    private

      # We don't need to handle conversion for anything that has an each
      # method. This includes:
      #   Hash, Array, StringIO
      def enum
        @list.respond_to?(:each) ? @list : make_enum
      end

      # Convert non-enumerable objects to enumerables with some assumptions
      def make_enum
        case @list
        # Assume our strings will be either comma or newline separated
        when String then @list.gsub("\n", ",").split ","
        # Assume our user wants a range when passing in numbers
        when Fixnum then 1..@list
        else fail NotImplementedError
        end
      end
  end
end
