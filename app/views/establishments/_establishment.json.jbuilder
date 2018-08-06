json.extract! establishment, :id, :nombre, :direccion, :tipo_direccion, :nombre_propietario, :genero_propietario, :num_soli, :aforo, :letras_aforo, :actividad, :area, :primera_inspeccion, :segunda_inspeccion, :cumple, :num_recibo, :num_resolucion, :tipo_inspeccion, :riesgo, :created_at, :updated_at
json.url establishment_url(establishment, format: :json)
