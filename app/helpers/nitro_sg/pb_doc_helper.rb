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
              variation[:children].each do |child|
                children << render_child(child)
              end
              display_variations << render_variation(kit, variation[:props], children, show_docs)
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
        raw display_variations.map { |k| k }.join(" ")
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
    def pb_rails_with_docs(kit, props:{}, &block)
      ui = render_rails(kit, props, &block)
      docs = render(partial: NitroSg::Config::PbDoc.new(
        {name: "#{kit}", props: props, nested: block, type: "rails"}
      ), as: :object)
      ui+docs
    end

    # Display react kit ui with docs
    def pb_react_with_docs(kit, props:{}, options:{})
      ui = render_react(kit, props, options)
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

    def render_variation(kit, props, children, show_docs)
      if show_docs == true
        pb_rails_with_docs("#{kit}", props: props) do
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
  end
end
