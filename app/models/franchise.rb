class Franchise < ActiveRecord::Base
	validates :owner_name, :presence => {:message => "no puede estar vacío"}, :length => {minimum: 3, maximum: 50, :too_short => 'es demasiado corto (3 caracteres mínimo)', :too_long => 'es demasiado largo (50 caracteres máximo)'}
	validates :owner_phone, length: {minimum: 3, maximum: 15}
	validates :owner_email, length: {minimum: 3, maximum: 15}
	validates :province, :presence => {:message => "no puede estar vacío"}, length: {minimum: 3, maximum: 25}
	validates :zone, length: {minimum: 3, maximum: 25}
	validates :address, length: {minimum: 3, maximum: 50}
	validates :zip_code, length: {minimum: 3, maximum: 50}
	validates :area_code, length: {minimum: 3, maximum: 50}
	validates :phone_number, length: {minimum: 3, maximum: 50}
	validates :email, length: {minimum: 3, maximum: 50}
	validates :latitude, :presence => {:message => "Debe seleccionar una ubicación para la franquicia en el mapa"}
	# validates :longitude, :presence => {:message => "no puede estar vacío"}
end
