FactoryGirl.define do 
  sequence :name do |n|
    "name no.#{n}"
  end

  factory :tag do
    name
  end
end
