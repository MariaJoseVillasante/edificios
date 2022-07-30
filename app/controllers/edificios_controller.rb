class EdificiosController < ApplicationController
    before_action :set_edificio, only: %i[ show edit update destroy ]
    # %i evita usar ; y :
    def index
        @edificios = Edificio.all.order(created_at: :asc)
        #El método index del controlador disponibiliza por medio
        #de la variable de instancia @edificios, la lista de edificio disponible
    end
    def show
    end
    def new
        @edificio = Edificio.new
    end
    def edit
    end
    def create
        @edificio = Edificio.new(edificio_params)
        # params son permisos para guardar la información
        if @edificio.save
            redirect_to list_edificios_path, notice: "Edificio Creado Exitosamente."
        else
            render :new, status: :unprocessable_entity        
        end
    end
    def update
        if @edificio.update(edificio_params)
            redirect_to @edificio, notice: "Edificio actualizado Exitosamente."
        else
            render :edit, status: :unprocessable_entity        
        end
    end
    def destroy
        @edificio.destroy
        redirect_to edificios_url, notice: "Edificio eliminado exitosamente"
    end

    private

    def set_edificio
        @edificio = Edificio.find(params[:id])
    end
    def edificio_params
        params.require(:edificio).permit(:nombre, :direccion, :ciudad)
    end
end
