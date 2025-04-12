class CreateMicrogridConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :microgrid_configs do |t|
      t.float :load_flexibility
      t.float :battery_capacity
      t.integer :ev_charging_power

      t.timestamps
    end
  end
end
