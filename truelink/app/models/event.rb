class Event < ActiveRecord::Base

	def holidays
		holidays_2016 = ["Jan 1", "Jan 18", "Feb 15", "May 30", "Jul 4", "Sep 5", "Oct 10", "Nov 11", "Nov 24", "Dec 26"]
		holidays_2017 = ["Jan 2", "Jan 16", "Feb 20", "May 29", "Jul 4", "Sep 4", "Oct 9", "Nov 11", "Nov 23", "Dec 25"]
		holidays_2016.map! do |day|
			Date.parse("#{day} 2016")
		end
		holidays_2017.map! do |day|
			Date.parse("#{day} 2017")
		end
		return holidays_2016 + holidays_2017
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
			if first_five[i].cwday === 6
				first_five[i]-=1.day
			elsif first_five[i].cwday === 7
				first_five[i]-=2.day
			end
			holidays.each do |day|
				if first_five[i] === day
					first_five[i] -= 1.day
				end
			end
		end
		return first_five
	end

	def buffer_dates
		first_five = first_five_action_dates()
		holdays = holidays()
		first_five.map! do |date|
			date-buffer.day
		end
		first_five.each_with_index do |date, i|
			holidays.each do |day|
				if date === day
					date -= 1.day
					first_five[i] -= 1.day
				end
			end
			if first_five[i].cwday === 6
				first_five[i]-=1.day
			elsif first_five[i].cwday === 7
				first_five[i]-=2.day
			end
			holidays.each do |day|
				if first_five[i] === day
					first_five[i] -= 1.day
				end
			end
		end
		if start_date > first_five.first
			first_five.shift
		else
			first_five.pop
		end
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
