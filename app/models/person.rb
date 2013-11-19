class Person < ActiveRecord::Base
  include Contact

  attr_accessible :first_name, :last_name

  validates :first_name, :last_name, presence: true

end
