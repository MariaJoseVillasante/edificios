class ApplicationController < ActionController::Base
    before_action :busqueda_edificios

    private
    def busqueda_edificios
        @edificios = Edificio.all
    end
end
