Dir[File.expand_path("../dsl/*", __FILE__)].each(&method(:require))

module Hastings
  # Dsl proxy - runs all scripts via the Dsl
  class Dsl
    def self.call(&block)
      new.instance_eval(&block)
    end
  end
end
