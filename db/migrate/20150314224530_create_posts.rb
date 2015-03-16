class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :topic_id
      t.integer :writer_id
      t.string :status
      
      t.timestamps null: false
    end
  end
end
