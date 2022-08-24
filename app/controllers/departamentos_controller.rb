class DepartamentosController < ApplicationController
    #agregar las accones de new, create, index y show en el controller departamento
    #agregar las vistas new, show e index
    before_action :set_departamento, only: %i[ show edit update destroy ]
    # %i evita usar ; y :
    before_action :consulta_edificios, only: %i[ show new edit update]
    before_action :consulta_clientes, only: %i[ show new edit update]

    def index
        #@departamentos = Departamento.includes(:edificio).order(created_at: :asc)
        #includes arregla en n+1 optimiza la búsqueda
        #El método index del controlador disponibiliza por medio
        #de la variable de instancia @edificios, la lista de edificio disponible
        #para rutas anidadas:
        #@building = Building.find params[:building_id]
        #apartments = @building.apartments
        #@departamentos = Departamento.includes(:edificio).order(created_at: :asc).page(params[:page])
        #@departamentos = Departamento.includes(:edificio, :cliente).page(params[:page])
        @q = Departamento.ransack(params[:q])
        @departamentos = @q.result(distinct:true).all.order(id: :asc).page(params[:page])
        @total_arriendos_deptos = Departamento.all.sum(:rent)
    end
    def show
    end
    def new
        @departamento = Departamento.new
    end
    def edit
    end
    def create
        @departamento = Departamento.new(departamento_params)
        # params son permisos para guardar la información
        if @departamento.save
            redirect_to departamentos_path, notice: "Departamento Creado Exitosamente."
        else
            redirect_to new_departamento_url, notice: "Departamento ya existe"
        end
    end
    def update
        if @departamento.update(departamento_params)
            redirect_to @departamento, notice: "Departamento actualizado Exitosamente."
        else
            render :edit, status: :unprocessable_entity        
        end
    end
    def destroy
        @departamento.destroy
        redirect_to departamentos_url, notice: "Departamento eliminado exitosamente"
    end

    private

    def set_departamento
        @departamento = Departamento.find(params[:id])
    end
    def departamento_params
        params.require(:departamento).permit(:numero, :edificio_id, :cliente_id, :rent)
    end
    def consulta_edificios
        @edificios = Edificio.select(:id, :nombre).order(nombre: :asc)
    end
    def consulta_clientes
        @clientes = Cliente.select(:id, :nombre).order(nombre: :asc)
    end
end
