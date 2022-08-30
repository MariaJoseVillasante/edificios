class Edificio < ApplicationRecord
    has_many :departamentos, dependent: :delete_all
    #aqui sabe cual es el nombre de la clave foranea
    #al modelo en plural en que clase y tabla
    validates :nombre, presence: true
    validates :direccion, presence: true
    validates :ciudad, presence: true
    accepts_nested_attributes_for :departamentos,
                                    allow_destroy: true,
                                    reject_if: proc { |attributes| attributes['numero'].blank?}

    paginates_per 20
    # validaciones para que no se guarde el objeto vacío
    #def Departamento
    #    Departamento.where(edificio_id: self.id)
    #end
    def total_arriendo_edificio
        if self.departamentos.present?
            rentas = []
            self.departamentos.map do |r|
                if r.rent != nil
                    rentas << r.rent.to_i 
                end
            end 
            rentas.sum
        else
            "Sin arriendo"             
        end
    end
    def nombre_completo
        "#{id} #{"-"} #{nombre}"
      end
end
