
require 'spec_helper'

describe "Board page" do

  subject { page }
  let(:board) { FactoryGirl.create(:board) }

  before { visit tag_path(board.tag) }

  it { should have_content(board.long_name) }
  it { should have_title(board.long_name) }

  describe "It should show topics" do
  	before { FactoryGirl.create(:topic, board: board) }
  	before { visit tag_path(board.tag) }
  	it{should have_content(board.topics.first.caption)}
  	#save_and_open_page
  end

  describe  "With wrong tag" do
  	before { visit tag_path("wrong") }
  	it { should have_content("Welcome") }
  end


  describe "Topic creation" do
    it{should have_content("New Thread")}

    describe "with invalid information" do
      it "should not create a topic" do
        expect { click_button "Post" }.not_to change(Topic, :count)
      end
    end

    describe "with valid information" do
      before { fill_in 'topic_caption', with: "Lorem ipsum" }
      it "should create a topic" do
        expect { click_button "Post" }.to change(Topic, :count).by(1)
      end  
    end    


  end


end