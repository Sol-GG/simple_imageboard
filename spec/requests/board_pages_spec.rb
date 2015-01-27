
require 'spec_helper'

describe "Board page" do

  subject { page }
  let(:board) { FactoryGirl.create(:board) }

  before { visit tag_path(board.tag) }


  it { should have_content(board.long_name) }
  it { should have_title(board.long_name) }

  describe  "With wrong tag" do
  	before { visit tag_path("wrong") }
  	it { should have_content("Welcome") }
  end

end