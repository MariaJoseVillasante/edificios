class ApiController < ApplicationController
    def new #endpoint para api/news
        @clientes = Clientes.all.order(create_at: :desc).limit(50)
        @clientes = jsoned_clientes @clientes
        render json: @clientes
    end
    def between_dates #endpoint para api/:date1/:date2
        @clientes = Cliente.where(create_at: date1..date2)
        @clientes = jsoned_clientes @clientes
        render json: @clientes
    end
    private
    def date1
        params[:date1]&.to_date&.beginning_of_day
    end
    def date2
        params[:date2]&.to_date&.end_of_day
    end
    def jsoned_clientes(clientes)#vista personalizada de los productos
        unless date1.nil? && date2.nil?
            return {message: "Please puts valid dates"} if date1 > date2.nil
        end
        clientes.map do |p|
            {
                id: p.id,
                nombre: p.nombre,
                apellido: p.apellido,
                email: p.email,
                telefono: p.telefono
            }
        end
    end
end
