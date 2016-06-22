# Truelink Challange

----
## Recurring Events
Recurring events takes in events and tells you when the next 4 valid call dates are. 


----
## Setting up an event
1. Title the event
2. Start date, when  the event should turn on
3. Interval of months it should run
4. Action day, the day of the month you would ideally have the action completed on

----
## Index and Show Pages
Index Page: Contains each events information as well as the First Action Date.

Show Page: Will show the details of the event as well as the next four Action Dates in detail. 

----
## How it works
1. Build the first Action Date based on startDate month, year, and actionDay
2. Find the next 5 calculated action dates
3. Minus one day for holidays and saturdays, minus 2 for sundays.(It is possible to do it this way because it is impossible with the bank holidays to have a friday then monday holiday)
4. Check if the start date is after or on the first action date we want to shift off the first action date. If the start date if before or on the first action date we want to pop off the last action date.
5. The result is 4 non-holiday, weekday, action dates.

----
## Testing
-There are tests written in rspeec

----
## Time to complete basic project
-3 hours
