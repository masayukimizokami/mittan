require "application_system_test_case"

class CooksTest < ApplicationSystemTestCase
  setup do
    @cook = cooks(:one)
  end

  test "visiting the index" do
    visit cooks_url
    assert_selector "h1", text: "Cooks"
  end

  test "creating a Cook" do
    visit cooks_url
    click_on "New Cook"

    fill_in "Cookingday", with: @cook.cookingday
    fill_in "Cookname", with: @cook.cookname
    fill_in "Cookurl", with: @cook.cookurl
    fill_in "Cost", with: @cook.cost
    fill_in "Image", with: @cook.image
    fill_in "Point", with: @cook.point
    fill_in "Pr", with: @cook.pr
    fill_in "Recom", with: @cook.recom
    fill_in "Standby", with: @cook.standby
    click_on "Create Cook"

    assert_text "Cook was successfully created"
    click_on "Back"
  end

  test "updating a Cook" do
    visit cooks_url
    click_on "Edit", match: :first

    fill_in "Cookingday", with: @cook.cookingday
    fill_in "Cookname", with: @cook.cookname
    fill_in "Cookurl", with: @cook.cookurl
    fill_in "Cost", with: @cook.cost
    fill_in "Image", with: @cook.image
    fill_in "Point", with: @cook.point
    fill_in "Pr", with: @cook.pr
    fill_in "Recom", with: @cook.recom
    fill_in "Standby", with: @cook.standby
    click_on "Update Cook"

    assert_text "Cook was successfully updated"
    click_on "Back"
  end

  test "destroying a Cook" do
    visit cooks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cook was successfully destroyed"
  end
end
