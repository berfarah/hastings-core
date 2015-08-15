require "hastings/dsl"

module Hastings
  # Assign things
  class Script
    Meta = OpenStruct.new do
      def run_at=(date_time)
        super DateTime.parse(date_time)
      end

      def run=(&block)
        super(&block)
      end
    end

    attr_reader :meta

    def initialize(&block)
      @meta = Meta.new
      instance_eval(&block)
      @meta.freeze
    end

    def execute
      Dsl.new(&@meta.run)
    end

    def method_missing(method, *args)
      if [:name, :description, :run_every, :run_at, :run].include? method
        @meta.send("#{method}=", *args)
      else super
      end
    end
  end
end
