class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :post, index: true, foreign_key: true
      t.integer :rate

      t.timestamps null: false
    end
  end
end
