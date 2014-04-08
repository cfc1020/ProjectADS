require 'spec_helper'

describe Ad do

  before do
    @ad = FactoryGirl.create(:ad)
  end

  it "Create and save valid ad" do
    @ad.save!
  end

  subject { @ad }

  it { should respond_to(:content) }
  it { should respond_to(:state) }

  it { should ensure_length_of(:content).
       is_at_least(2).
       is_at_most(1000) }

  it { should validate_presence_of(:content) }

  it { should have_many(:images) }
  it { should have_many(:comments) }
  it { should belong_to(:user) }
  it { should belong_to(:type) }

  it { expect(@ad.state).to eq "draft" }

end
