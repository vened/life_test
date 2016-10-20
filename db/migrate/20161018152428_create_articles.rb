class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.text :description
      t.datetime :pubDate
      t.string :image

      t.timestamps
    end
    add_index :articles, :title
    add_index :articles, :description
  end
end
