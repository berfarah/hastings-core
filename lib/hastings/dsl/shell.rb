module Hastings
  class Dsl
    # Shell execution of code
    module Shell
      def shell(*cmd)
        run cmd
      end

      def safe_shell(*cmd)
        run cmd, raise_error: false
      end

      private

        def run(cmd, **args)
          Hastings::Shell.run(cmd.join(" "), **args)
        end
    end

    include Shell
  end
end
