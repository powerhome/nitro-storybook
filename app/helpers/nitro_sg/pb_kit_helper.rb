module NitroSg
  module PbKitHelper
    def pb_rails(name, data: {}, &block)
      render_component("#{name}/#{name}", { data: data }, &block)
    end

    def pb_rails_with_props(name, data: {}, &block)
      render_props(name, { data: data }, &block)
    end

  private

    def render_props(name, locals, &block)
      render 'config/ui/propsTable', component_name: name, component_props: locals
    end

    def render_component(name, locals, &block)
      if block_given?
        # using `layout` is a trick to allow passing blocks to partials
        # (cf. http://stackoverflow.com/a/2952056)
        ui = render layout: name, locals: locals, &block
        if( defined?(locals[:data][:show_props]) && locals[:data][:show_props] == true )
          props = render 'config/ui/propsTableSimple', component_props: locals
          ui+props
        else
          ui
        end
      else
        ui = render partial: name, locals: locals
        if( defined?(locals[:data][:show_props]) && locals[:data][:show_props] == true )
          props = render 'config/ui/propsTableSimple', component_props: locals
          ui+props
        else
          ui
        end
      end
    end

    def except!(*keys)
      keys.each { |key| delete(key) }
      self
    end

  end
end
