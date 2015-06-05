namespace :karma do
  desc 'Run Karma tests'
  task run: :environment do
    refresh_assets = ENV['refresh_assets'] != 'false'

    if refresh_assets || !RailsKarmaSprockets.assets.exist?
      puts '-- Deleting old compiled assets --'
      RailsKarmaSprockets.assets.destroy!

      puts '-- Compiling assets manifests --'
      RailsKarmaSprockets.assets.compile!
    end

    puts "-- Running Karma with cmd: #{RailsKarmaSprockets.runner.karma_cmd} --"
    RailsKarmaSprockets.runner.execute
  end
end
