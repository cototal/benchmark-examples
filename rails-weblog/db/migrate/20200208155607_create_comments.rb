class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.string :title, null: false
      t.string :body
      t.boolean :approved, null: false, default: false

      t.timestamps
    end
  end
end
