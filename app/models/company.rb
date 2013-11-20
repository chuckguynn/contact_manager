class Company < ActiveRecord::Base
  attr_accessible :name, :user, :user_id

  validates :name, presence: true

  has_many :phone_numbers, as: :contact

  has_many :email_addresses, as: :contact

  belongs_to :user

  def to_s
    "#{name}"
  end
end
