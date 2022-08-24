class Departamento < ApplicationRecord
  belongs_to :edificio
  belongs_to :cliente

  # validate :departamento_unico
  validates :numero, presence: true
  #validates :rent, presence: true
  validates :edificio_id, presence: true, uniqueness: {scope: :numero}
  #validates :cliente_id, presence: true, uniqueness: {scope: :id}

  paginates_per 20

end
