class AddDescriptionToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
# add_column method.. adds a column
# first attribute is the table to add to, second is the column name,
# 3rd attribute is the type of data
