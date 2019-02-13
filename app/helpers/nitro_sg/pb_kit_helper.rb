require "webpacker/react/railtie" if defined?(Rails)
require "webpacker/react/helpers"
require "webpacker/react/component"

module NitroSg
  module PbKitHelper
    #------ Render UI
    def pb_rails(name, props: {}, &block)
      render_component(name, { props: props }, &block)
    end

    def pb_rails_with_props(name, props: {}, &block)
      render_props(name, { props: props }, &block)
    end

    def pb_react(component_name, props = {}, options = {})
      render_react_component(component_name, props[:props], options)
    end

    def pb_react_with_props(component_name, props = {}, options = {})
      render_react_props(component_name, props[:props], options)
    end

    #------ Render Code Snippets
    def pb_rails_snippet(component_name, component_props)
      if( !component_props[:props].nil? && !component_props[:props].empty? )
        props = raw(component_props[:props].to_json)
      else
        props = ""
      end
      return raw rouge("<%= pb_rails(\"#{component_name}\", props: #{props}) %>", "erb");
    end

    def pb_react_snippet(component_name, component_props)
      if( !component_props.nil? && !component_props.empty? )
        props = raw(component_props.to_json)
      else
        props = ""
      end
      return raw rouge("<%= pb_react(\"#{component_name}\", props: #{props}) %>", "erb")
    end

    #------ Render UI Story
    def pb_kit_rails(kit)
      pp kit
      render(partial: "pb_#{kit}/#{kit}_story_rails")
    end

    def pb_kit_react(kit)
      render(partial: "pb_#{kit}/#{kit}_story_react")
    end

    # Index Kits showing story
    def pb_kits
      display_kits = []
      MENU["kits"].sort.each do |kit|
        title = render :inline => "<h2><a href='#{kit_show_path(kit)}'>#{pb_rails(:heading, props: { text: pb_title(kit), tag: 'h3', size: '2' })}</a></h2>"
        ui = pb_kit_rails(kit)
        display_kits << title+ui
      end
      raw("<div class='pb--docItem'>"+display_kits.map { |k| k }.join("</div><div class='pb--docItem'>")+"</div>")
    end

    def pb_title(title)
      title.remove('pb_').titleize.tr("_", " ")
    end

  private

    #------ Render Rails UI Kit
    def render_component(name, locals, &block)
      if( !name.match(/[\/\\]/) )
        ui_name = "pb_#{name}/#{name}"
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
      if( defined?(locals[:props][:show_props]) && locals[:props][:show_props] )
        locals[:props].delete(:show_props)
        code = render 'config/ui/codeCopyRails', component_name: name, component_props: locals
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
      ui = ::Webpacker::React::Component.new(component_name.camelize).render(props, options)
      if( defined?(props[:show_props]) && props[:show_props] )
        props.delete(:show_props)
        code = render 'config/ui/codeCopyReact', component_name: component_name, component_props: props
      else
        ui
      end
    end

    def render_react_props(component_name, props, options)
      props.delete(:show_props)
      render 'config/ui/propsReactTable', component_name: component_name, component_props: {props: props}
    end

  end
end
