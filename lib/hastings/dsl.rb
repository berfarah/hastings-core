Dir[File.expand_path("../dsl/*", __FILE__)].each(&method(:require))

module Hastings
  # Dsl proxy - runs all scripts via the Dsl
  class Dsl
    attr_reader :meta

    def initialize(&block)
      @meta = MetaProxy.new(&block).meta
    end

    def run
      instance_eval(&meta.run)
    end
  end

  def self.new(&block)
    Dsl.new(&block)
  end
end
