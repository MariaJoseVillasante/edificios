class Departamento < ApplicationRecord
  belongs_to :edificio
  belongs_to :cliente

  # validate :departamento_unico
  validates :numero, presence: true
  validates :rent, presence: true
  validates :edificio_id, presence: true, uniqueness: {scope: :numero}
  validates :cliente_id, presence: true, uniqueness: {scope: :id}

  paginates_per 20
  #aca no...
  # def total_arriendo_departamento
  #   if self.id.present?
  #       rentas = []
  #       @departamentos.each do |r|
  #           if r.rent != nil
  #               rentas << r.rent.to_i 
  #           end
  #       end 
  #       rentas.sum
  #   else
  #       "Sin arriendo"             
  #   end
  # end
end
