# the generator extends from NamedBase base class which makes sure
# alleast a name must be provided to the generator

class ComponentGenerator < Rails::Generators::NamedBase

  source_root File.expand_path("../templates/", __FILE__)

  # if you remember all the public methods will be executed in the defined order

  # this method will create a JavaScript file using the javascript.erb template
  # in the location defined as the next params
  # we will look into the content of the templates next
  # creates file app/javascript/packs/[namespace]/[controller]/action.js

  def get_category_name
    puts "What is your #{name.capitalize}'s category"
    @category = $stdin.gets.chomp
    return @category
  end


  def get_templates()
    cName = name.capitalize

    template "javascript.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.js"
    template "scss.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.scss"
    template "readme.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.md"
    template "jsx.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.jsx"
    template "html.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}.html.erb"
    template "story.erb", "app/pbKits/#{@category}/pb#{cName}/pb#{cName}Story.html.erb"
  end



  private
  # Here are some helper methods which are used in the templates
  # they are pretty easy to understand

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
