# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  role                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#

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
