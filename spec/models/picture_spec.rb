require 'spec_helper'

describe Picture do
  before do
    @pic = FactoryGirl.create(:picture)
  end

  it "Create and save valid pic" do
  	@pic.save!
  end

  subject { @pic }

  it { should respond_to(:url) }

  it "validates url address" do
    should_not allow_value("dsasda").for(:url)
    #should_not allow_value("dsaa.com/das.jpeg").for(:url)
    should_not allow_value("http://dass,com").for(:url)
    should_not allow_value("http://dass").for(:url)
    should_not allow_value("http:/dass.com/asd.jpeg").for(:url)
    should_not allow_value("htt://dass.com/asd.jpeg").for(:url)
    should_not allow_value("http//dass.com/asd.jpeg").for(:url)
  end

  it { should belong_to(:ad) }

end
