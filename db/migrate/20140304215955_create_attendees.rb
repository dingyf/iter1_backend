class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :role

      t.timestamps
    end
  end
end
