class Company < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :phone_numbers, as: :contact

  has_many :email_addresses, as: :contact

  def to_s
    "#{name}"
  end
end
