require "webpacker/react/railtie" if defined?(Rails)
require "webpacker/react/helpers"
require "webpacker/react/component"

module NitroSg

  module PbKitHelper
    #------ Render Kits by Helper
    def pb_rails(kit, props:{}, &block)
      kit_class_name = kit.to_s.tr(" ", "_").camelize
      kit_class_obj = "NitroSg::Pb#{kit_class_name}::#{kit_class_name}".safe_constantize

      code = render(partial: "nitro_sg/config/ui/codeCopyRails", locals: {component_name: kit, component_props: props})

      if kit_class_obj && kit_class_obj.class == Class
        ui = render(partial: kit_class_obj.new(**props, &block), as: :object)
      else
        ui = render_component(kit, { props: props }, &block)
      end

      if ( defined?(@kit) && kit == @kit )
        ui+code
      else
        ui
      end
    end

    def pb_react(kit, props:{}, options:{})
      ui = ::Webpacker::React::Component.new(kit.camelize).render(props, options)
      code = render(partial: "nitro_sg/config/ui/codeCopyReact", locals: {component_name: kit, component_props: props})

      if ( defined?(@kit) && kit == @kit )
        ui+code
      else
        ui
      end
    end

    #------ Render Code Snippets
    def pb_rails_snippet(component_name, component_props)
      if( !component_props.nil? && !component_props.empty? )
        props = raw(component_props.to_json)
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

    def pb_react_snippet_standard(component_name, component_props)
      if( !component_props.nil? && !component_props.empty? )
        output = ""
        component_props.each do |key, value|
          output += "#{key}=\"#{value}\" "
        end
        props = raw(output)
      else
        props = ""
      end
      return raw rouge("<#{component_name.camelize} #{props} />", "html")
    end

    #------ Render UI Story
    def pb_kit_rails(kit)
      render(partial: "nitro_sg/pb_#{kit}/#{kit}_story_rails")
    end

    def pb_kit_react(kit)
      render(partial: "nitro_sg/pb_#{kit}/#{kit}_story_react")
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
        ui_name = "nitro_sg/pb_#{name}/#{name}"
      else
        ui_name = "nitro_sg/#{name}"
      end
      if block_given?
        ui = render layout: ui_name, locals: locals, &block
        # render_props_table(name, ui, locals)
      else
        ui = render partial: ui_name, locals: locals
        # render_props_table(name, ui, locals)
      end
    end

    # def render_props_table(name, ui, locals)
    #   if( defined?(locals[:props][:show_props]) && locals[:props][:show_props] )
    #     locals[:props].delete(:show_props)
    #     code = render 'nitro_sg/config/ui/codeCopyRails', component_name: name, component_props: locals
    #   else
    #     ui
    #   end
    # end

    # def render_props(name, locals, &block)
    #   locals.delete(:show_props)
    #   render 'nitro_sg/config/ui/propsRailsTable', component_name: name, component_props: locals
    # end

    #------ Render React UI Kit
    # def render_react_component(component_name, props, options)
    #   ui = ::Webpacker::React::Component.new(component_name.camelize).render(props, options)
    #   # if( defined?(props[:show_props]) && props[:show_props] )
    #   #   props.delete(:show_props)
    #   #   code = render 'nitro_sg/config/ui/codeCopyReact', component_name: component_name, component_props: props
    #   # else
    #   #   ui
    #   # end
    # end

    # def render_react_props(component_name, props, options)
    #   props.delete(:show_props)
    #   render 'nitro_sg/config/ui/propsReactTable', component_name: component_name, component_props: {props: props}
    # end

  end
end
