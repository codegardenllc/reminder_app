class UpdateNumberFields < ActiveRecord::Migration
  def up
    rename_column :users, :phone_number, :twilio_number
    rename_column :users, :number, :mobile_number
    change_column :users, :twilio_number, :string
    change_column :users, :mobile_number, :string
  end

  def down
    rename_column :users, :twilio_number, :phone_number
    rename_column :users, :mobile_number, :number
  end
end