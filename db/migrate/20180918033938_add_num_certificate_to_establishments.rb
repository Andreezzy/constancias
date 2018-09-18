class AddNumCertificateToEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :num_certificate, :integer
  end
end
