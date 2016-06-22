class Event < ActiveRecord::Base

	def holidays
		holidays_2016 = ["Jan 1", "Jan 18", "Feb 15", "May 30", "Jul 4", "Sep 5", "Oct 10", "Nov 11", "Nov 24", "Dec 26"]
		holidays_2016.map! do |day|
			Date.parse("#{day} 2016")
		end
		return holidays_2016
	end

	def first_calculated_action_date
		return Date.parse("#{action_day}-#{start_date.month}-#{start_date.year}");
	end

	def first_five_calculated_dates
		start_date = first_calculated_action_date()
		action_array = []
		action_array << start_date
		4.times do
			action_array << start_date+interval.months
			start_date = start_date+interval.months
		end
		return action_array
	end

	def first_five_action_dates
		first_five = first_five_calculated_dates()
		holdays = holidays()
		first_five.each_with_index do |date, i|
			holidays.each do |day|
				if date === day
					date -= 1.day
					first_five[i] -= 1.day
				end
			end
		end
		binding.pry
		return first_five
	end

	def next_four_action_dates
		first_five = first_five_action_dates()
		if start_date > first_five.first
			first_five.shift
		else
			first_five.pop
		end
		return first_five
	end

end
