s.reboot;
s.options.numOutputBusChannels = 2;
s.meter;

// definicie pre jednotlive utvary

(
SynthDef(\ciara, {
	arg cas, f1, f2;
	var stupanie = Line.kr(f1, f2, cas, doneAction: 2);
	var env = EnvGen.kr(Env([0, 1, 1, 0], [0.01, cas - 0.02, 0.01]));
	var sig =SinOsc.ar(stupanie) * env * 0.2;
	Out.ar(0, sig ! 2);

}).add;



SynthDef(\kruznica,
	{
		arg spodna, stredna, vrchna, cas, amp;
		var pohyb_hore = EnvGen.kr(Env([stredna, vrchna, stredna], [cas, cas], -3.75), doneAction: 2);
		var pohyb_dole  = EnvGen.kr(Env([stredna, spodna, stredna], [cas, cas], -3.75), doneAction: 2);
		var hore = SinOsc.ar(pohyb_hore);
		var dole = SinOsc.ar(pohyb_dole);
		var sig = [hore + dole];
		Out.ar(0, sig ! 2);

}).add;



SynthDef(\kruh,
	{
		arg min_amp, max_amp, cas;
		var amp = EnvGen.kr(Env([min_amp, max_amp, min_amp], [cas, cas]), doneAction: 2);
		var sig = WhiteNoise.ar * amp;
		Out.ar(0, sig ! 2);

}).add;



SynthDef(\stvoruholnik_prazdny, {
	arg dlzka, f1, f2, amp_noise;
	var rel = EnvGen.kr(Env([0, 1, 1, 0], [0.01, dlzka - 0.02, 0.01]), doneAction: 2);
	var vrchna_strana = SinOsc.ar(Line.kr(f1, f1, dlzka, doneAction: 2)) * 0.2 * rel;
	var spodna_strana = SinOsc.ar(Line.kr(f2, f2, dlzka, doneAction: 2)) * 0.2 * rel;
	var sig = [vrchna_strana + spodna_strana];
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\stvoruholnik_prazdny_sikmy, {
	arg v1, v2, v3, v4, d1, d2;
	var abc = EnvGen.kr(Env([v1, v2, v3], [d1, d2]), doneAction: 2);
	var adc = EnvGen.kr(Env([v1, v4, v3], [d2, d1]), doneAction: 2);
	var abc_sig = SinOsc.ar * abc;
	var adc_sig = SinOsc.ar * adc;
	var sig = [abc_sig + adc_sig];
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\stvoruholnik_plny, {
	arg dlzka, hlasitost;
	var env, sig;
	env = EnvGen.kr(Env([0, hlasitost, hlasitost, 0], [0.001, dlzka - 0.002, 0.001]), doneAction: 2);
	sig = BrownNoise.ar * env;
		Out.ar(0, sig ! 2);
}).add;



SynthDef(\stvoruholnik_plny_sikmy, {
	arg dlzka, hlasitost, cut1, cut2;
	var env, sig;
	env = EnvGen.kr(Env([0, hlasitost, hlasitost, 0], [0.001, dlzka - 0.002, 0.001]), doneAction: 2);
	sig = RLPF.ar(BrownNoise.ar, Line.kr(cut1, cut2, dlzka, doneAction: 2)) * env;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\rybicka, {
	arg f1, f2, f3, f4, f5, f6, dlzka;
	var ciara1, ciara2, sig1, sig2, sig;
	ciara1 = EnvGen.kr(Env([f1, f2, f3], [dlzka, dlzka]), doneAction: 2);
	ciara2 = EnvGen.kr(Env([f4, f5, f6], [dlzka, dlzka]), doneAction: 2);
	sig1 = SinOsc.ar * ciara1;
	sig2 = SinOsc.ar * ciara2;
	sig = [sig1 + sig2];
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\zvisla_ciara, {
	arg amp;
	var env = EnvGen.kr(Env.perc(0, 0.01), doneAction: 2);
	var sig = BrownNoise.ar * env * 0.5;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\krivka, {
arg dlzka, f1, f2, cas;
var env = EnvGen.kr(Env([f1, f2], [cas], 'exp'), doneAction: 2);
var sig = SinOsc.ar * env;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\krivka_s_ciarkou, {
	arg f1, f2, f3, cas1, cas2;
	var krivka = EnvGen.kr(Env([f1, f2], [cas1], 'exp'), doneAction: 2);
	var ciarka = EnvGen.kr(Env([f1, f3], [cas2]), doneAction: 2);
	var sig_krivka = SinOsc.ar * krivka;
	var sig_ciarka = SinOsc.ar * ciarka;
	var sig = [sig_krivka + sig_ciarka];
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\zahnuty_tesak, {
arg f1, f2, f3, cas1, cas2;
	var krivka1 = EnvGen.kr(Env([f1, f2], [cas1], 1), doneAction: 2);
	var krivka2 = EnvGen.kr(Env([f1, f3], [cas2], 1), doneAction: 2);
	var s_krivka1 = SinOsc.ar * krivka1;
	var s_krivka2 = SinOsc.ar * krivka2;
	var sig = [s_krivka1 + s_krivka2];
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\trojuholnik_plny, {
	arg cas, amp;
	var env = EnvGen.kr(Env([0, amp, 0], [cas, 0.001]), doneAction: 2);
	var sig = BrownNoise.ar * env;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\hranata_fermata, {
	arg cas1, cas2, f1, f2, f3;
	var env = EnvGen.kr(Env([f1, f2, f3], [cas1, cas2]), doneAction: 2);
	var sig = SinOsc.ar * env;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\bodka, {
	arg cas, freq;
	var env = EnvGen.kr(Env.perc(releaseTime: cas), doneAction: 2);
	var sig = SinOsc.ar(freq) * env;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\plny_obdlznik_sikmy, {
	arg cas, amp1, amp2;
	var amp = EnvGen.kr(Env([0, amp1, amp2, 0], [0.001, cas - 0.002, 0.001]), doneAction: 2);
	var sig = BrownNoise.ar * amp;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\kruznicokruh,
	{
		arg spodna, stredna, vrchna, cas, min_amp, max_amp, cas2;
		//hlasitosti
		var cas_hore = EnvGen.kr(Env([1, 0], [cas * 2 / 3]), doneAction: 2);
		var cas_dole = EnvGen.kr(Env([1, 0], [cas / 2]), doneAction: 2);
		var cas_kruh = EnvGen.kr(Env([0, 0, 1, 0], [cas / 2, cas / 4, cas / 4]), doneAction: 2);
		//parametre pre kruznicu
		var pohyb_hore = EnvGen.kr(Env.circle([stredna, vrchna, stredna], [cas, cas], -3.75), doneAction: 2);
		var pohyb_dole  = EnvGen.kr(Env.circle([stredna, spodna, stredna], [cas, cas], 3.75), doneAction: 2);
		var hore = SinOsc.ar(pohyb_hore) * cas_hore;
		var dole = SinOsc.ar(pohyb_dole) * cas_dole;
		var kruznica = [hore + dole];
		//parametre pre kruh
		var kruh = BrownNoise.ar * cas_kruh;
		//signal
		var sig = [kruznica + kruh];
		Out.ar(0, sig ! 2);

}).add;



SynthDef(\vlnovka1, {
arg f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, dlzka;
	var env = EnvGen.kr(Env([f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12], [dlzka, dlzka, dlzka, dlzka, dlzka, dlzka, dlzka, dlzka, dlzka, dlzka, dlzka], 'sin'), doneAction: 2);
	var amp = EnvGen.kr(Env([0, 1, 1, 0], [0.01, dlzka * 10 - 0.02, 0.01]), doneAction: 2);
	var sig = SinOsc.ar(env) * amp;
	Out.ar(0, sig ! 2);
}).add;



SynthDef(\kruznica2,
	{
		arg spodna, stredna, vrchna, cas, amp;
		var pohyb_hore = EnvGen.kr(Env([stredna, vrchna, stredna], [cas, cas], -3.75), doneAction: 2);
		var pohyb_dole  = EnvGen.kr(Env([stredna, spodna, stredna], [cas, cas], -3.75), doneAction: 2);
		var hlasitost = EnvGen.kr(Env([1, 0], [cas * 2 / 6]), doneAction: 2);
		var hore = SinOsc.ar(pohyb_hore) * hlasitost;
		var dole = SinOsc.ar(pohyb_dole) * hlasitost;
		var sig = [hore + dole];
		Out.ar(0, sig ! 2);

}).add;




SynthDef(\vlnovka2, {
	arg f1, f2, f3, f4, f5, f6, dlzka1, dlzka2, dlzka3, dlzka4, dlzka5;
	var env = EnvGen.kr(Env([f1, f2, f3, f4, f5, f6], [dlzka1, dlzka2, dlzka3, dlzka4, dlzka5], 'sin'), doneAction: 2);
	var sig = SinOsc.ar * env * 0.2;
	Out.ar(0, sig ! 2);
}).add;
)

// hra

(
Pbindef(\ciary,
	\instrument, \ciara,
	\cas, Pseq([29, 28.5, 26, 0.1, 3.1, 21.5], 1),
	\f1, Pseq([350, 150, 370, 750, 200, 130], 1),
	\f2, Pseq([500, 170, 60, 480, 180, 135], 1),
	\dur, Pseq([0.5, 1.5, 2.5, 1, 3, 20.5], 1)
).play;
)


(
~pokus =
fork{
Synth(\vlnovka1, [\f1, 500, \f2, 510, \f3, 490, \f4, 500, \f5, 480, \f6, 490, \f7, 470, \f8, 480, \f9, 460, \f10, 470, \f11, 450, \f12, 460, \dlzka, 0.75]);
Synth(\stvoruholnik_prazdny, [\dlzka, 0.5, \f1, 190, \f2, 250]);
Synth(\zvisla_ciara);
Synth(\kruh, [\min_amp, 0, \max_amp, 0.05, \cas, 0.17]);
0.02.wait;
Synth(\kruh, [\min_amp, 0, \max_amp, 0.1, \cas, 0.21]);
1.wait;
Synth(\zvisla_ciara);
Synth(\ciara, [\cas, 29.5, \f1, 350, \f2, 500]);
Synth(\ciara, [\cas, 30, \f1, 150, \f2, 170]);
	0.5.wait;
Synth(\stvoruholnik_plny, [\dlzka, 1, \hlasitost, 0.2]);
1.wait;
Synth(\ciara, [\cas, 26, \f1, 370, \f2, 60]);
1.wait;
Synth(\ciara, [\cas, 0.1, \f1,750, \f2, 480]);
1.5.wait;
	Synth(\kruznica);
Synth(\ciara, [\cas,  3.8, \f1, 200, \f2, 180]);
1.wait;
Synth(\kruznica, [\stredna, 300, \spodna, 250, \vrchna, 350, \cas, 3]);
0.5.wait;
Synth(\ciara, [\cas, 23, \f1, 130, \f2, 135]);
}
)

Synth(\vlnovka1, [\f1, 500, \f2, 510, \f3, 490, \f4, 500, \f5, 480, \f6, 490, \f7, 470, \f8, 480, \f9, 460, \f10, 470, \f11, 450, \f12, 460, \dlzka, 0.75]);
( ~kruznicokruh =
fork{
Synth(\kruznica2,  [\spodna, 110 , \stredna, 220, \vrchna, 440, \cas, 2/3]);
Synth(\kruh, [\min_amp, 0, \max_amp, 0.03, \cas, 1/5]);
}
)