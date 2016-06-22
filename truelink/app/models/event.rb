class Event < ActiveRecord::Base

	def first_start_date
		return Date.parse("#{action_day}-#{start_date.month}-#{start_date.year}");
	end

	def first_five_calculated_dates
		start_date = first_start_date()
		action_array = []
		action_array << start_date
		4.times do
			action_array << start_date+interval.months
			start_date = start_date+interval.months
		end
		return action_array
	end

	def next_four_action_dates
		first_five = first_five_calculated_dates()
		if start_date > first_five.first
			first_five.shift
		else
			first_five.pop
		end
		return first_five
	end

end
