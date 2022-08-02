class Cliente < ApplicationRecord
    has_many :departamento, dependent: :delete_all

end
