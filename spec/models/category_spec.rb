# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  show_order :integer          not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  context 'associations' do
    it { should have_many(:products).dependent(:destroy) }
  end 

  context 'validations' do
    it { should validate_presence_of :title }

    it 'category title must be unique' do
      some_title = Faker::Lorem.words(rand(2..3)).join(' ')
      expect(create(:category, title: some_title)).to be_valid
      expect(build(:category, title: some_title)).not_to be_valid
    end

    it do
      should validate_length_of(:title)
        .is_at_most(Category::MAX_CATEGORY_TITLE_LENGTH)
        .is_at_least(Category::MIN_CATEGORY_TITLE_LENGTH)
    end

    it 'trims spaces before validation' do
      expect(build(:category, title: '           ')).not_to be_valid
      some_category = build(:category, title: '    Valid Category Title       ')
      expect(some_category).to be_valid
      expect(some_category.title).to eq('Valid Category Title')
    end
  end

end
