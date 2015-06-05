require 'singleton'

module RailsKarmaSprockets
  class Runner
    include Singleton

    def execute
      IO.popen(karma_cmd).each do |line|
        puts line.chomp
      end
    end

    def karma_cmd
      opts = RailsKarmaSprockets.config.karma[:opts]

      if opts
        RailsKarmaSprockets.config.karma[:cmd] + ' ' + opts
      else
        RailsKarmaSprockets.config.karma[:cmd]
      end
    end
  end
end
