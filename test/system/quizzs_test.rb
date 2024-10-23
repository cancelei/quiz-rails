require "application_system_test_case"

class QuizzsTest < ApplicationSystemTestCase
  setup do
    @quizz = quizzs(:one)
  end

  test "visiting the index" do
    visit quizzs_url
    assert_selector "h1", text: "Quizzs"
  end

  test "should create quizz" do
    visit quizzs_url
    click_on "New quizz"

    fill_in "Title", with: @quizz.title
    click_on "Create Quizz"

    assert_text "Quizz was successfully created"
    click_on "Back"
  end

  test "should update Quizz" do
    visit quizz_url(@quizz)
    click_on "Edit this quizz", match: :first

    fill_in "Title", with: @quizz.title
    click_on "Update Quizz"

    assert_text "Quizz was successfully updated"
    click_on "Back"
  end

  test "should destroy Quizz" do
    visit quizz_url(@quizz)
    click_on "Destroy this quizz", match: :first

    assert_text "Quizz was successfully destroyed"
  end
end
