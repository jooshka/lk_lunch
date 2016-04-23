# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  date       :date             not null
#  product_id :integer
#  price      :decimal(15, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Menu, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
