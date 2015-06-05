module RailsKarmaSprockets
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'rails_karma_sprockets/tasks'
    end
  end
end
