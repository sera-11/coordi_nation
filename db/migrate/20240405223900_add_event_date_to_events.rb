class AddEventDateToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_date, :date
  end
end
