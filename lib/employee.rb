class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, presence: true
end
