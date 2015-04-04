class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :event_type, index: true
      t.boolean :completed
      t.string :text
      t.datetime :time
      t.references :user, index: true

      t.timestamps
    end
  end
end
