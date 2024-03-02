class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :postal_code, null: false
      t.string :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :block_number, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
