class Event < ActiveRecord::Base

	def first_action_date
		return Date.parse("#{action_day}-#{start_date.month}-#{start_date.year}");
	end

	def first_five_actions_dates
		start_date = first_action_date()
		action_array = []
		action_array << start_date
		4.times do
			action_array << start_date+interval.months
			start_date = start_date+interval.months
		end
		return action_array
	end

end
