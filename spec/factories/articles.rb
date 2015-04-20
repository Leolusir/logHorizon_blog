FactoryGirl.define do
  sequence :title do |n|
    "Test only articles no.#{n}"
  end

  factory :article do
    title
    content "Here is a test article : )"
  end
end
