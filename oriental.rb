use_bpm 120

live_loop :line do
  use_synth :dsaw
  use_synth_defaults release: 0.5
  play_pattern_timed [:c2, :c3], [0.25], cutoff: (line 50, 130, steps: 8).tick
end

live_loop :line2 do
  use_synth :dsaw
  use_synth_defaults decay: 8
  tones = [:c4, :db4, :eb4, :e4, :g4]
  with_fx :slicer, phase: 0.25, wave: 1 do
    #play tones.choose, cutoff: 100, amp: 0.8
    sleep 4
  end
end

live_loop :line3 do
  use_synth :saw
  use_synth_defaults cutoff: 80, decay: 8, attack: 0.01
  tones = [:c4, :e4, :eb4, :db4, :g4, :c5]
  with_fx :flanger, decay: 4, amp: 1 do
    play tones.tick(:mel)
    sleep 8
  end
end

live_loop :basic do
  sample :bd_ada, amp: 2
  sleep 1
  2.times do
    sample :sn_dolf
    sleep 0.5
  end
end


live_loop :something do
  sample :tabla_dhec if spread(3, 10).tick(:a)
  sample :tabla_ghe1 if spread(3, 7).tick(:b)
  sample :tabla_ke1 if spread(1, 6).tick(:c)
  sample :tabla_na_o if spread(6, 10).tick(:d)
  sleep 0.25
end

live_loop :piano do
  use_synth :piano
  play [:c4, :e4, :g4, :bb4, :db5].choose, release: 0.5, amp: 3
  sleep 0.25
end

live_loop :piano2 do
  use_synth :piano
  #play [:c4, :e4, :g4, :bb4, :db5].choose, release: 0.5
  sleep 0.25
end

live_loop :tones do
  with_fx :distortion, distort: 0.3 do
    with_fx :gverb, dry: rrand(0.3, 0.7) do
      #sample :ambi_glass_rub, rate: [1, 0.7, 0.85].choose, amp: 1
      sleep 8
    end
  end
end

live_loop :hum do
  #sample :ambi_sauna, finish: 0.8
  sleep 8
end














