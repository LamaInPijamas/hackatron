json.extract! microgrid_config, :id, :load_flexibility, :battery_capacity, :ev_charging_power, :created_at, :updated_at
json.url microgrid_config_url(microgrid_config, format: :json)
