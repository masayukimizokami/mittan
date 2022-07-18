require "application_system_test_case"

class PensTest < ApplicationSystemTestCase
  setup do
    @pen = pens(:one)
  end

  test "visiting the index" do
    visit pens_url
    assert_selector "h1", text: "Pens"
  end

  test "creating a Pen" do
    visit pens_url
    click_on "New Pen"

    fill_in "Simonoku pen", with: @pen.simonoku_pen
    click_on "Create Pen"

    assert_text "Pen was successfully created"
    click_on "Back"
  end

  test "updating a Pen" do
    visit pens_url
    click_on "Edit", match: :first

    fill_in "Simonoku pen", with: @pen.simonoku_pen
    click_on "Update Pen"

    assert_text "Pen was successfully updated"
    click_on "Back"
  end

  test "destroying a Pen" do
    visit pens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pen was successfully destroyed"
  end
end
