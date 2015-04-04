class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :name
      t.string :email
      t.string :password
      t.string :number
      t.references :plan, index: true

      t.timestamps
    end
  end
end
