module NitroSg
  module PbCard
    class Card
      def initialize(name: default_configuration)
        self.configured_name = name
      end

      def name
        if configured_name == default_configuration
          "Tim"
        else
          configured_name
        end
      end

      def to_partial_path
        "pb_card/card"
      end

    private

      DEFAULT = Object.new
      private_constant :DEFAULT
      def default_configuration
        DEFAULT
      end
      attr_accessor :configured_name
    end
  end
end
