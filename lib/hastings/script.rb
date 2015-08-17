require "virtus"
require "hastings/dsl"

module Hastings
  # Assign things
  class Script
    # A holder for our data
    class Meta
      include Virtus.model
      attribute :name, String
      attribute :description, String, default: ""
      attribute :run_every, Integer, default: 0
      attribute :run_at, DateTime

      attr_reader :run
      def run=(&block)
        @run = block
      end
    end

    attr_reader :meta

    def initialize(&block)
      @meta = Meta.new
      instance_eval(&block)
      meta.freeze
    end

    def call
      Dsl.call(&meta.run)
    end

    def method_missing(method, *args, &block)
      meta.send("#{method}=", *args, &block)
    end
  end
end
