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
  belongs_to :menu, required: true
  has_one :product,  through: :menu
  has_one :category, through: :menu

  before_save do
    unless self.new_record?
      errors.add(:order_item, "could not be updated.")
      false
    end
  end

  before_destroy do
    if order
      errors.add(:order_item, "could not be destroyed.")
      false
    end
  end

  scope :category_ordered, -> {
    joins(:category)
   .order('categories.show_order')
  }

  scope :day_total, -> (date) {
    joins(:order)
   .joins(:menu)
   .joins(:product)
   .select('menus.id as menu_id, count(*) as total_count, sum(menus.price) as total_sum')
   .where('orders.date' => date)
   .group('menus.id','products.name')
   .order('products.name')
  }

end
