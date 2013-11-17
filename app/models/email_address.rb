class EmailAddress < ActiveRecord::Base
  attr_accessible :address, :person_id

  belongs_to :person

  validates :address, presence: true
end
