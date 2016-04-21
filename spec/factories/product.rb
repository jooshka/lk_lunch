# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null

FactoryGirl.define do
  factory :product do
    name { Faker::Lorem.words(rand(2..3)).join(' ') }
    category { create(:category) }
  end
end
