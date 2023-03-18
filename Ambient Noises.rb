#pitch = 1.025
lowr = 0.5
hir = 1.5
lpan = -1
rpan =  1

load_sample :ambi_haunted_hum

at 12 do
  live_loop :ambipiano  do
    #pitch = pitch - 0.025
    sample :ambi_piano, rate: rrand(lowr, hir),pan: rrand(lpan, rpan)
    sleep 4
  end
end

live_loop :ambient do
  #sample sample_names(:ambi).choose, rate: rrand(lowr, hir), env_curve: ([0, 1, 2, 3, 4]).choose, amp: rrand(lowr, hir), pan: rrand(lpan, rpan)
  sleep 32
end

live_loop :ambient2 do
  #sample :ambi_haunted_hum, rate: [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1].tick, finish: 0.8, amp: 0.5
  sleep rrand_i(64, 8)
end

live_loop :ambient3 do
  with_fx :echo, phase: 0.5 do
    sample :vinyl_backspin, rate: 0.05, amp: 0.25, env_curve: ([0, 1, 2, 3, 4]).choose, pan: rrand(lpan, rpan)
    sleep 64
  end
end



