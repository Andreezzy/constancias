class Establishment < ActiveRecord::Base
	has_many :personals
  has_many :architects, through: :personals

  enum tipo_direccion: { "Jr": 0, "Av": 1, "Urb": 2 }
  enum genero_propietario: { "Sr": 0, "Sra": 1}
end
