My Feature Extractor
======================================================
author: frikra November 2017

I created in ChucK  my own feature extractor

Goal:
Input: microphone signal 
compute Fast Fourier Transformation
get strength of each frequency
send these values via OSC to WEKINATOR


I used this extractor to classify the vocals a,e,i,o,u
WEKINATOR:
inputs: size (128)
outputs: 1 classifier with 5 classes
model-type: 1-Nearest Neighbor


I used this extractor to classify the vocals a,e,i,o,u
Result after short training:
a,e good classification
o,u passable classification
i bad classification
watch my video : video.MOV

