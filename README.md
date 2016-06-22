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
3. Minus one day for holidays and saturdays, minus 2 for sundays. Then I check for holidays again, because it is possible for friday to be a holiday if the weekend is saturday sunday. It is not possible based on the bank holidays for there to be more than two holidays in a row (not including weekends).
4. Check if the start date is after or on the first action date we want to shift off the first action date. If the start date if before or on the first action date we want to pop off the last action date.
5. The result is 4 non-holiday, weekday, action dates.

----
## Testing
-There are tests written in rspeec

----
## Time to complete basic project
-3 hours
----
## Time to complete full project
-5 hours

----
## Improvements
1. Better handle the holidays all together
2. Hit an api that return holiday dates
3. Handle holidays on mondays and fridays better
4. Handle holidays that are multiple days long
5. only loop through holidays once and handle weekends at the same time
6. Add a feature test around the creation of an event
7. Add tests that aren't just content based
8. Re-work the event model to utilize methods better, stop duplicate code for buffer dates 
9. User a better naming convention
10. Style
