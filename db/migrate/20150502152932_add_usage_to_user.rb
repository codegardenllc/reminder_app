class AddUsageToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_usage, :integer, default: 0
    add_column :users, :sms_usage, :integer, default: 0
  end
end
