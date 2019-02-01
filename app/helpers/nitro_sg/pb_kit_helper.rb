require "webpacker/react/railtie" if defined?(Rails)
require "webpacker/react/helpers"
require "webpacker/react/component"

module NitroSg
  module PbKitHelper
    #------ Render UI
    def pb_rails(name, data: {}, &block)
      render_component(name, { data: data }, &block)
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

    # Index Kits showing Rails only
    def pb_kits
      display_kits = []
      MENU["kits"].sort.each do |kit|
        title = render :inline => "<h2><a href='#{kit_show_path(kit)}'>#{kit}</a></h2>"
        ui = render(partial: "#{kit}/#{kit}")
        display_kits << title+ui
      end
      raw("<div class='pb--docItem'>"+display_kits.map { |k| k }.join("</div><div class='pb--docItem'>")+"</div>")
    end

    # Index Kits showing story
    # def pb_kits
    #   display_kits = []
    #   MENU["kits"].sort.each do |kit|
    #     title = render :inline => "<h2><a href='#{kit_show_path(kit)}'>#{kit}</a></h2>"
    #     ui = render(partial: "#{kit}/#{kit}Story")
    #     display_kits << title+ui
    #   end
    #   raw(display_kits.map { |k| k }.join(" "))
    # end

  private

    #------ Render Rails UI Kit
    def render_component(name, locals, &block)
      if( !name.match(/[\/\\]/) )
        ui_name = "#{name}/#{name}"
      else
        ui_name = name
      end
      if block_given?
        ui = render layout: ui_name, locals: locals, &block
        render_props_table(name, ui, locals)
      else
        ui = render partial: ui_name, locals: locals
        render_props_table(name, ui, locals)
      end
    end

    def render_props_table(name, ui, locals)
      if( defined?(locals[:data][:show_props]) && locals[:data][:show_props] )
        locals[:data].delete(:show_props)
        code = render 'config/ui/codeCopyRails', component_name: name, component_props: locals
        props = render 'config/ui/propsTableSimple', component_props: locals
        ui+code+props
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
        props.delete(:show_props)
        code = render 'config/ui/codeCopyReact', component_name: component_name, component_props: props
        propsTable = render 'config/ui/propsTableSimple', component_props: {data: props}
        ui+code+propsTable
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
