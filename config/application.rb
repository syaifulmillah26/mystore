require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyStore
  class Application < Rails::Application
    # Load application's model / class decorators
    # initializer 'spree.decorators' do |app|
    #   config.to_prepare do
    #     Dir.glob(Rails.root.join('app/**/*_decorator*.rb')) do |path|
    #       require_dependency(path)
    #     end
    #   end
    # end
    # Load application's model / class decorators
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Dir.glob(File.join(File.dirname(__FILE__), "../app/lib/views/frontend/spree/*.text.erb")) do |c|
      #   Rails.configuration.cache_classes ? require(c) : load(c)
      # end

    end
    # initializer 'spree.decorators' do |app|
    #   config.to_prepare do
    #     Dir.glob(Rails.root.join('app/**/*_decorator*.rb')) do |path|
    #       require_dependency(path)
    #     end
    #   end
    # end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
