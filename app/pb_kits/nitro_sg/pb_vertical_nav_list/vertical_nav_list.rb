module NitroSg
  module PbVerticalNavList
    class VerticalNavList
      def initialize(title: default_configuration,
                   link: default_configuration,
                   &block)
        self.configured_title = title
        self.configured_link = link
        self.configured_content = block_given? ? block : nil
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

      def content
        if configured_content == default_configuration
          ""
        else
          ""
          # configured_content
          # configured_content.call if configured_content.is_a?(Proc)
          # configured_content.call if configured_content.is_a?(Proc)
        end

        # configured_content = capture(&block)
        # configured_content.call if configured_content.is_a?(Proc)
        # yield if block_given?
        # if configured_content == default_configuration
        #   "xxxssss"
        # else
        #   # pp configured_content
        #   # pp &block
        #   # pp &block
        #   # yield
        #   yield if block_given?
        # end
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
          :configured_content
    end
  end
end
