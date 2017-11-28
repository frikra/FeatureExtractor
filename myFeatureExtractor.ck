// My Feature Extractor
// author: frikra November 2017
// I created in ChucK  my own feature extractor
// Goal:
// Input: microphone signal 
// compute Fast Fourier Transformation
// get strength of each frequency
// send these values via OSC to WEKINATOR
//
// I used this extractor to classify the vocals a,e,i,o,u
// WEKINATOR:
// inputs: size (128)
// outputs: 1 classifier with 5 classes
// model-type: 1-Nearest Neighbor



// Signal chain:  (adc => Gain g don't work)
adc.left => Gain g =>dac;
adc.right => g;

// Fast Fourier Transformation
g => FFT fft => blackhole;
// set parameters
128 => int size; // size= # inputs WEKINATOR
2*size => fft.size;
Windowing.hamming(size) => fft.window;

// OSC Sender
OscOut  oscout;
oscout.dest("localhost", 6448);

// Buffer
float buf[size];

// main loop **********************************
while( true )
{   size::samp => now;
    // get strength of each frequency
    fft.upchuck();
    fft.fvals() @=> buf;
    // create  OSC-Message
    oscout.start("/wek/inputs");
    //<<< "****buffer***">>>;
    for (0 => int i; i < buf.cap(); i++)
    {
        oscout.add(buf[i]);
        //<<< buf[i]>>>;
    }
    // send message
    oscout.send();
    
}