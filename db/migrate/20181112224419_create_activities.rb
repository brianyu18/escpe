class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :interest_id
      t.integer :event_id


      t.timestamps
    end
  end
end
