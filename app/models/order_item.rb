# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  menu_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu
  has_one :product, through: :menu

  validates :menu, presence: true

  validates :order, presence: true

end
