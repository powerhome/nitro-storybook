module NitroSg
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper Webpacker::Helper
    helper NitroSg::PbKitHelper
    helper NitroSg::PbDocHelper
    append_view_path NitroSg::Engine.root + "app/pb_kits"
  end
end
