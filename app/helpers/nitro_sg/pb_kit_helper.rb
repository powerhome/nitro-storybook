module NitroSg
  module PbKitHelper
    def pb_kit(name, data: {}, &block)
      render_component("#{name}/#{name}", { data: data }, &block)
    end

  private

    def render_component(name, locals, &block)
      if block_given?
        # using `layout` is a trick to allow passing blocks to partials
        # (cf. http://stackoverflow.com/a/2952056)
        render layout: name, locals: locals, &block
      else
        render partial: name, locals: locals
      end
    end
  end
end
