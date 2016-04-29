# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date       :date             not null
#  sum        :decimal(15, 2)   not null
#

class Order < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  validates_presence_of :date,
                        :order_items

  validates_uniqueness_of :user_id, scope: :date

  validate :order_items_rules

  before_save 'self.sum = order_items.map(&:menu).map(&:price).sum'

  scope :day, -> (date) { where(:date => date) }

  private

    def order_items_rules
      dates = order_items.map { |item| item.menu.date if item.menu }
      errors.add(:order, "must include menu items on order date") unless dates.uniq == [ date ]

      
    end

end
