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
  belongs_to :user
  has_many :order_items, dependent: :destroy

  before_save :set_sum!

  validates :user, presence: true

  validates :date, presence: true

  validates :order_items,
            presence: true

  validates_uniqueness_of :user_id, scope: :date

  private

    def set_sum!
      self.sum = order_items.map(&:price).sum
    end
end
