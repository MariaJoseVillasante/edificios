class ClientesController < ApplicationController
    before_action :set_cliente, only: %i[ show edit update destroy] 
    before_action :authenticate_user!

    def index
        @clientes = Cliente.includes(:departamentos)
        @q = Cliente.ransack(params[:q])
        @clientes = @q.result(distinct:true).all.order(id: :asc).page(params[:page])
    end
    def show
    end
    def new
        @cliente = Cliente.new
        @cliente.departamentos.build
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
        params.require(:cliente).permit(:nombre, :apellido, :email, :telefono, departamentos_attributes:[:id, :numbre, :sale_price, :_destroy])
    end
end
