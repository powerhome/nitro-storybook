module NitroSg
  class Application < Rails::Application
    config.autoload_paths += [config.root.join('app', 'pb_kits')]
    config.action_view.prefix_partial_path_with_controller_namespace = false
  end
end
