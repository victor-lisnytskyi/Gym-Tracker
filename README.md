# Gym-Tracker

## Description

time tracker for rest time between gym workout sets, designed specifically for my needs actually

i usually rest around 60-70 seconds between each set
you can use plus and minus buttons when timer is not running to modify how many seconds are you going to rest

timer is launced after first set (in gym), so there is always 1 on the top and it does +1 after rest timer completes - that part counts how many exercises you've done, not how many times have you rested 

Reset button will stop the timer, change it back to starting point and reset sets to 1
there is no Stop button as I do not stop my rest in gym, you cannot do that - however, I may add it later on

progress bar is used to show visual time left

there is sound playing once timer reaches 0


## Frameworks/Features used

AVAudioPlayer from AVFoundation to play audio
Timer()
UIProgressView as progress bar
UILabel
UIButton
AutoLayout (Stack View, View, Constrains)
