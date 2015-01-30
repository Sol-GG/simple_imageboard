require 'spec_helper'

describe Board do

  before{ @board = Board.new(long_name: "Bread", tag: "b") }
  #@board.topics.build(caption: "Bread")
  let(:topic) { FactoryGirl.create(:topic, board: @board) }
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
      other_board = @board.dup
      other_board.tag = @board.tag.upcase
      other_board.save
    end

    it { should_not be_valid }
  end

  describe "when board is destroyed" do
    it "should destroy associated threads" do
      #topics = @board.topics.to_a
      topics = Topic.all
      @board.destroy
      expect(topics).not_to be_empty
      topics.each do |topic|
        expect(Topic.where(id: topic.id)).not_to be_empty
      end
    end
  end

end
