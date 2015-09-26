FactoryGirl.define do
  factory :user do
    sequence(:nick_name) { |t| "nick_#{t}" }
    sequence(:email)     { |t| "validemail_#{t}@email.com" }
    password 'password'

    trait :with_coming_attractions do
      attractions { create_list :attraction, 4, :coming }
    end
  end
end
