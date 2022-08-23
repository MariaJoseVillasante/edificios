class ClientesController < ApplicationController
    before_action :set_cliente, only: %i[ show edit update destroy] 

    def index
        #@clientes = Cliente.all.page(params[:page])
        @q = Cliente.ransack(params[:q])
        @clientes = @q.result(distinct:true).all.order(id: :asc).page(params[:page])
    end
    def show
    end
    def new
        @cliente = Cliente.new
    end
    def edit
    end
    def create
        @cliente = Cliente.new(cliente_params)
        if @cliente.save
            redirect_to clientes_path
        else
            render :new
        end
    end
    def update
        if @cliente.update(cliente_params)
            redirect_to @cliente
        else
            render :edit
        end
    end
    def destroy
        @cliente.destroy
        redirect_to clientes_url
    end

    private
    def set_cliente
        @cliente = Cliente.find(params[:id])
    end
    def cliente_params
        params.require(:cliente).permit(:nombre, :apellido, :email, :telefono)
    end
end
