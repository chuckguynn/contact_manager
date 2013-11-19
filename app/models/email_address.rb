class EmailAddress < ActiveRecord::Base
  attr_accessible :address, :contact_id, :contact_type

  validates :address, :contact_id, presence: true

  belongs_to :contact, polymorphic: true
end
