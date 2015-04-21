require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    name "Charlie"
    password "1234"
  end
end
