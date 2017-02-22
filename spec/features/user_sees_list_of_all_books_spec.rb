require 'spec_helper'

# As any user
# I can see a list of books
# So I know which books are available for book club

# - [] When a signed in user visits the home page, they see a list of all books
# - [] When a signed out user visits the home page, they see a list of all books

feature "User sees list of all books" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:book) { FactoryGirl.create(:book) }
  let!(:new_book) { FactoryGirl.create(:book, title: "Snow Crash") }
  scenario "authenticated user sees list of books" do
    visit '/'
    sign_in_as user

    expect(page).to have_content "Snow Crash"
    expect(page).to have_content "Life of Bob Saget"
  end

  scenario "unauthenticated user sees list of books" do
    visit '/'

    expect(page).to have_content "Snow Crash"
    expect(page).to have_content "Life of Bob Saget"
  end
end
