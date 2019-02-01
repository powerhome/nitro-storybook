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
    @cName = name.capitalize
    ## With Category
    # template "javascript.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.js"
    # template "scss.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.scss"
    # template "readme.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.md"
    # template "jsx.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.jsx"
    # template "html.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.html.erb"
    # template "story.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}Story.html.erb"

    template "javascript.erb", "app/pbKits/packs/pb#{@cName}.js"
    template "scss.erb", "app/pbKits/pb#{@cName}/_pb#{@cName}.scss"
    template "story.erb", "app/pbKits/pb#{@cName}/_pb#{@cName}Story.md"
    template "jsx.erb", "app/pbKits/pb#{@cName}/pb#{@cName}.jsx"
    template "html.erb", "app/pbKits/pb#{@cName}/_pb#{@cName}.html.erb"

    open('app/pbKits/packs/site_styles/_kit_style_index.scss', 'a') { |f|
      f.puts "@"+ "import "+ "\'" +"../pb#{@cName}/pb#{@cName}"+"\';"
    }
    open('config/data/menu.yml', 'a') { |f|
      f.puts "  - pb#{@cName}"
    }

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

  def vue_component_kebab_name
    name = ""
    parts.each do |part|
      name += part + '-'
    end
    # remove the trailing '-'
    name + 'view'
  end

  def vue_component_snippet
    """
    <#{vue_component_kebab_name}>
    </#{vue_component_kebab_name}>
    """
  end

  def javascript_pack_tag_snippet
    "<%= javascript_pack_tag '#{name}' %>"
  end

  def stylesheet_pack_tag_snippet
    "<%= stylesheet_pack_tag '#{name}' %>"
  end
end
