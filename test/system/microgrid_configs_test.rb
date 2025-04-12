require "application_system_test_case"

class MicrogridConfigsTest < ApplicationSystemTestCase
  setup do
    @microgrid_config = microgrid_configs(:one)
  end

  test "visiting the index" do
    visit microgrid_configs_url
    assert_selector "h1", text: "Microgrid configs"
  end

  test "should create microgrid config" do
    visit microgrid_configs_url
    click_on "New microgrid config"

    fill_in "Battery capacity", with: @microgrid_config.battery_capacity
    fill_in "Ev charging power", with: @microgrid_config.ev_charging_power
    fill_in "Load flexibility", with: @microgrid_config.load_flexibility
    click_on "Create Microgrid config"

    assert_text "Microgrid config was successfully created"
    click_on "Back"
  end

  test "should update Microgrid config" do
    visit microgrid_config_url(@microgrid_config)
    click_on "Edit this microgrid config", match: :first

    fill_in "Battery capacity", with: @microgrid_config.battery_capacity
    fill_in "Ev charging power", with: @microgrid_config.ev_charging_power
    fill_in "Load flexibility", with: @microgrid_config.load_flexibility
    click_on "Update Microgrid config"

    assert_text "Microgrid config was successfully updated"
    click_on "Back"
  end

  test "should destroy Microgrid config" do
    visit microgrid_config_url(@microgrid_config)
    click_on "Destroy this microgrid config", match: :first

    assert_text "Microgrid config was successfully destroyed"
  end
end
