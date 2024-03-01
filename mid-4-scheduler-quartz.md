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


# Lesson 6: CronTrigger

if you need a job-firing schedule that recurs based on calendar-like notions,

With CronTrigger, you can specify firing-schedules  
such as “every Friday at noon”, or “every weekday and 9:30 am”, or even “every 5 minutes between 9:00 am and 10:00 am on every Monday, Wednesday and Friday during January”.

CronTrigger has a `startTime` which specifies when the schedule is in force, and an (optional) `endTime` that specifies when the schedule should be discontinued.

## Cron Expressions


# CronTrigger Tutorial
