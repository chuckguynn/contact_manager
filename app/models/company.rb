class Company < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :phone_numbers, as: :contact
end
