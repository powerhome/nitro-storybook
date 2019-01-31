module NitroSg
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper Webpacker::Helper
    helper NitroSg::PbKitHelper
    append_view_path NitroSg::Engine.root + "app/pbKits"
  end
end
