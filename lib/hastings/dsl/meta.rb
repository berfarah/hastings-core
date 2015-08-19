require "virtus"

module Hastings
  class Dsl
    # A holder for our data
    class Meta
      include Virtus.model
      attribute :name, ::String
      attribute :description, ::String, default: ""
      attribute :run_every, ::Integer, default: 0
      attribute :run_at, ::DateTime

      attr_reader :run
      def run=(&block)
        @run = block
      end
    end
  end
end
