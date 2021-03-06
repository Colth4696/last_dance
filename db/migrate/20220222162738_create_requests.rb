class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
