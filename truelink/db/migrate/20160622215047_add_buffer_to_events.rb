class AddBufferToEvents < ActiveRecord::Migration
  def change
    add_column :events, :buffer, :integer
  end
end
