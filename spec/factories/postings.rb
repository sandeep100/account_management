FactoryGirl.define do 
	factory :posting do
	  amount 100
	  account_id Faker::Number.number(3)
	end

end