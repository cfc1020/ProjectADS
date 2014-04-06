require 'spec_helper'

describe "Ads" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe "is Sign in?" do
    it { should have_link('Sign out',    href: destroy_user_session_path) }
  end

  describe "New Ad" do
    before { visit new_ad_path }

    let(:submit) { "Create Ad" }

    describe "with invalid information" do
      it "should not create a ad" do
        expect { click_button submit }.not_to change(Ad, :count)
      end
    end

    describe "with valid information" do
      before do
        @type = FactoryGirl.create(:type)
      end
      
      before do
        select @type.name, from: "Type"
        fill_in "Content",      with: "bla-bla-bla"        
      end
      
      it "should create a ad and read" do
        expect { click_button submit }.to change(Ad, :count).by(1)
        expect { have_selector('title', text: 'Ad') }
      end
    end
  end
end
