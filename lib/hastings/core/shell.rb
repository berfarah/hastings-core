require "shellwords"
require "open3"

module Hastings
  # A class for reliable shell execution with proper errors and recorded
  # +STDOUT+ and +STDIN+.
  class Shell
    # Shell errors
    class Error < StandardError; end

    # @param raise_error [Boolean] determines whether shell scripts fail
    #   with +false+ or by raising {Hastings::Shell::Error}
    def initialize(raise_error: true)
      @raise_error = raise_error
    end

    # @!attribute [r] stdout
    #   @return [String] +STDOUT+ given on shell execution
    # @!attribute [r] stderr
    #   @return [String] +STDERR+ given on shell execution
    # @!attribute [r] status
    #   @return [Fixnum] exit code given on shell execution
    attr_reader :stdout, :stderr, :status

    # Shorthand for {#initialize} with {#run}
    # @param cmd [String] command to be executed
    # @param raise_error [Boolean]
    # @return [String] +STDOUT+ given on shell execution or +STDERR+ if run
    #   with +raise_error: false+
    # @raise [Hastings::Shell::Error] if the exit status isn't +0+
    def self.run(cmd, raise_error: true)
      new(raise_error: raise_error).run(cmd)
    end

    # Executes the given string
    # @param cmd [String] command to be executed via the shell
    # @return [String] +STDOUT+ given on shell execution or +STDERR+ if run
    #   with +raise_error: false+
    # @raise [Hastings::Shell::Error] if the exist status isn't +0+
    def run(cmd)
      @cmd = Shellwords.split(cmd.shellescape)
      shell
    end

    private

      def shell
        Open3.popen3(*@cmd) do |_stdin, stdout, stderr, p|
          @stdout = stdout.read.chomp
          @stderr = stderr.read.chomp
          @status = p.value.exitstatus
        end
        fail_on_error! || return
        @stdout
      end

      def fail_on_error!
        @status == 0 || @raise_error && fail(
          Error, [@cmd.join(" "), @stderr].join("\n"))
      end
  end
end
