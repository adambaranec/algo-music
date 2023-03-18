# Welcome to Sonic Pi v2.11.1
# Spherical
# Coded by Adam Baranec
use_bpm 50
use_transpose -0.5


live_loop :bass do
  with_fx :reverb, mix:0.2 do
    use_synth :hollow
    play :ab2, amp: 0.5, attack: 4, decay: 20 ,sustain: 20, release: 16
    play :eb3, amp: 0.5, attack: 4, decay: 20 ,sustain: 20, release: 16
    sleep 20
  end
end



live_loop :chords do
  with_fx :reverb, mix:0.2 do
    use_synth :hollow
    use_synth_defaults amp: 0.5, attack: 2, decay: 2, sustain: 2, release: 2
    play chord(:ab4, :m)
    sleep 8
    play chord(:gb4, :M)
    sleep 8
    play chord(:cb4, :M, invert: 2)
    sleep 8
    play chord(:eb4, :m, invert: 1)
    sleep 8
  end
end



at 32 do
  live_loop :melody do
    with_fx :echo,phase: 0.25  do
      use_synth_defaults cutoff: 40
      use_synth :dsaw
      play chord([:ab3, :eb4, :ab4, :eb5].choose, :minor).choose, amp: 0.25, release: 4, cutoff: rrand(40, 60)
      sleep 8
    end
  end
end

live_loop :ambidrone do
  sample :ambi_lunar_land, amp: 0.3
  sleep 32
end

at 158 do
  live_loop :melody2 do
    use_synth :beep
    play_pattern_timed [:db6, :eb6], [1], amp: 0.25, release: [1.1, 1.6].ring.tick
    wait 30
  end
end

live_loop :counter do |idx|
  idx = idx + 1
  print idx
  sleep 1
  idx
end

































