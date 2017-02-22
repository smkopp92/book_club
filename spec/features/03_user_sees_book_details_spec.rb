require 'spec_helper'

# As any user
# I can see a books details
# So I can pick my favorite book for book club

# - [x] When a user visits the home page, they can click a book link to get to the show page
# - [x] When a user visits the show page directly, they see the details of a book

feature "User sees specific book info" do
  let!(:book) { FactoryGirl.create(:book) }
  scenario "user visits show page through index page" do
    visit '/'

    expect(page).to have_link book.title

    click_link book.title

    expect(page).to have_current_path("/books/#{book.id}")
  end

  scenario "unauthenticated user sees list of books" do
    visit "/books/#{book.id}"

    expect(page).to have_content "Title: Life of Bob Saget"
    expect(page).to have_content "Author: Bob Saget"
    expect(page).to have_content "Year: #{book.year}"
  end
end
