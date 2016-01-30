class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.timestamp :pubdate
      t.string :title
      t.text :body
      t.string :source
      t.boolean :publish
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
