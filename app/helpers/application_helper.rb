require "webpacker/helper"

module NitroSg
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      NitroSg.webpacker
    end
  end
end
