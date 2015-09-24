FactoryGirl.define do
  factory :attraction do
    sequence(:title) { |t| "Attraction nº #{t}" }
    media "Television"

    trait :empty do
      title ''
      media ''
    end
  end
end
