class Cliente < ApplicationRecord
    has_many :departamento, dependent: :delete_all
    paginates_per 20

    def renta_total
        if self.departamento.present?
            rentas = []
            self.departamento.map do |r|
                if r.rent != nil
                    rentas << r.rent.to_i 
                end
            end 
            rentas
        else
            "Sin arriendo"             
        end
    end
    # def numero_asistentes
    #     asis =[]
    #     self.concerts.map do |c|
    #         asis << c.asistentes
    #     end
    #     asis
    # end
end
