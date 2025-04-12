require "test_helper"

class MicrogridConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @microgrid_config = microgrid_configs(:one)
  end

  test "should get index" do
    get microgrid_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_microgrid_config_url
    assert_response :success
  end

  test "should create microgrid_config" do
    assert_difference("MicrogridConfig.count") do
      post microgrid_configs_url, params: { microgrid_config: { battery_capacity: @microgrid_config.battery_capacity, ev_charging_power: @microgrid_config.ev_charging_power, load_flexibility: @microgrid_config.load_flexibility } }
    end

    assert_redirected_to microgrid_config_url(MicrogridConfig.last)
  end

  test "should show microgrid_config" do
    get microgrid_config_url(@microgrid_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_microgrid_config_url(@microgrid_config)
    assert_response :success
  end

  test "should update microgrid_config" do
    patch microgrid_config_url(@microgrid_config), params: { microgrid_config: { battery_capacity: @microgrid_config.battery_capacity, ev_charging_power: @microgrid_config.ev_charging_power, load_flexibility: @microgrid_config.load_flexibility } }
    assert_redirected_to microgrid_config_url(@microgrid_config)
  end

  test "should destroy microgrid_config" do
    assert_difference("MicrogridConfig.count", -1) do
      delete microgrid_config_url(@microgrid_config)
    end

    assert_redirected_to microgrid_configs_url
  end
end
