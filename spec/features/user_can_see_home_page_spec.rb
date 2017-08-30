require 'rails_helper'

describe "Welcome Page" do
  it "user visits welcome index as root page" do

    visit "/"

    expect(page).to have_link("AltFuelFinder")
    expect(page).to have_button("Locate")
  end
end
