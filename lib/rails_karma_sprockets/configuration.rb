require 'singleton'

module RailsKarmaSprockets
  class Configuration
    include Singleton

    DEFAULT_KARMA_CONFIG = {
      cmd: './node_modules/karma/bin/karma start',
      opts: '--single-run=true'
    }

    attr_reader :karma

    def initialize
      @karma = DEFAULT_KARMA_CONFIG
    end

    def manifests(*args)
      @manifests ||= args
    end

    def karma=(config = {})
      @karma = DEFAULT_KARMA_CONFIG.merge(config)
    end
  end
end
