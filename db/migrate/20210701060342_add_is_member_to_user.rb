class AddIsMemberToUser < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :is_member, :boolean, default: false
  end
end
