require "application_system_test_case"

class PetsTest < ApplicationSystemTestCase
  setup do
    @pet = pets(:one)
  end

  test "visiting the index" do
    visit pets_url
    assert_selector "h1", text: "Pets"
  end

  test "creating a Pet" do
    visit pets_url
    click_on "New Pet"

    fill_in "Image", with: @pet.image
    fill_in "Kind", with: @pet.kind
    fill_in "Letter", with: @pet.letter
    fill_in "Letter2", with: @pet.letter2
    fill_in "Letter3", with: @pet.letter3
    fill_in "Name", with: @pet.name
    fill_in "Pr", with: @pet.pr
    fill_in "Runimage", with: @pet.runimage
    fill_in "User", with: @pet.user_id
    fill_in "Zzimage", with: @pet.zzimage
    click_on "Create Pet"

    assert_text "Pet was successfully created"
    click_on "Back"
  end

  test "updating a Pet" do
    visit pets_url
    click_on "Edit", match: :first

    fill_in "Image", with: @pet.image
    fill_in "Kind", with: @pet.kind
    fill_in "Letter", with: @pet.letter
    fill_in "Letter2", with: @pet.letter2
    fill_in "Letter3", with: @pet.letter3
    fill_in "Name", with: @pet.name
    fill_in "Pr", with: @pet.pr
    fill_in "Runimage", with: @pet.runimage
    fill_in "User", with: @pet.user_id
    fill_in "Zzimage", with: @pet.zzimage
    click_on "Update Pet"

    assert_text "Pet was successfully updated"
    click_on "Back"
  end

  test "destroying a Pet" do
    visit pets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pet was successfully destroyed"
  end
end
