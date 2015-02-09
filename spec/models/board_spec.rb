require 'spec_helper'

describe Board do

  before do 
    @board = Board.new(long_name: "Bread", tag: "b")
    @board.save 
    @topic=@board.topics.new(caption: "Lol")
    @topic.save
    #FactoryGirl.create(:topic, board: @board) 
  end
  #@board.topics.build(caption: "Bread")
  
  subject { @board }

  it { should respond_to(:long_name) }
  it { should respond_to(:tag) }
  it { should respond_to(:topics) }



  describe "when tag is not present" do
    before { @board.tag = " " }
    it { should_not be_valid }
  end

  describe "when tag is too long" do
    before { @board.tag = "a" * 5 }
    it { should_not be_valid }
  end

  describe "when tag already exists" do
  	before do
      @other_board = @board.dup
      @other_board.tag = @board.tag.upcase
      #other_board.save
    end
    subject { @other_board }

    it { should_not be_valid }
  end

  describe "when board is destroyed" do
    it "should destroy associated threads" do
      expect(Topic.where(id: @topic.id)).not_to be_empty
      @board.destroy
      expect(Topic.where(id: @topic.id)).to be_empty
    end
  end

end
