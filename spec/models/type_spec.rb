# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Type do
  before do
    @type = FactoryGirl.create(:type)
  end

  it "Create and save type" do
    @type.save!
  end

  subject { @type }

  it { should respond_to(:name) }

  it { should ensure_length_of(:name).
       is_at_least(2).
       is_at_most(10) }

  it { should validate_presence_of(:name) }

  it { should have_many(:ads) }

end
