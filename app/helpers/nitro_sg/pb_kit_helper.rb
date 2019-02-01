require "webpacker/react/railtie" if defined?(Rails)
require "webpacker/react/helpers"
require "webpacker/react/component"

module NitroSg
  module PbKitHelper
    #------ Render UI
    def pb_rails(name, data: {}, &block)
      render_component("#{name}/#{name}", { data: data }, &block)
    end

    def pb_rails_with_props(name, data: {}, &block)
      render_props(name, { data: data }, &block)
    end

    def pb_react(component_name, props = {}, options = {})
      render_react_component(component_name, props, options)
    end

    def pb_react_with_props(component_name, props = {}, options = {})
      render_react_props(component_name, props, options)
    end

    #------ Render UI Story
    def pb_kit(kit)
      render(partial: "#{kit}/#{kit}Story")
    end

    def pb_kits
      display_kits = []
      MENU["kits"].sort.each do |kit|
        title = render :inline => "<h2><a href='#{kit_show_path(kit)}'>#{kit}</a></h2>"
        ui = render(partial: "#{kit}/#{kit}Story")
        display_kits << title+ui
      end
      raw(display_kits.map { |k| k }.join(" "))
    end

  private

    #------ Render Rails UI Kit
    def render_component(name, locals, &block)
      if block_given?
        ui = render layout: name, locals: locals, &block
        render_props_table(ui, locals)
      else
        ui = render partial: name, locals: locals
        render_props_table(ui, locals)
      end
    end

    def render_props_table(ui, locals)
      if( defined?(locals[:data][:show_props]) && locals[:data][:show_props] )
        props = render 'config/ui/propsTableSimple', component_props: locals
        ui+props
      else
        ui
      end
    end

    def render_props(name, locals, &block)
      locals.delete(:show_props)
      render 'config/ui/propsRailsTable', component_name: name, component_props: locals
    end

    #------ Render React UI Kit
    def render_react_component(component_name, props, options)
      ui = ::Webpacker::React::Component.new(component_name).render(props, options)
      if( defined?(props[:show_props]) && props[:show_props] )
        propsTable = render 'config/ui/propsTableSimple', component_props: {data: props}
        ui+propsTable
      else
        ui
      end
    end

    def render_react_props(component_name, props, options)
      props.delete(:show_props)
      render 'config/ui/propsReactTable', component_name: component_name, component_props: {data: props}
    end

  end
end
