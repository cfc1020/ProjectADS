require 'spec_helper'

describe Ad do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @ad = FactoryGirl.create(:ad)
  end

  it "Create and save valid user" do
  	@ad.save!
  end

  subject { @ad }

  it { should respond_to(:content) }
  it { should respond_to(:state) }

  #temp
  #it { should ensure_length_of(:content).
       #is_at_least(6).
       #is_at_most(20) }

  it { should validate_presence_of(:content) }

  it { should have_many(:pictures) }
  it { should belong_to(:user) }
  it { should belong_to(:type) }

end
