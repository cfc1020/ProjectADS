require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
  end

  it "Create and save valid user" do
    @user.save!
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:role) }

  it { should ensure_length_of(:name).
       is_at_least(6).
       is_at_most(20) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it "validates email address" do
    should_not allow_value("qwerty@mail").for(:email)
    should_not allow_value("qwerty@.com").for(:email)
    should_not allow_value("@dsaads.com").for(:email)
  end

  it { expect(@user.role).to eq "user" }

  it { should have_many(:ads) }
  it { should have_many(:comments) }

end
