# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string           not null
#  sex         :string(1)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = ['red','orange','yellow','green','blue','purple']
  validates :name, presence: true, uniqueness: true
  validates :color, inclusion: { in: COLORS }

  has_many :rental_requests,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy

  def age
    (Date.today - birth_date)/365.to_f
  end

  def self.color_constant
    COLORS
  end


end
