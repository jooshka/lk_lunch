# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :category do
    title { Faker::Lorem.words(rand(2..3)).join(' ') }
    show_order 1
  end
end
