require 'rails_helper'
require 'capybara/rails'

feature 'Wall' do
  let(:user) { create_user }
  scenario 'Users can post' do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_link "Logout"

    fill_in "Email", with: "reader@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in 'post_body', with: "Here is my post"
    click_on "Post"
    click_on "Add Comment"
    expect(page).to have_content "Add a comment"

    fill_in "Comment", with: "Great post!"
    click_on "Add Comment"
    expect(page).to have_content "Great post!"

  end
end
