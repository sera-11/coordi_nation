class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :role, default: "Member"
      t.string :phone_number
      t.string :email
      t.date :birthday
      t.integer :organization_id

      t.timestamps
    end
  end
end
