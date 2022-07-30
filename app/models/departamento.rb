class Departamento < ApplicationRecord
  belongs_to :edificio

  # validate :departamento_unico
  validates :numero, presence: true
  validates :edificio_id, presence: true


  private
  # def departamento_unico
  #   encontrados = self.edificio.departamento.select { |depto| depto.numero == self.numero }
  #   if encontrados.count > 1
  #     self.errors.add(error_duplicado, "El departamento ya existe, por favor elige otro")
  #   end
  # end
end
