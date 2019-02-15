require "json"

module NitroSg
  module PbDocHelper
    # Generate pretty kit names
    def pb_title(title)
      title.remove('pb_').titleize.tr("_", " ")
    end

    # Generate all variations of a kit with docs
    def pb_kit(kit: "", type: "rails", show_docs: true)
      if has_variations?(kit)
        kit_variations = get_variations(kit)

        display_variations = []
        kit_variations[:variations].each do |variation|
          if type == "rails"
            if has_children?(variation)
              children = []
              helper_children = []
              variation[:children].each do |child|
                if child[:type] == "string" || child[:type] == "html"
                  helper_children << child[:value].html_safe
                  children << child[:value].html_safe
                elsif child[:type] == "kit"
                  helper_children << "<%= pb_rails(\"#{child[:value][:name]}\", props: #{child[:value][:props].to_json})%>"
                  children << pb_rails("#{child[:value][:name]}", props: child[:value][:props])
                end
              end
              display_variations << render_variation(kit, variation[:props], children, helper_children, show_docs)
            else
              if show_docs == true
                kit_render = pb_rails_with_docs("#{kit}", props: variation[:props])
              else
                kit_render= pb_rails("#{kit}", props: variation[:props])
              end
              display_variations << kit_render
            end
          elsif type == "react"
            display_variations << render_react_pack(kit, variation[:props], show_docs)
          end
        end
        start_doc = render_doc("nitro_sg/pb_#{kit}/start") if lookup_context.find_all("nitro_sg/pb_#{kit}/start",[],true).any?
        variations = raw display_variations.map { |k| k }.join(" ")
        end_doc = render_doc("nitro_sg/pb_#{kit}/end") if lookup_context.find_all("nitro_sg/pb_#{kit}/end",[],true).any?
        kit_display_obj = [
          start_doc,
          variations,
          end_doc
        ]

        if show_docs == true
          raw kit_display_obj.join(" ")
        else
          raw variations
        end
      else
        return
      end
    end

    # Generate all vartiations of all kits without docs
    def pb_kits
      display_kits = []
      MENU["kits"].sort.each do |kit|
        title = render_clickable_title(kit)
        ui = pb_kit(kit: kit, type: "rails", show_docs: false)
        display_kits << title+ui
      end
      raw("<div class='pb--docItem'>"+display_kits.map { |k| k }.join("</div><div class='pb--docItem'>")+"</div>")
    end

    # Display rails kit ui with docs
    def pb_rails_with_docs(kit, props:{}, doc_children: doc_children, &block)
      ui_color = defined?(props[:dark]) && props[:dark] == true ? "dark" : "light"
      ui = raw("<div class='pb--kit-example #{ui_color}-ui'>"+render_rails(kit, props, &block)+"</div>")
      docs = render(partial: NitroSg::Config::PbDoc.new(
        {name: "#{kit}", props: props, nested: block, type: "rails", doc_children: doc_children}
      ), as: :object)
      ui+docs
    end

    # Display react kit ui with docs
    def pb_react_with_docs(kit, props:{}, options:{})
      ui_color = defined?(props[:dark]) && props[:dark] == true ? "dark" : "light"
      ui = raw("<div class='pb--kit-example #{ui_color}-ui'>"+render_react(kit, props, options)+"</div>")
      docs = render(partial: NitroSg::Config::PbDoc.new(
        {name: "#{kit}", props: props, type: "react"}
      ), as: :object)
      ui+docs
    end

  private

    def get_variations(name)
      json_from_file = File.read("#{NitroSg::Engine.root}/app/pb_kits/nitro_sg/pb_#{name}/_variations.json")
      data = JSON.parse(json_from_file, :symbolize_names => true)
    end

    def has_variations?(name)
      File.file?("#{NitroSg::Engine.root}/app/pb_kits/nitro_sg/pb_#{name}/_variations.json")
    end

    def has_children?(variation)
      !variation[:children].nil?
    end

    def render_child(child)
      if child[:type] == "string" || child[:type] == "html"
        child[:value].html_safe
      elsif child[:type] == "kit"
        pb_rails("#{child[:value][:name]}", props: child[:value][:props])
      end
    end

    def render_react_pack(kit, props, show_docs)
      if show_docs == true
        kit_render = pb_react_with_docs("#{kit}", props: props)
      else
        kit_render = pb_react("#{kit}", props: props)
      end
      react_pack = [
        javascript_pack_tag("pb_#{kit}"),
        kit_render
      ]
      react_pack.join(" ");
    end

    def render_variation(kit, props, children, helper_children, show_docs)
      if show_docs == true
        pb_rails_with_docs("#{kit}", props: props, doc_children: helper_children) do
          children.map { |k| k }.join(" ").html_safe
        end
      else
        pb_rails("#{kit}", props: props) do
          children.map { |k| k }.join(" ").html_safe
        end
      end
    end

    def render_clickable_title(kit)
      render :inline => "<a href='#{kit_show_path(kit)}'>#{pb_rails(:heading, props: { text: pb_title(kit), tag: 'h3', size: '2' })}</a>"
    end

    def render_doc(path)
      render partial: path
    end

    def partial_exists?(path)
      lookup_context.find_all(path).any?
    end
  end
end
