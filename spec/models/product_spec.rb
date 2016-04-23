# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'associations' do
    it { should belong_to(:category) }
  end 

  context 'validations' do
    it { should validate_presence_of :name }

    it 'product name must be unique' do
      some_category = create(:category);
      some_name = Faker::Lorem.words(rand(2..3)).join(' ');
      expect(create(:product, name: some_name, category_id: some_category.id )).to be_valid
      expect(build(:product, name: some_name, category_id: some_category.id )).not_to be_valid
    end

    it do
      should validate_length_of(:name)
        .is_at_most(Product::MAX_PRODUCT_NAME_LENGTH)
        .is_at_least(Product::MIN_PRODUCT_NAME_LENGTH)
    end

    it 'trims spaces before validation' do
      some_category = create(:category);
      expect(build(:product, name: '           ', category_id: some_category.id)).not_to be_valid
      some_product = build(:product, name: '    Valid Product Name       ', category_id: some_category.id)
      expect(some_product).to be_valid
      expect(some_product.name).to eq('Valid Product Name')
    end
  end

end
