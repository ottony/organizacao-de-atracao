FactoryGirl.define do
  factory :user do
    sequence(:nick_name) { |t| "nick_#{t}" }
    sequence(:email)     { |t| "validemail_#{t}@email.com" }
    password 'password'
    confirmed_at Time.now

    trait :with_coming_attractions do
      attractions { create_list :attraction, 4, :coming }
    end

    trait :with_attractions do
      attractions do
        create_list( :attraction, 2, :coming ) +
          create_list(:attraction, 2, :past)
      end
    end

    trait :unconfirmed do
      confirmed_at nil
    end
  end
end
