# LaptrackerRB
Full featured lap counter in Ruby!
    A successor to LaptrackerTK.

Objective:
Full featured lap counter for the backyard enthusiasts of RC, but could be used for any lap counting need.

MVP:
keyboard input
count laps
sort order of racers

Overview:
Launch LT_RB using 'ruby "./client/mainmenu.rb"'.

The main menu will have options to add or remove racers.
Add a track name and length in feet. Length is used to calc speed.
A track and at least one racer are required to begin the race. 

Specify the race duration in laps. By default, the duration is set to '0' which will run the race until the race is manually stopped.

Starting a race will display all registered racers names and telemetry. Pre-race no telemetry will be on screen. Once the racers key is pressed, the race starts for that racer and all telemetry will be '0'. Subsequent laps will be counted and lap times tracked. Fast times are displayed for that racer. Once the duration of the race is reached, racer telemetry for that specific racer is no longer tracked. Remaining racers can continue the race up to the specified duration.

The code architecture has attempted to comply with Model-View-Controller concepts. I'm a self-thought programmer with little experience so please be gentle with my imperfect implementation. Feedback or contributions welcome!

Requested features:
    race duration: minutes
    telemetry: add lockout delay to lap time to avoid accidental double tap
    telemetry: add metric length and speed
    race summary: save to file or database
    series championship: points system
    package: wrap into single executable
    architecture: Rails this puppy! (or gtk3)