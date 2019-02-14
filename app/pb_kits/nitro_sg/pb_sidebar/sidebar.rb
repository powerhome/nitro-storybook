module NitroSg
  module PbSidebar
    class Sidebar
      def initialize(position: default_configuration,
                   transparent: default_configuration,
                   size: default_configuration,
                   dark: default_configuration,
                   content: default_configuration,
                   &block)
        self.configured_position = position
        self.configured_transparent = transparent
        self.configured_size = size
        self.configured_dark = dark
        self.configured_content = block_given? ? block : nil
      end

      def position
        if configured_position == default_configuration
          "_left"
        else
          "_#{configured_position}"
        end
      end

      def transparent
        if configured_transparent == default_configuration
          ""
        else
          if (configured_transparent == true)
            "_transparent"
          end
        end
      end

      def size
        if configured_size == default_configuration
          "md"
        else
          configured_size
        end
      end

      def dark
        if configured_dark == default_configuration
          ""
        else
          if (configured_dark == true)
            "_dark"
          end
        end
      end

      def content
        if configured_content == default_configuration
          ""
        else
          ""
          # configured_content
        end
      end

      def to_partial_path
        "pb_sidebar/sidebar"
      end

    private

      DEFAULT = Object.new
      private_constant :DEFAULT
      def default_configuration
        DEFAULT
      end
      attr_accessor :configured_position,
          :configured_transparent,
          :configured_size,
          :configured_dark,
          :configured_content
    end
  end
end
