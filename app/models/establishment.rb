class Establishment < ActiveRecord::Base
	has_many :personals
  has_many :architects, through: :personals

	accepts_nested_attributes_for :personals, :allow_destroy => true
	accepts_nested_attributes_for :architects, :allow_destroy => true
  
  enum tipo_direccion: { "Jr": 0, "Av": 1, "Urb": 2 }
  enum genero_propietario: { "Sr": 0, "Sra": 1}
  enum actividad: { "Comercio": 0, "Servicio": 1, "Educación": 2}
  enum tipo_inspeccion: { "Ex-Post": 0, "Ex-Ante": 1, "De Detalle": 2}
  enum riesgo: { "Alto": 0, "Bajo": 1, "Medio": 2 }

end
