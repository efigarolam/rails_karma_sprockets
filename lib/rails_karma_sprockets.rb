module RailsKarmaSprockets
  extend self

  require "rails_karma_sprockets/railtie" if defined?(Rails)
  autoload :Configuration, 'rails_karma_sprockets/configuration'
  autoload :Runner,        'rails_karma_sprockets/runner'
  autoload :AssetsManager,        'rails_karma_sprockets/assets_manager'

  delegate :manifests, to: :configuration

  def configure
    yield configuration
  end

  def configuration
    Configuration.instance
  end

  def runner
    Runner.instance
  end

  def assets
    AssetsManager.instance
  end

  alias_method :config, :configuration
end
