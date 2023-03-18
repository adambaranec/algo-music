use_bpm 144
# Droplets
# Coded by Adam Baranec
# 2018

live_loop :echoes do
  use_synth :square
  play ([:b3, :cs4, :ds4, :e4, :fs4, :gs4]).choose, cutoff: rrand(40, 100), amp: 0.5, attack: 0, release: 4, cutoff_max: 100
  sleep [0.25, 0.5].choose
end

live_loop :bassdrum do
  sample :drum_cymbal_pedal
  sleep 2
end

live_loop :multibeat do
  use_random_seed 100
  8.times do
    sample :bd_haus,amp: 0.5 if one_in(5)
    sample :sn_dub,amp: 0.5 if one_in(8)
    sleep 0.25
  end
end

use_synth :fm
use_synth_defaults attack: 0.01, release: 0.01
4.times do
  4.times do
    play_pattern_timed [:cs3, :gs2, :b2], [3, 1, 4]
  end
  4.times do
    play_pattern_timed [:cs3, :ds3, :e3], [2, 1.5, 4.5]
  end
  wait 8
  4.times do
    play_pattern_timed [:fs2, :e2, :gs2], [2, 1.5, 4.5]
  end
  4.times do
    play_pattern_timed [:fs2, :b2, :gs2], [3, 1, 4]
  end
  wait 8
end
