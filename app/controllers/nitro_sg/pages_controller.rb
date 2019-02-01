require_dependency "nitro_sg/application_controller"

module NitroSg
  class PagesController < ApplicationController
    before_action :set_kit, only: [:kit_show_rails, :kit_show_react]


    def home
    end
    def kits
    end
    def principles
    end
    def kit_show_rails
      render template: 'nitro_sg/pages/kit_show'
    end
    def kit_show_react
      render template: 'nitro_sg/pages/kit_show'
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
