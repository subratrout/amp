class Survey < ApplicationRecord
  validates :name, presence: true
  has_one :question
  accepts_nested_attributes_for :question
end
