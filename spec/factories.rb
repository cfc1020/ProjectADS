FactoryGirl.define do
	sequence(:name)  	{ |n| n }
	sequence(:email) 	{ |n| "#{n}@mail.com" }
	sequence(:url)	 	{ |n| "http://example.com/url/#{n}"}
	sequence(:content) 	{ |n| "Content_ad#{n}"}

  	factory :user do
    	name     				{ "valid_name_user#{:name}" }
    	email 					
    	password 				"12345678"
    	password_confirmation 	"12345678"
  	end

  	factory :type do
    	name     				{ "type#{:name}" }
  	end

  	factory :picture do
  		url						{ "#{:url}.jpeg"}
  		ad
  	end

  	factory :ad do
  		content 		
  		user
  		type
  	end

    factory :comment do
      text            { "Text_comments_#{:content}"}
      user
      ad
    end
end