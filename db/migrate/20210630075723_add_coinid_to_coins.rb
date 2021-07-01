class AddCoinidToCoins < ActiveRecord::Migration[5.0]
  def change
    add_column :coins, :coinid, :int
  end
end
