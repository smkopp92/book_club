require 'spec_helper'

# As signed in user
# I can see a list of my books
# So I know which books I am reading

# - [] When a user visits the home page, they can click my books to see their book list
# - [] When a user visits the my books page directly, they see the list of their books

feature "User sees their book list" do
  let(:user) { FactoryGirl.create(:user) }
  let(:good_book) { FactoryGirl.create(:book) }
  let!(:bad_book) { FactoryGirl.create(:book, title: "Life as a Robot") }
  before(:each) do
    user.books << good_book
    user.save
  end

  scenario "user visits book list page through index page" do
    visit '/'
    sign_in_as user

    expect(page).to have_link "My Books"

    click_link "My Books"

    expect(page).to have_current_path("/my_books")
  end

  scenario "User only sees books on their list" do
    sign_in_as user

    visit "/my_books"

    expect(page).to have_content "Life of Bob Saget"
    expect(page).to_not have_content "Life as a Robot"
  end
end
