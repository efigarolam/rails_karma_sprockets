require 'test_helper'

class RailsKarmaSprocketsTest < ActiveSupport::TestCase
  test 'is a Module' do
    assert_kind_of Module, RailsKarmaSprockets
  end

  test 'configure sets configuration properties' do
    karma_conf = {
      cmd: './node_modules/karma/bin/karma',
      opts: '--single-run=false'
    }

    assert_equal [:application, :dashboard], RailsKarmaSprockets.config.manifests
    assert_equal karma_conf, RailsKarmaSprockets.config.karma
  end

  test 'manifests returns RailsKarmaSprockets::Configuration.manifests' do
    assert_equal [:application, :dashboard], RailsKarmaSprockets.manifests
  end

  test 'runner is instance of RailsKarmaSprockets::Runner' do
    assert_kind_of RailsKarmaSprockets::Runner, RailsKarmaSprockets.runner
  end

  test 'assets is instance of RailsKarmaSprockets::AssetsManager' do
    assert_kind_of RailsKarmaSprockets::AssetsManager, RailsKarmaSprockets.assets
  end
end
