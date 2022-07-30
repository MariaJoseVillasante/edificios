class Edificio < ApplicationRecord
    has_many :departamento, dependent: :delete_all
    #aqui sabe cual es el nombre de la clave foranea
    #al modelo en plural en que clase y tabla
    validates :nombre, presence: true
    validates :direccion, presence: true
    validates :ciudad, presence: true
    # validaciones para que no se guarde el objeto vacío
    #def Departamento
    #    Departamento.where(edificio_id: self.id)
    #end
end
