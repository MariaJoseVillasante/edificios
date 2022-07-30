class CreateEdificios < ActiveRecord::Migration[7.0]
  def change
    create_table :edificios do |t|
      t.string :nombre
      t.string :direccion
      t.string :ciudad

      t.timestamps
    end
  end
end
