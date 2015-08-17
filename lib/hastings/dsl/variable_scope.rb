require "ostruct"

module Hastings
  class Dsl
    # Scopes variables locally by use of "var"
    module VariableScope
      attr_reader :var

      def initialize
        @var = OpenStruct.new
        super()
      end
    end

    include VariableScope
  end
end
