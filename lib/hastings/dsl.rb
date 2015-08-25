require_relative "dsl/meta_proxy"

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
end
