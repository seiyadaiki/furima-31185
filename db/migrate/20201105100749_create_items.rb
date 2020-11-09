class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                 null: false
      t.text :explanation,             null: false
      t.integer :category_id,          null: false
      t.integer :status_id,            null: false
      t.integer :shipping_fee_id,      null: false
      t.integer :location_id,          null: false
      t.integer :delivery_time_id,     null: false
      t.integer :selling_price,        null: false
      t.references :user,              null: false, foreign_key: true
    end
  end
end
