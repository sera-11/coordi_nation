class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.boolean :hosting
      t.string :address
      t.integer :organization_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
