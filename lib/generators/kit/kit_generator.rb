# the generator extends from NamedBase base class which makes sure
# alleast a name must be provided to the generator

class KitGenerator < Rails::Generators::NamedBase

  source_root File.expand_path("../templates/", __FILE__)


  ## Create a Category Name
  # def get_category_name
  #   puts "What is your #{name.capitalize}'s category"
  #   @category = $stdin.gets.chomp
  #   return @category
  # end


  def create_templates

    # MENU = YAML.load_file("config/data/menu.yml")
    # menu = MENU["kits"]
    # if menu.include?(MYNEWKITNAME)
      @cName = name.capitalize
      ## With Category
      # template "javascript.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.js"
      # template "scss.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.scss"
      # template "readme.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.md"
      # template "jsx.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.jsx"
      # template "html.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.html.erb"
      # template "story.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}Story.html.erb"



      # #Add kit to styles scss
      # open('app/pbKits/packs/site_styles/_kit_style_index.scss', 'a') { |f|
      #   f.puts "@"+ "import "+ "\'" +"../pb#{@cName}/pb#{@cName}"+"\';"
      # }

      # #Add to kit to YAML file
      # open('config/data/menu.yml', 'a') { |f|
      #   f.puts "  - pb#{@cName}"
      # }

      @exists = nil

      f = File.open("config/data/menu.yml", "r")
        f.each_line do |line|
          if line.include? "  - pb#{@cName}"
            puts "This kit exists"
            @exists = true
          else
            @exists = false

          end
        end
      f.close
      if @exists == false
        puts "Creating Kit.../"

        template "javascript.erb", "app/pbKits/packs/pb#{@cName}.js"
        template "scss.erb", "app/pbKits/pb#{@cName}/_pb#{@cName}.scss"
        template "storyrails.erb", "app/pbKits/pb#{@cName}/_pb#{@cName}StoryRails.md"
        template "storyreact.erb", "app/pbKits/pb#{@cName}/_pb#{@cName}StoryReact.md"
        template "jsx.erb", "app/pbKits/pb#{@cName}/pb#{@cName}.jsx"
        template "html.erb", "app/pbKits/pb#{@cName}/_pb#{@cName}.html.erb"

        #Add kit to styles scss
        open('app/pbKits/packs/site_styles/_kit_style_index.scss', 'a') { |f|
          f.puts "@"+ "import "+ "\'" +"../../pb#{@cName}/pb#{@cName}"+"\';"
        }

        #Add to kit to YAML file
        open('config/data/menu.yml', 'a') { |f|
          f.puts "  - pb#{@cName}"
        }

        f = File.open("lib/generators/kit/templates/logo.txt", "r")
          f.each_line do |line|
            puts line
          end
        f.close
      end

  end




  private
  # Here are some helper methods which are used in the templates
  # they are pretty easy to understand
  # def inject_scss_import
  #   open('app/pbKits/packs/_kit_style_index.scss', 'a') { |f|
  #     f.puts "@"+"import"+`" ../pb#{@cName}/pb#{@cName}";`
  #   }
  # end
  # splits the name reports/new
  # ['reports', 'new']
  def parts
    name.split('/')
  end

  # create js file name for reports/new
  # ReportsNew
  def js_file_name
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
