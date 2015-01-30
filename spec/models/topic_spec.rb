require 'spec_helper'

describe Topic do
  let(:board) { FactoryGirl.create(:board) }
  before { @topic = board.topics.build(caption: "Bread") }
  subject { @topic }

  it { should respond_to(:caption) }
  it { should respond_to(:board_id) }
  it { should respond_to(:board) }
  its(:board_id) { should eq board.id}


  describe "when user_id is not present" do
    before { @topic.board_id = nil }
    it { should_not be_valid }
  end  
end
