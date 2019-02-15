require "webpacker/react/railtie" if defined?(Rails)
require "webpacker/react/helpers"
require "webpacker/react/component"
require "json"

module NitroSg
  module PbKitHelper
    #------ Render Kits by Helper
    def pb_rails(kit, props:{}, &block)
      render_rails(kit, props, &block)
    end

    def pb_rails_nested(kit, props:{}, &block)
      render_rails(kit, props, &block)
    end

    def pb_rails_with_docs(kit, props:{}, &block)
      ui = render_rails(kit, props, &block)
      docs = render_rails_docs(kit, props, &block)
      ui+docs
    end

    def pb_react(kit, props:{}, options:{})
      render_react(kit, props, options)
    end

    def pb_react_with_docs(kit, props:{}, options:{})
      ui = render_react(kit, props, options)
      docs = render_react_docs(kit, props, options)
      ui+docs
    end

    #------ Render Code Snippets
    def pb_rails_snippet(component_name, component_props, nested)
      props = !component_props.nil? && !component_props.empty? ? raw(component_props.to_json) : "{}"
      if(!nested.nil?)
        output = raw rouge("<%= pb_rails(\"#{component_name}\", props: #{props}) do %>\n#{nested.call.strip}\n<% end %>", "erb");
      else
        output = raw rouge("<%= pb_rails(\"#{component_name}\", props: #{props}) %>", "erb");
      end
      return output;
    end

    def pb_react_snippet(component_name, component_props)
      props = !component_props.nil? && !component_props.empty? ? raw(component_props.to_json) : "{}"
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
    def pb_kit(kit, type = "rails")
      filename = "#{NitroSg::Engine.root}/app/pb_kits/nitro_sg/pb_#{kit}/_variations.json"
      if( File.file?(filename) )
        json_from_file = File.read("#{NitroSg::Engine.root}/app/pb_kits/nitro_sg/pb_#{kit}/_variations.json")
        data = JSON.parse(json_from_file, :symbolize_names => true)

        display_variations = []
        data[:variations].each do |variation|
          if( type == "rails")
            if !variation[:children].nil?
              children_render = [];
              variation[:children].each do |child|
                if(child[:type] == "string" || child[:type] == "html")
                  children_render << child[:value].html_safe
                elsif(child[:type] == "kit")
                  children_render << pb_rails("#{child[:value][:name]}", props: child[:value][:props])
                end
              end
              block = pb_rails_with_docs("#{kit}", props: variation[:props]) do
                children_render.map { |k| k }.join(" ").html_safe
              end
              display_variations << block
            else
              display_variations << pb_rails_with_docs("#{kit}", props: variation[:props])
            end

          else
            display_variations << pb_react_with_docs("#{kit}", props: variation[:props])
          end
        end
        raw display_variations.map { |k| k }.join(" ")
      else
        return
      end
    end

    def pb_kits
      display_kits = []
      MENU["kits"].sort.each do |kit|
        title = render :inline => "<h2><a href='#{kit_show_path(kit)}'>#{pb_rails(:heading, props: { text: pb_title(kit), tag: 'h3', size: '2' })}</a></h2>"
        ui = pb_kit(kit)
        display_kits << title+ui
      end
      raw("<div class='pb--docItem'>"+display_kits.map { |k| k }.join("</div><div class='pb--docItem'>")+"</div>")
    end

    def pb_title(title)
      title.remove('pb_').titleize.tr("_", " ")
    end

  private

    def render_rails(kit, props, &block)
      if( !kit.match(/[\/\\]/) )
        kit_class_name = kit.to_s.tr(" ", "_").camelize
        kit_class_obj = "NitroSg::Pb#{kit_class_name}::#{kit_class_name}"
      else
        kit_folder_name = kit.split('/')[0].to_s.tr(" ", "_").camelize
        kit_class_name = kit.split('/')[-1].to_s.tr(" ", "_").camelize
        kit_class_obj = "NitroSg::Pb#{kit_folder_name}::#{kit_class_name}"
      end
      kit_class_obj = kit_class_obj.safe_constantize
      render(partial: kit_class_obj.new(**props, &block), as: :object)
    end

    def render_rails_docs(kit, props, &block)
      if(defined?(@kit))
        render(partial: "nitro_sg/config/ui/codeCopyRails", locals: {component_name: kit, component_props: props, nested: block})
      end
    end

    def render_react(kit, props, options)
      ::Webpacker::React::Component.new(kit.camelize).render(props, options)
    end

    def render_react_docs(kit, props, options)
      if(defined?(@kit) && @kit == kit)
        render(partial: "nitro_sg/config/ui/codeCopyReact", locals: {component_name: kit, component_props: props})
      end
    end
  end
end
