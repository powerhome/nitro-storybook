# the generator extends from NamedBase base class which makes sure
# alleast a name must be provided to the generator

class KitGenerator < Rails::Generators::NamedBase

  source_root File.expand_path("../templates/", __FILE__)


  def create_templates

      @name = name
      @exists = nil

      f = File.open("config/data/menu.yml", "r")
        f.each_line do |line|
          if line.include? "  - pb_#{@name}"
            puts "This kit exists"
            @exists = true
          else
            @exists = false

          end
        end
      f.close

      if @exists == false
        puts "Creating Kit.../"

        template "javascript.erb",  "app/pb_kits/nitro_sg/packs/pb_#{@name}.js"
        template "scss.erb",        "app/pb_kits/nitro_sg/pb_#{@name}/_#{@name}.scss"
        template "jsx.erb",         "app/pb_kits/nitro_sg/pb_#{@name}/_#{@name}.jsx"
        template "html.erb",        "app/pb_kits/nitro_sg/pb_#{@name}/_#{@name}.html.erb"
        template "variations.erb",  "app/pb_kits/nitro_sg/pb_#{@name}/_variations.json"
        template "ruby.erb",        "app/pb_kits/nitro_sg/pb_#{@name}/#{@name}.rb"
        
        #Add kit to styles scss
        open('app/pb_kits/nitro_sg/packs/site_styles/_kit_style_index.scss', 'a') { |f|
          f.puts "@"+ "import "+ "\'" +"../../pb_#{@name}/#{@name}"+"\';"
        }

        #Add to kit to YAML file
        open('config/data/menu.yml', 'a') { |f|
          f.puts "  - #{@name}"
        }

        # Recode this
        # f = File.open("lib/generators/kit/templates/logo.txt", "r")
        #   f.each_line do |line|
        #     puts line
        #   end
        # f.close
      end

  end




  private

    def parts
      name.split('/')
    end

    def js_titleize_file_name
      name = ""
      parts.each do |part|
        name += part.titleize
      end
      name
    end

    def javascript_pack_tag_snippet
      "<%= javascript_pack_tag '#{name}' %>"
    end

    def stylesheet_pack_tag_snippet
      "<%= stylesheet_pack_tag '#{name}' %>"
    end
end
