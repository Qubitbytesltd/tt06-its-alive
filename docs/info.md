<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Why is it called It's Alive? made within the last few days of the shuttle and 24 hours to learn Verilog.
If it works, it should play a cool tune over a speaker or piezo buzzer 

## How to test

The clock must be set to 100khz or else the speed and pitch of the song will be affected.

the reset button will restart the song.

The LED segment number will indicate the current song part, which starts at 4, finishes at 6, and loops around.
The LED segment dot, indicates processor activity.

Connect a speaker or piezo buzzer to ``uio[0]`` bi-directional pin (output)\
``Clock Speed: 100Khz``\
``Reset Button: restarts tune``\
``LED Segment: song/processor status``

## External hardware

speaker or piezo buzzer 
