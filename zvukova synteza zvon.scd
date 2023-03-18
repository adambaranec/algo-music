s.boot
(
SynthDef(\belltone,
	{
	arg out, fund=220, two=2.23, three=3.73, four = 4.81, five=5.43, six=6.24, seven=7.35, eight=8.12;
	var env, sig;
		env= EnvGen.kr(Env.new([0, 1, 0], [0.01, 3]), doneAction: Done.freeSelf);
		sig = {(SinOsc.ar([fund * 1])) + (SinOsc.ar([fund * two])) + (SinOsc.ar([fund * three])) + (SinOsc.ar([fund * four], mul: 0.05)) + (SinOsc.ar([fund * five], mul: 0.05)) + (SinOsc.ar([fund * six], mul: 0.05)) + (SinOsc.ar([fund * seven], mul: 0.05))};
		Out.ar(out, [sig * 0.1 * env]);
}).add;
)

x = Synth(\belltone, [\fund, 260]);
x.set(\fund, 430);
x.set(\fund, 410);





{ ((Pulse.ar(110, mul: 0.05)) + (Pulse.ar(220, mul: 0.2)) + (Pulse.ar(256.4, mul: 0.35)) + (Pulse.ar(330, mul: 0.15)) + (Pulse.ar(440, mul: 0.25)) + (Pulse.ar(470, mul: 0.02)))}.play;