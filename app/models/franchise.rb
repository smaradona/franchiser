class Franchise < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :owner_name, :length => {minimum: 3, maximum: 50, :too_short => 'es demasiado corto (3 caracteres mínimo)', :too_long => 'es demasiado largo (50 caracteres máximo)'}
	validates :owner_phone, :length => {minimum: 5, maximum: 15, :too_short => 'es demasiado corto (5 caracteres mínimo)', :too_long => 'es demasiado largo (15 caracteres máximo)'}
	validates :owner_email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX , message: "no tiene formato de correo electrónico"}
	validates :province, length: {minimum: 3, maximum: 25, too_short: 'es demasiado corto (3 caracteres mínimo)', too_long: 'es demasiado largo (25 caracteres máximo)'}
	validates :zone, length: {minimum: 3, maximum: 25, too_short: 'es demasiado corto (3 caracteres mínimo)', too_long: 'es demasiado largo (25 caracteres máximo)'}
	validates :address, length: {minimum: 3, maximum: 50, too_short: 'es demasiado corto (3 caracteres mínimo)', too_long: 'es demasiado largo (50 caracteres máximo)'}
	validates :zip_code, length: {minimum: 3, maximum: 25, too_short: 'es demasiado corto (3 caracteres mínimo)', too_long: 'es demasiado largo (25 caracteres máximo)'}
	validates :area_code, length: {minimum: 3, maximum: 25, too_short: 'es demasiado corto (3 caracteres mínimo)', too_long: 'es demasiado largo (25 caracteres máximo)'}
	validates :phone_number, length: {minimum: 3, maximum: 25, too_short: 'es demasiado corto (3 caracteres mínimo)', too_long: 'es demasiado largo (25 caracteres máximo)'}
	validates :email, :length => { maximum: 255 }, :format => { with: VALID_EMAIL_REGEX, message: "no tiene formato de correo electrónico"}
	validates :latitude, :presence => {:message => "no está definida en el mapa"}
	# validates :longitude, :presence => {:message => "no puede estar vacío"}
end
