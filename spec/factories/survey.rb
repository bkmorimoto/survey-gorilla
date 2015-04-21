require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :survey do
    title "Charlie"
    user_id 1
  end
end
