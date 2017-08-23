# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validates :cat_id, presence: true
  validates :status, presence:true, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}
  validate :does_not_overlap_approved_request

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where.not(id: id)
      .where('start_date <= :end_date OR end_date >= :start_date',
                  start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests
      .where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if CatRentalRequest.exists?(overlapping_approved_requests)
      errors[:base] << 'cannot overlap with approved request'
    end
  end
end
