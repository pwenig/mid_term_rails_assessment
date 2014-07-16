class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :comment
      t.datetime :created_at
      t.datetime :updated_at


      #creates a user_id column, and a user_id index
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
    end
  end
end
