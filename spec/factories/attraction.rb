FactoryGirl.define do
  factory :attraction do
    sequence(:title) { |t| "Attraction nº #{t}" }
    media "Television"
    day   Time.now

    trait :empty do
      title ''
      media ''
    end

    trait :coming do
      sequence(:day) { |t| rand(1..10).days.from_now }
    end

    trait :past do
      sequence(:day) { |t| rand(-t..-1).days.from_now }
    end
  end
end
