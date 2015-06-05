require 'test_helper'
require 'fileutils'

class RailsKarmaSprocketsAssetsManagerTest < ActiveSupport::TestCase
  COMPILED_ASSETS_DIR = "#{Rails.root}/tmp/karma".freeze

  test 'compile!' do
    FileUtils.rm_r(COMPILED_ASSETS_DIR) if Dir.exists?(COMPILED_ASSETS_DIR)
    RailsKarmaSprockets.assets.compile!

    assert_equal true, RailsKarmaSprockets.assets.exist?
  end

  test 'destroy!' do
    RailsKarmaSprockets.assets.destroy!

    assert_equal false, RailsKarmaSprockets.assets.exist?
  end

  test 'exist?' do
    FileUtils.rm_r(COMPILED_ASSETS_DIR) if Dir.exists?(COMPILED_ASSETS_DIR)
    RailsKarmaSprockets.assets.compile!

    assert_equal true, RailsKarmaSprockets.assets.exist?
  end
end
