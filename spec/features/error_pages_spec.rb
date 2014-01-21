require 'spec_helper'

feature "UserError handles the exeptions" do
  scenario "non existent path" do
    visit '/bad_route'
    page.should have_content "Not found"
  end

  scenario "server error" do
    visit '/tests'
    page.should have_content "Internal Server Error"
  end

  scenario "bad request" do
    visit '/tests/1'
    page.should have_content "Forbidden"
  end

  scenario "custom exception" do
    visit '/tests/new'
    page.should have_content "Forbidden"
  end
end
