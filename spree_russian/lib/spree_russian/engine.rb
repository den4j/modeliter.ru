module SpreeRussian
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_russian'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Time::DATE_FORMATS[:date_time24] = "%d.%m.%Y - %H:%M"
      Time::DATE_FORMATS[:short_date] = "%d.%m.%Y"


    end

    config.to_prepare &method(:activate).to_proc
  end
end
