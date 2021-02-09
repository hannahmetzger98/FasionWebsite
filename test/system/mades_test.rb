require "application_system_test_case"

class MadesTest < ApplicationSystemTestCase
  setup do
    @made = mades(:one)
  end

  test "visiting the index" do
    visit mades_url
    assert_selector "h1", text: "Mades"
  end

  test "creating a Made" do
    visit mades_url
    click_on "New Made"

    fill_in "Content", with: @made.content
    fill_in "User", with: @made.user_id
    click_on "Create Made"

    assert_text "Made was successfully created"
    click_on "Back"
  end

  test "updating a Made" do
    visit mades_url
    click_on "Edit", match: :first

    fill_in "Content", with: @made.content
    fill_in "User", with: @made.user_id
    click_on "Update Made"

    assert_text "Made was successfully updated"
    click_on "Back"
  end

  test "destroying a Made" do
    visit mades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Made was successfully destroyed"
  end
end
