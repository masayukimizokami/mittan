require "application_system_test_case"

class PigsTest < ApplicationSystemTestCase
  setup do
    @pig = pigs(:one)
  end

  test "visiting the index" do
    visit pigs_url
    assert_selector "h1", text: "Pigs"
  end

  test "creating a Pig" do
    visit pigs_url
    click_on "New Pig"

    fill_in "Nakanoku pig", with: @pig.nakanoku_pig
    click_on "Create Pig"

    assert_text "Pig was successfully created"
    click_on "Back"
  end

  test "updating a Pig" do
    visit pigs_url
    click_on "Edit", match: :first

    fill_in "Nakanoku pig", with: @pig.nakanoku_pig
    click_on "Update Pig"

    assert_text "Pig was successfully updated"
    click_on "Back"
  end

  test "destroying a Pig" do
    visit pigs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pig was successfully destroyed"
  end
end
