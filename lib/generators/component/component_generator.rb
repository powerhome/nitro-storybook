# the generator extends from NamedBase base class which makes sure
# alleast a name must be provided to the generator
class ComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  # if you remember all the public methods will be executed in the defined order

  # this method will create a JavaScript file using the javascript.erb template
  # in the location defined as the next params
  # we will look into the content of the templates next
  # creates file app/javascript/packs/[namespace]/[controller]/action.js
  def create_js_file
    # name is a method that is available to us
    # it stores the path entered while scaffolding
    # ex: rails g vue reports/index
    # then name = 'reports/index'
    template "javascript.erb", "app/pb_kits/pb_#{name}/pb_#{name}.js"
  end

  # similar create sass file the given location usign the template
  # creates file app/components/[namespace]/[namespace].sass
  def create_scss_file
    template "scss.erb", "app/pb_kits/pb_#{name}/pb_#{name}.scss"
  end

  # similar create sass file the given location usign the template
  # creates file app/components/[namespace]/[namespace].sass
  def create_readme_file
    template "readme.erb", "app/pb_kits/pb_#{name}/pb_#{name}.md"
  end

  # similar create jsx file the given location usign the template
  # creates file app/javascript/views/[namespace]/[controller]/action.vue
  def create_jsx_file
    template "jsx.erb", "app/pb_kits/pb_#{name}/pb_#{name}.jsx"
  end

  # you got this one right?
  # create or update app/views/[namespace]/[controller]/action.html.erb
  def create_erb_file
    template "html.erb", "app/pb_kits/pb_#{name}/pb_#{name}.html.erb"
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
