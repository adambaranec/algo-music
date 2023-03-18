# Welcome to Sonic Pi v2.11.1
#Virtual Planes
#Coded by Adam Baranec
use_synth :saw
p = play :a2, amp: 0.5, release: 13, decay: 0.01, note_slide: 12
control p, note: :c4
p1 = play :fs1, amp: 0.25, attack: 3, decay: 0.5, release: 10, note_slide: 12
control p1, note: :c3
sleep 13

use_synth :dsaw
with_fx :slicer,amp_max: 1,amp_min: 0.25,phase: 0.125 do
  p2 = play :f2, amp: 1, release: 6, attack: 0.125, note_slide: 5
  control p2, note: :eb1
  sleep 6
end


use_synth :saw
p3 = play :f3, amp: 0.25, note_slide: 2, attack: 0.125, sustain: 1, release: 5
control p3, note: :f4
sleep 5

use_synth :dsaw
with_fx :slicer,amp_max: 1,amp_min: 0.25,phase: 0.125 do
  p2 = play :a1, amp: 1, release: 6, attack: 0.125, note_slide: 5
  control p2, note: :a0
  sleep 6
end