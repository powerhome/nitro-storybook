require_dependency "nitro_sg/application_controller"

module NitroSg
  class PagesController < ApplicationController
    before_action :set_kit, only: [:kit_show]


    def home
    end
    def kits
    end
    def principals
    end
    def kit_show
    end

    private
      def set_kit
        menu =  MENU["kits"]
        unless menu.include?(params[:name])
          redirect_to root_path
        else
          @kit = params[:name]
        end
      end
  end
end
