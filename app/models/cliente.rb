class Cliente < ApplicationRecord
    has_many :departamento, dependent: :delete_all

    paginates_per 20

end
