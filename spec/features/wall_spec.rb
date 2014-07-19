require 'rails_helper'
require 'capybara/rails'

feature 'Wall' do

  scenario 'User can add a comment' do
    create_user email: "user@example.com", name: "Some User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    click_on "Add Comment"

    fill_in "comment[body]", with: "Great post"
    click_on "Add Comment"

    expect(page).to have_content "Great post"
  end

  scenario 'Users can post' do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    expect(page).to have_content("I'm doing some fun things here")

    click_link "Logout"
    fill_in "Email", with: "reader@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content("I'm doing some fun things here")
  end

end
