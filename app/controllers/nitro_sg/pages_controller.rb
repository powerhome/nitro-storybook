require_dependency "nitro_sg/application_controller"

module NitroSg
  class PagesController < ApplicationController
    def home
    end
    def kits
    end
    def principals
    end
    def kit_show
      menu =  MENU["kits"]
      @kit = menu.first
    end
  end
end
