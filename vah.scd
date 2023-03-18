s.boot

s.meter;



(
	SynthDef.new(\noise, {
			arg out=0;
	var env = EnvGen.kr(Env([0.01, 0.25, 0.25, 0], [4, 20, 6]), doneAction: 30);
	var sig = Pan2.ar({BrownNoise.ar}, SinOsc.kr(0.25).range(-1, 1)) * env * 0.25;
			Out.ar(out, sig);
}).add;
)



s.prepareForRecord;

s.record;
x = Synth.new(\noise);


s.pauseRecording;
s.stopRecording;