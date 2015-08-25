require_relative "dsl"

# Extends Hastings module with script method
module Hastings
  def self.script(&block)
    Scripts.add(&block)
  end

  # A place to save our script DSLs
  module Scripts
    module_function

    def scripts
      @arr ||= []
    end

    def meta
      scripts.map(&:meta)
    end

    def run
      scripts.all?(&:run)
    end

    def add(&block)
      scripts << Dsl.new(&block)
    end
  end
end
