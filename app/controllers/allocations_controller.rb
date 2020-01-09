class AllocationsController < ApplicationController
	def index
		numbers = Allocation.all
		if numbers.present? 
			render json: {numbers: numbers, status: :success, message: "List of all the numbers"}
		else
			render json: {status: :failure, message: "Failed to find numbers"}
		end
	end

	def specific_number_allocation
		number = Allocation.allocate_number(params[:id])
		if number.present?
		 	render json: {number: number, status: :success, message: "Number allocated successfully"}
		else
		  render json: {status: :failure, message: "Failed to allocate number"}
		end
	end

	def create
		if number = Allocation.allocate_number
			render json: {number: number, status: :success, message: "Number allocated successfully"}
		else
			render json: {status: :failure, message: "Failed to allocate number"}
		end
	end

end
