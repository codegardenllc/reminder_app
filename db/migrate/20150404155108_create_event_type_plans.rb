class CreateEventTypePlans < ActiveRecord::Migration
  def change
    create_table :event_type_plans do |t|
      t.references :event_type, index: true
      t.references :plan, index: true

      t.timestamps
    end
  end
end
