class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.string :mc
      t.string :mv
      t.string :price
      t.string :marketl
      t.string :quota
      t.string :week

      t.timestamps
    end
  end
end
