class AddColumnToDepartamento < ActiveRecord::Migration[7.0]
  def change
    add_reference :departamentos, :cliente, null: true, foreign_key: false
  end
end
