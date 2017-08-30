require 'rails_helper'

describe "User Can Search By Zip" do
  it "user visits root page and searches for stations by zip" do

    visit "/"
    fill_in["search[body]", with: "80203"]
    click_on "Locate"

    expect(current_path).to eq("/search?80203")
    expect(page).to have_content("Wells Fargo Center")
    expect(page).to have_content("1700 Sherman Street")
    expect(page).to have_content("Electric")
    # expect(page).to have_content("distance")
    expect(page).to have_content("Open 24/7")
  end
end
