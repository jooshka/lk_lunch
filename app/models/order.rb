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

  validates :user, presence: true

  validates :date, presence: true

  validates_uniqueness_of :user_id, scope: :date

end
