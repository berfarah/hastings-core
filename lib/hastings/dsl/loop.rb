module Hastings
  class Dsl
    # Hastings loops
    module Loop
      def loop(list, &block)
        Hastings::Loop.new(list, &block).each
      end
    end

    include Loop
  end
end
