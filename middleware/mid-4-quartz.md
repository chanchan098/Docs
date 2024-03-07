# mid-4-scheduler-quartz.md

# Quartz (2.3.0)

<https://www.quartz-scheduler.org/documentation/quartz-2.3.0/tutorials/>


# Lesson 2: The Quartz API, Jobs And Triggers

## The Quartz API

The key interfaces of the Quartz API are:
- Scheduler - the main API for interacting with the scheduler.
- Job - an interface to be implemented by components that you wish to have executed by the scheduler.
- JobDetail - used to define instances of Jobs.
- Trigger - a component that defines the schedule upon which a given Job will be executed.
- JobBuilder - used to define/build JobDetail instances, which define instances of Jobs.
- TriggerBuilder - used to define/build Trigger instances.


# Lesson 5: SimpleTrigger

if you need to have a job execute exactly once at a specific moment `in time`, or at a specific moment in time followed by repeats `at a specific interval`.

For example, if you want the trigger to fire at exactly 11:23:54 AM on January 13, 2015, or if you want it to fire at that time, and then fire five more times, every ten seconds.


# Lesson 6: CronTrigger

if you need a job-firing schedule that recurs based on calendar-like notions,

With CronTrigger, you can specify firing-schedules  
such as “every Friday at noon”, or “every weekday and 9:30 am”, or even “every 5 minutes between 9:00 am and 10:00 am on every Monday, Wednesday and Friday during January”.

CronTrigger has a `startTime` which specifies when the schedule is in force, and an (optional) `endTime` that specifies when the schedule should be discontinued.

## Cron Expressions

# Lesson 7: TriggerListeners and JobListeners

Listeners are objects that you create to perform actions based on **events** occurring *within the scheduler*.  
TriggerListeners receive events `related to triggers`, and JobListeners receive events `related to jobs`.

## Trigger-related events

- trigger firings
- trigger mis-firings
- trigger completions 

## Job-related events 

- is about to be executed  
- has completed execution

## 📖Using Your Own Listeners

simply create an object that implements the `org.quartz.TriggerListener` and/or `org.quartz.JobListener` interface.

class could also extend the class `JobListenerSupport` or `TriggerListenerSupport` and simply override the events you’re interested in

# CronTrigger Tutorial

## Format




|Field Name	|Mandatory	|Allowed Values|	Allowed Special Characters
|---:|:---|---:|:---|
Seconds	        |YES	|0-59	            |, - * /
Minutes	        |YES	|0-59	            |, - * /
Hours	        |YES	|0-23	            |, - * /
Day of month	|YES	|1-31	            |, - * ? / L W
Month	        |YES	|1-12 or JAN-DEC	|, - * /
Day of week	    |YES	|1-7 or SUN-SAT	    |, - * ? / L #
Year	        |NO	    |empty, 1970-2099	|, - * /

## Special characters
<span style='font-size: 15px;'>**\*(“all values”)**</span>  
used to select all values within a field. For example, “*” in the minute field means “every minute”

<span style='font-size: 15px;'>**? (“no specific value”)**</span>  
useful when you need to specify something in one of the two fields in which the character is allowed, but not the other.

For example, if I want my trigger to fire on a particular day of the month (say, the 10th), <u>but don’t care what day of the week that happens to be</u>, I would put “10” in the day-of-month field, and “?” in the day-of-week field.

<span style='font-size: 15px;'>**-**</span>  
used to specify ranges.  

For example, “10-12” in the hour field means “the hours 10, 11 and 12”.

<span style='font-size: 15px;'>**,**</span>  
used to specify additional values.  

For example, “MON,WED,FRI” in the day-of-week field means “the days Monday, Wednesday, and Friday”.

<span style='font-size: 15px;'>**/**</span>  
used to specify increments.

For example, “0/15” in the seconds field means “the seconds 0, 15, 30, and 45”. And “5/15” in the seconds field means “the seconds 5, 20, 35, and 50”. 

<span style='font-size: 15px;'>**L (“last”)**</span>  
has different meaning in each of the two fields in which it is allowed. 

For example, the value “L” in the `day-of-month` field means “the last day of the month” - day 31 for January, day 28 for February on non-leap years.

If used in the `day-of-week` field by itself, it simply means “7” or “SAT”.

But if used in the day-of-week field *after another value*, it means “the last xxx day of the month” - for example “6L” means “the last friday of the month”. 

*an offset*  
You can also specify an offset from the last day of the month, such as “L-3” which would mean the third-to-last day of the calendar month.

<span style='font-size: 15px;'>**W (“weekday”)**</span>  
used to specify the weekday (Monday-Friday) nearest the given day. 

As an example, if you were to specify “15W” as the value for the `day-of-month` field, the meaning is: “the nearest weekday to the 15th of the month”. So if the 15th is a Saturday, the trigger will fire on Friday the 14th. If the 15th is a Sunday, the trigger will fire on Monday the 16th. If the 15th is a Tuesday, then it will fire on Tuesday the 15th. 

However if you specify “1W” as the value for day-of-month, and the 1st is a Saturday, the trigger will fire on Monday the 3rd, as it will not ‘jump’ over the boundary of a month’s days. 


<span style='font-size: 15px;'>**#**</span>  
used to specify “the nth” XXX day of the month.  
For example, the value of “6#3” in the `day-of-week` field means “the third Friday of the month” (day 6 = Friday and “#3” = the 3rd one in the month). 

Other examples: “2#1” = the first Monday of the month and “4#5” = the fifth Wednesday of the month.  

Note that if you specify “#5” and there is not 5 of the given day-of-week in the month, then no firing will occur that month.
