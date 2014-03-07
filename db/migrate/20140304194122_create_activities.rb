class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :host_id
      t.integer :status
      t.string :name
      t.integer :visibility
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
