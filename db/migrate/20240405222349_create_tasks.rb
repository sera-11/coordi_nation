class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :text
      t.date :due_date
      t.integer :assigned_to_id, foreign_key: { to_table: :members }
      t.string :status, default: "not started"
      t.integer :organization_id

      t.timestamps
    end
  end
end
