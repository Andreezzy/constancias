class AddGenerateCumple2ToEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :cumple_2, :boolean
  end
end
