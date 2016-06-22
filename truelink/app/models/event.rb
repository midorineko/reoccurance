class Event < ActiveRecord::Base

	def first_action_date
		return Date.parse("#{action_day}-#{start_date.month}-#{start_date.year}");
	end

end
