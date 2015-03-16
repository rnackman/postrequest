class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :notes
      t.string :link
      t.date :created_at
      t.date :claimed_at
      t.date :completed_at
      t.string :status
      t.integer :requester_id
      
      t.timestamps null: false
    end
  end
end
