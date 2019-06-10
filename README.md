# PvZ
Plants vs Zombies


## Knowledge Gains

### 1. Timer

1. Initialize Timer in the ready function:
+ timer = Timer.new()
+ timer.wait_time = [wait_time_in_seconds]
+ timer.connect("timeout", self, "on_timeout_complete")
    - -> connect the timer's timeout function to "on_timeout_complete" 
+ add_child(timer)
+ timer.start()

2. Do something with the "on_timeout_complete" function
+ func on_timeout_complete():
    + shoot in an interval:
        - shoot()
        - timer.start()
    + set a cooldown to false:
        - cooldown = false

