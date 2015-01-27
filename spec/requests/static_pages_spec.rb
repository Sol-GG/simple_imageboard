require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    let(:board) { FactoryGirl.create(:board) }
    subject { page }

    it "should have title" do
      visit root_path
      expect(page).to have_content('Welcome')
      expect(page).to have_content('To the neat and simple imageboard world')
    end

    it "should have board list" do
      visit root_path
      expect(page).to find_link(board.tag)
    end

  end

end