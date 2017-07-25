FactoryGirl.define do
  factory :comment do
    rating 1
    text "MyText"
    user nil
    product nil
  end
end
