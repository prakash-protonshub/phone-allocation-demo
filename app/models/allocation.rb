class Allocation < ApplicationRecord
	# Helpers
	extend AllocationsHelper
	
	# Validations
	validates :number, presence: true, uniqueness: true
	validate :check_number_range
	validate :number_taken

	private

	# Check if number is present in the given range i.e 1111111111..9999999999
	def check_number_range
		in_range = (1111111111..9999999999).include?(self.number)
	  unless in_range
	    errors.add(:allocation, "Given phone number is out of range")
	  end
  end

  # Check if number is already taken
  def number_taken
  	numbers_present = Allocation.pluck('number')
  	if numbers_present.include?(self.number)
  		errors.add(:allocation, "Phone number already taken")
  	end
  end
	
	# Allocate number
	def self.allocate_number(phone_number = nil)
		allocated_number = Allocation.find_by(number: phone_number)
		if allocated_number.present? 
			number = create(number: generate_random_number)
		else
			number = create(number: phone_number)
		end
		if number.errors.present?
			number = create(number: generate_random_number)
		end
		number
	end
end
