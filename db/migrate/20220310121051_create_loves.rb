class CreateLoves < ActiveRecord::Migration[6.0]
  def change
    create_table :loves do |t|

     t.references :user, foreign_key: true
     t.references :blog, foreign_key: true

     t.timestamps
     t.index [:user_id, :blog_id], unique: true
      end
    end
  end
