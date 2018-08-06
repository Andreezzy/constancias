class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :nombre
      t.string :direccion
      t.integer :tipo_direccion
      t.string :nombre_propietario
      t.integer :genero_propietario
      t.string :num_soli
      t.integer :aforo
      t.string :letras_aforo
      t.integer :actividad
      t.float :area
      t.datetime :primera_inspeccion
      t.datetime :segunda_inspeccion
      t.boolean :cumple
      t.string :num_recibo
      t.string :num_resolucion
      t.integer :tipo_inspeccion
      t.integer :riesgo

      t.timestamps null: false
    end
  end
end
