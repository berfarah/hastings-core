module Hastings
  class Dsl
    class MetaProxy
      attr_reader :meta

      def initialize(&block)
        @meta = Meta.new
        instance_eval(&block)
        meta.freeze
      end

      def method_missing(method, *args, &block)
        @meta.send("#{method}=", *args, &block)
      end
    end
  end
end
