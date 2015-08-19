require "active_support"
require "active_support/core_ext"
Dir[File.expand_path("../core/*", __FILE__)].each(&method(:require))
require "hastings/dsl"

module Hastings
  extend Hastings::Environment
end
