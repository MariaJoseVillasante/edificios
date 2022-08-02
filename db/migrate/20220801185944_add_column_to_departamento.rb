class AddColumnToDepartamento < ActiveRecord::Migration[7.0]
  def change
    add_reference :departamentos, :cliente, null: false, foreign_key: true
  end
end
