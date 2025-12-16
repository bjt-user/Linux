## general info

https://taskwarrior.org/docs/

## usage

#### add a wait to an existing task

```
task 20 modify wait:2025-05-19
```

This task will then not be visible anymore until that date arrives.

#### show waiting tasks (scheduled for the future)

```
task waiting
```

#### add dependency

Make task 2 dependend on task 3:
```
task 2 modify depends:3
```
This means that the task 3 should be completed before task 2.

Task 3 will move up in urgency and task 2 will be reduced in urgency.\
Also colors change.
