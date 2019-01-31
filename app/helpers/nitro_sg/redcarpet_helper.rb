
require 'redcarpet'
require 'action_view'
module NitroSg
module RedcarpetHelper
  def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true,
      no_styles: false,
      safe_links_only: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      fenced_code_blocks: true,
      tables: true,
      disable_indented_code_blocks: false,
      strikethrough: true,
      underline: true,
      highlight: true,
      footnotes: true,
      with_toc_data: true,
    }

    renderer = HTMLBlockCode.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end

class HTMLBlockCode < Redcarpet::Render::HTML
  include ActionView::Helpers::AssetTagHelper
  def header(title, level)
    if level == 7
      @headers ||= []
      permalink = title.gsub(/\W+/, "-")
      if @headers.include?(permalink)
        permalink += "_1"
        loop do
          break if !@headers.include?(permalink)
          permalink.gsub!(/\_(\d+)$/, "_#{$1.to_i + 1}")
        end
      end
      @headers << permalink
      %(\n<a name="#{permalink}" class="markdown-header-anchor anchor" href="##{permalink}"><span class="fa fa-link anchor-icon"></span></a><h#{level} id=\"#{permalink}\">#{title}</h#{level}>\n)
    else
      %(\n<h#{level}>#{title}</h#{level}>\n)
    end
  end

  def image(link, title, alt_text)
    image_tag(link, title: title, alt: alt_text, class: "imageloader lazyload")
  end

  def preprocess(full_document)
    full_document.gsub(/\[component (.*)\]/) do
      @string = $1
      @default_height = '160'
      @attr = ['', @default_height]

      # Set src from attributes
      @string.gsub(/src="(.*?)"/) do
        @attr[0] = $1
      end

      # Set height from attributes
      @string.gsub(/height="(.*?)"/) do
        if $1
          @attr[1] = $1
        else
          @attr[1] = @default_height
        end
      end

      %(\n<div class="uix-component-frame"><iframe scrolling="no" id="component-preview" src="#{@attr[0]}" width="100%" height="#{@attr[1]}"></iframe><a href="#{@attr[0]}" target="_blank" class="uix-component-link">View component</a></div>\n)
    end
  end

  def list(contents, list_type)
    @contents = contents
    @list_items = contents.split("\n")

    if @list_items[0].include? "[do]" or @list_items[0].include? "[dont]"
      @element_items = []
      @list_items.each do |item, index|
        item.gsub(/\<li>(.*)\<\/li>/) do
          @element_items.push($1);
        end
      end

      # Doing both because we could have either/both
      # clean up
      @dont_items, @trash_items_dont = @element_items.partition { |x, i|  x.include? "[dont]" }
      @do_items, @trash_items_do = @element_items.partition { |x, i|  x.include? "[do]" }

      @do_list = []
      @do_items.each do |item, index|
        @do_list.push("<li>#{item.sub('[do] ', '')}</li>")
      end
      @do_list = "<ul class='uix-ruleset do-list'>#{@do_list.join("")}</ul>"

      @dont_list = []
      @dont_items.each do |item, index|
        @dont_list.push("<li>#{item.sub('[dont] ', '')}</li>")
      end
      @dont_list = "<ul class='uix-ruleset dont-list'>#{@dont_list.join("")}</ul>"

      "<div class='row uix-ruleset-block'><div class='col-sm-6'>#{@do_list}</div><div class='col-sm-6'>#{@dont_list}</div></div>"
    else
      @contents
    end
  end
end
end