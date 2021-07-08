class AddLogoToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :logo, :string
  end
end
