# Myo Music GarageBand midi controller
Gesture Based UI project to make music with the Myo Armband.

![GarageBand](http://i.imgur.com/nYGpHrY.png)

Contents:
---------
1. About
2. Purpose of the Application
3. Gestures used
4. Hardware
5. Architecture
6. Conclusions and recommendations

1 - About
---
This application has been developed for my Gesture Based UI module, the aim of the project is to demonstrate modern gesture based UI techniques.

The specific aim of my application is to convert human gesture input into MIDI controls for a software musical instrument.

2 - Purpose
---
The purpose of my application is to allow  user to control a midi instrument in GarageBand (the Mac OSX Digital Audio Workstation). I selected GarageBand as the myo midi API only works on Mac and the only DAW I have on Mac is GarageBand, although this did lead to some limitations on my project.

I decided to try and make the instrument as user friendly as possible so it actually locks the input to a particular scale (it defaults to D minor, since I write a lot of songs in D Minor as a Drop-D tuned guitar naturally gives itself to this key), however, again this leads to some limitations in that a user can't play some of the modal scales or use a Natural Harmonic Minor or something like that. In total, I thought this approach was aceptable since picking out individual notes using the gesture input is quite difficult.

3 - Gestures Used
---
The gesures used in the app are as follows:
* Pitch: The pitch of the users arm (the angle it makes with the ground) determines the note that will be played, naturally, a higher arm pitch leads to a higher musical pitch.
* Fist: Making a fist will start playing notes
* Spread Fingers: Spreading your fingers will stop notes from playing (this is dependent on the instrument type as some seem to have infinite fade out)
* Wave In: This will drop the notes available by 1 octave (on the store version I have it dropping it only a semi tone so that all keys are accessible)
* Wave Out: This operates just as the Wave In gesture except it raises the available notes rather than drops them
* Vibration feedback: there is haptic feedback when the user changes the octave (wave in and out gestures) as I found it was easy to do by accident, I opted for a medium vibration when the notes go up and a short one when the notes go down

4 - Hardware
---
The only specific hardware I am using is the Myo Armband. Generally I have found it to be quite good for this purpose, the notes selected change without any noticeable hardware latency, however there is a noticeable latency when performing the hand gestures which prevents precsion timing in stopping notes etc.

There is also a requirement for the Mac platform as the Myo Midi API is only supported on OSX.

5 - Architecture
---
The basic structure  of my application is quite simple, it exists as a Myo Script (which is in the Lua programming language) which deals with the gesture and orientation events and becomes active when GarageBand is the application in the foreground on the users computer. It then uses the Myo Midi API which wraps around the Midi message standard which can be seen [here](https://www.midi.org/specifications/item/table-1-summary-of-midi-message), then it is required that there be a Midi Instrument selected in GarageBand.

Not all instruments will be suited to this controller as different instruments respond differently to input, my application sends noteOn messages on each periodic update, which works quite well with most lead instruments but not generally with orchestral pads or ensembles.

6 - Conclusions and Recommendations
---
I discovered some limitations with GarageBand which limited what I wanted to do wtih the application: It listens on all midi channels for input simultaenously which meant that I couldn'tput multiple software instruments in the project listening on different channels, which is poosible in other DAWs like Ableton Live (which is quite expensive). I had intended to use a gesture like held closed fist to indicate that the user wanted a harmony and then I would have had the second instrument play a 3rd harmony to whatever the first instrument was playing.

I also found that the Myo has quite noticeable latency on recognising gestures which makes it hard to do precise timing for music (I find anything over 150ms latency to be practically unworkable when dealing with other instruments.)

Regardless, I found this application to be quite fun to play with and have enjoyed showing it off to friends, so I hope the demonstration goes just as well.

