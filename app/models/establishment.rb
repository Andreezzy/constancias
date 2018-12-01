class Establishment < ActiveRecord::Base
	has_many :personals
  has_many :architects, through: :personals

	accepts_nested_attributes_for :personals, :allow_destroy => true
	accepts_nested_attributes_for :architects, :allow_destroy => true
  
  enum tipo_direccion: { "Jr.": 0, "Av.": 1, "Urb.": 2 }
  enum genero_propietario: { "Sr.": 0, "Sra.": 1}
  enum actividad: { "Comercio": 0, "Servicio": 1, "Educación": 2}
  enum tipo_inspeccion: { "Ex-Post": 0, "Ex-Ante": 1, "De Detalle": 2}
  enum riesgo: { "Alto": 0, "Bajo": 1, "Medio": 2 }

  before_save :default_values
  
  def default_values
    self.letras_aforo = I18n.transliterate(I18n.with_locale(:es) { self.aforo.to_words }).upcase
  end
  def cumple_text
    self.cumple ? "Si" : "No"
  end
  def cumple_2_text
    self.cumple_2 ? "Si" : "No"
  end
  def set_tipo_direccion
    case self.tipo_direccion
      when "Jr."
        "el Jr."
      when "Av."
        "la Av."
      when "Urb."
        "la Urb."
    end
  end
  def set_el_o_la
    self.genero_propietario == "Sr." ? "el" : "la"
  end
  def set_del_o_de_la
    self.genero_propietario == "Sr." ? "del" : "de la"
  end
  def set_fecha_inspeccion(fecha)
    I18n.locale = :es
    I18n.l(fecha.to_time, format: :day_month)
  end
  def dispone?
    (self.cumple || self.cumple_2) ? "DISPONER" : "DENEGAR"
  end
  def cumple?
    self.cumple || self.cumple_2
  end
end
