class AddGenerateResolutionToEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :generate_resolution, :boolean, default: false
  end
end
