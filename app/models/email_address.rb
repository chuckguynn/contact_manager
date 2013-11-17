class EmailAddress < ActiveRecord::Base
  attr_accessible :address, :person_id

  belongs_to :person

  validates :address, :person_id, presence: true
end
