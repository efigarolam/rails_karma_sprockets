require 'singleton'
require 'fileutils'

module RailsKarmaSprockets
  class AssetsManager
    include Singleton

    COMPILED_ASSETS_DIR = "#{Rails.root}/tmp/karma".freeze
    COMPILED_ASSET_PATH = "#{COMPILED_ASSETS_DIR}/compiled_application.js".freeze

    def compile!
      @manifests ||= RailsKarmaSprockets.config.manifests
      compile_manifests
    end

    def destroy!
      FileUtils.rm_r(COMPILED_ASSETS_DIR) if Dir.exists?(COMPILED_ASSETS_DIR)
    end

    def exist?
      File.exists? COMPILED_ASSET_PATH
    end

    private

    def create_compiled_dir
      Dir.mkdir(COMPILED_ASSETS_DIR) unless Dir.exists?(COMPILED_ASSETS_DIR)
    end

    def compile_manifests
      create_compiled_dir
      assets = []

      @manifests.each do |manifest|
        assets << Rails.application.assets.find_asset(manifest.to_s).to_s
      end

      File.write(COMPILED_ASSET_PATH, assets.join)
    end
  end
end
