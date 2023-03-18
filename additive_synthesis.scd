/*

In this file I will show you, how can you try additive synthesis in SuperCollider.

It is also possible to make your sound by defining the multiplies by yourself.
For the harmonic synthesis, write to the List below only whole numbers (integers), eg. 2, 4, 5, 7.
For the inharmonic one, write only decimal numbers (floats), such as 1.343, 2.6, 3.14, 4.5454.
Or you can use both numeric types to make it more interesting.
Do not forget - use neither negative numbers nor 0, otherwise it will not play. With numbers lower than 1, the frequency will be lower than the defined one at the top.

Here you are!

*/

//harmonic synthesis
(
var freq, mul, amp;
freq = 440; //change it whatever you want
mul = 1; //the bigger number, the more harmonics, so sound is richer and sharper
amp = 1; //just the amplitude
mul.do{|i| {SinOsc.ar(freq*(i+1)) * (amp/2)}.play;}
)

//inharmonic synthesis

//this example generates pseudo-random multiplies of frequency, e.g. 1.3, 2.7, 3.965...
(
var freq, mul, amp;
freq = 440;
mul = 10;
amp = 1;
{SinOsc.ar(freq)}.play; //fundamental frequency
(mul-1).do{|i|{ {SinOsc.ar(Rand(freq*(i+1), freq*(i+2)))} * (amp/2) }.play;} //other frequencies
)


//write multiplies to the List
(
var freq, list, elements;
freq = 440;
list = List[];
// computer finds out how many numbers did you write to the list
elements = list.size;
// and here we go
elements.do{|i| {SinOsc.ar(freq*list[i])}.play;}
)

//© Coded by Adam Baranec, 2021