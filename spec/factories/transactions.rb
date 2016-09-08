FactoryGirl.define do 
	factory :transaction do
	  transaction_date Faker::Date.between(2.days.ago, Date.today)
    comment Faker::Lorem.sentence
    amount Faker::Number.number(10)
	end
	
end