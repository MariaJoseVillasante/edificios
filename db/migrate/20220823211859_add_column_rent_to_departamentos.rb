class AddColumnRentToDepartamentos < ActiveRecord::Migration[7.0]
  def change
    add_column :departamentos, :rent, :integer
  end
end
