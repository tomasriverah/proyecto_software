class Postulacion < ApplicationRecord
	belongs_to :carrete
    serialize :postulaciones, Hash

    def update_carrete_id(id)
        update(carrete_id: id)
    end

    def update_postulaciones(postulaciones)
        update(postulaciones: postulaciones)
    end 

end
