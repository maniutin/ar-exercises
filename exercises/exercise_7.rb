require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200}
  validates :belongs_to, presence: true
end

class Store
  validates :name, presence: true, length: {minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :mens_apparel, presence: true, unless: ->(store){store.womens_apparel.present?}
  validates :womens_apparel, presence: true, unless: ->(store){store.mens_apparel.present?}
end

@new_store_name = Store.create(name: gets.chomp)
puts @new_store_name.errors.full_messages