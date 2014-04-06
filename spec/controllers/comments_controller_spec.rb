require 'spec_helper'

describe CommentsController do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  before do
    @type = FactoryGirl.create(:type)
  end

  before do
    @ad = Ad.new(content: "bla-bla", type_id: @type.id)
    @ad.user = user
    @ad.save
  end

  describe "creating a comment" do
    it "should increment the Commetns count" do
      expect do 
        post :create, comment: { text: "bla-bla-bla" }, ad_id: @ad.id
      end.to change(Comment, :count).by(1)
    end
  end
end
