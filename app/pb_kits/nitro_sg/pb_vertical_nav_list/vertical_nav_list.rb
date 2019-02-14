module NitroSg
  module PbVerticalNavList
    class VerticalNavList
      def initialize(title: default_configuration,
                   link: default_configuration,
                   &block)
        self.configured_title = title
        self.configured_link = link
        self.block = block_given? ? block : nil
      end

      def title
        if configured_title == default_configuration
          ""
        else
          configured_title
        end
      end

      def link
        if configured_link == default_configuration
          "#"
        else
          configured_link
        end
      end

      def yield(context:)
        context.instance_eval(&block)
      end

      def to_partial_path
        "pb_vertical_nav_list/vertical_nav_list"
      end

    private

      DEFAULT = Object.new
      private_constant :DEFAULT
      def default_configuration
        DEFAULT
      end
      attr_accessor :configured_title,
          :configured_link,
          :block
    end
  end
end
