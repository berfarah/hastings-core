module Hastings
  # Running environment for Hastings. We run our app out of /var/tmp/hastings
  # to preserve tmp files between reboots. This is the directory at which
  # our working files (and mounted directories) are saved
  module Environment
    # @return [String] Working directory
    def pwd
      @pwd ||= Dir.pwd
    end

    # @return [String] Root Hastings working directory
    def root
      @root ||= FileUtils.mkdir_p("/var/tmp/hastings") && "/var/tmp/hastings"
    end
  end
end
