require 'action_mailer/railtie'
require 'sass-rails'
require 'slim-rails'

module NitroSg
  class Engine < ::Rails::Engine
    isolate_namespace NitroSg

    config.generators do |g|
      g.test_framework :rspec
    end

    config.sass.load_paths ||= []
    config.assets.paths ||= []
    config.assets.paths << "#{Gem.loaded_specs['nitro_sg'].full_gem_path}/fonts"
    config.sass.load_paths << "#{Gem.loaded_specs['nitro_sg'].full_gem_path}/sass-mixins"
    config.sass.load_paths << "#{Gem.loaded_specs['nitro_sg'].full_gem_path}/components"

    initializer "webpacker.proxy" do |app|
        insert_middleware = begin
                            MyEngine.webpacker.config.dev_server.present?
                          rescue
                            nil
                          end
        next unless insert_middleware

        app.middleware.insert_before(
          0, Webpacker::DevServerProxy,
          ssl_verify_none: true,
          webpacker: MyEngine.webpacker
        )

        # ActiveSupport.on_load(:action_controller) do
        #   ActionController::Base.helper Webpacker::React::Helpers
        # end
        #
        # ActiveSupport.on_load :action_view do
        #   include Webpacker::React::Helpers
        # end
      end

      # initializer :webpacker_react do
      #   ActiveSupport.on_load(:action_controller) do
      #     ActionController::Base.helper Webpacker::React::Helpers
      #   end
      #
      #   ActiveSupport.on_load :action_view do
      #     include Webpacker::React::Helpers
      #   end
      # end

      # initializer :webpacker_react_renderer, group: :all do |_app|
      #   ActionController::Renderers.add :react_component do |component_name, options|
      #     props = options.fetch(:props, {})
      #     tag_options = options.fetch(:tag_options, {})
      #     html = Webpacker::React::Component.new(component_name).render(props, tag_options)
      #     render_options = options.merge(inline: html)
      #     render(render_options)
      #   end
      # end
  end
end
