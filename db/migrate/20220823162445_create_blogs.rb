class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image_url
      t.text :content
      t.string :author
      t.integer :status

      t.timestamps
    end
  end
end
