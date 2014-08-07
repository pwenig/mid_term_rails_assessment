require 'rails_helper'
require 'capybara/rails'

feature 'Wall' do

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

  scenario 'User can see Add Comment link' do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    expect(page).to have_content "Add Comment"

  end

  scenario 'User can see click on Add Comment link and see new comment page' do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    click_on "Add Comment"
    expect(page).to have_content "Add a comment"

  end

  scenario 'User can see click on Add Comment link and see comment body field & Add Comment button' do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    click_on "Add Comment"
    expect(page).to have_field "comment[body]"
    expect(page).to have_button "Add Comment"

  end

end
