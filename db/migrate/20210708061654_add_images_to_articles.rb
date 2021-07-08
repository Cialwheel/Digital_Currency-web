class AddImagesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :images, :string
  end
end
