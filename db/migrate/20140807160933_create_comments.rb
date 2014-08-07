class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.text :body
      t.timestamp :created_at
    end
  end
end
