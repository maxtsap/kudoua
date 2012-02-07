require 'refinery'

module Refinery
  module Banners

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.url = {:controller => '/admin/banners', :action => 'index'}
          plugin.name = "banners"
          plugin.pathname = root
          plugin.activity = {
            :class => Banner,
            :title => 'link'
          }
        end
      end
    end
  end
end
