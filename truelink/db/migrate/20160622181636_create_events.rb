class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :start_date
      t.integer :interval
      t.integer :action_day

      t.timestamps null: false
    end
  end
end
