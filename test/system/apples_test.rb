require "application_system_test_case"

class ApplesTest < ApplicationSystemTestCase
  setup do
    @apple = apples(:one)
  end

  test "visiting the index" do
    visit apples_url
    assert_selector "h1", text: "Apples"
  end

  test "creating a Apple" do
    visit apples_url
    click_on "New Apple"

    fill_in "Kami", with: @apple.kami
    fill_in "Naka", with: @apple.naka
    fill_in "Simo", with: @apple.simo
    click_on "Create Apple"

    assert_text "Apple was successfully created"
    click_on "Back"
  end

  test "updating a Apple" do
    visit apples_url
    click_on "Edit", match: :first

    fill_in "Kami", with: @apple.kami
    fill_in "Naka", with: @apple.naka
    fill_in "Simo", with: @apple.simo
    click_on "Update Apple"

    assert_text "Apple was successfully updated"
    click_on "Back"
  end

  test "destroying a Apple" do
    visit apples_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Apple was successfully destroyed"
  end
end
