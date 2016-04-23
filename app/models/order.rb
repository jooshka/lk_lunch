# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  menu_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  has_one :product, through: :menu
  has_one :category, through: :menu

  validates :user,
            presence: true

  validates :menu,
            presence: true
end
