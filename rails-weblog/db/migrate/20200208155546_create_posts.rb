class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :author, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body

      t.timestamps
    end
  end
end
