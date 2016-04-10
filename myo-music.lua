scriptId = 'com.thalmic.schemes.myomusic'
scriptTitle = "Myo Music"

myoMinPitch = 0;
myoMaxPitch = math.pi;
myoPitchRange = myoMaxPitch - myoMinPitch;

scaleNotes = {}

scaleNotes[0] = 50;
scaleNotes[1] = 52;
scaleNotes[2] = 53;
scaleNotes[3] = 55;
scaleNotes[4] = 57;
scaleNotes[5] = 58;
scaleNotes[6] = 60;
scaleNotes[7] = 62;
scaleNotes[8] = 64;
scaleNotes[9] = 65;
scaleNotes[10] = 67;
scaleNotes[11] = 69;
scaleNotes[12] = 70;
scaleNotes[13] = 72;
scaleNotes[14] = 74;
scaleNotes[15] = 76;
scaleNotes[16] = 77;
scaleNotes[17] = 79;
scaleNotes[18] = 81;
scaleNotes[19] = 83;
scaleNotes[20] = 84;
scaleNotes[21] = 86;

newMin = 0;
newMax = table.getn(scaleNotes);
newRange = newMax - newMin;

playing = false

function onPoseEdge(pose, edge)
  if pose == "fingersSpread" then
    playing = (edge == "on")
    if edge == "off" then
      for var=scaleNotes[0],scaleNotes[newMax] do
        myo.midi(1, "noteOff", var, 127)
      end
    end
  elseif (pose == "doubleTap") then
    myo.lock()
  end
end

function onPeriodic()
  local inputAngle = myo.getPitch() + math.pi / 2;
  local pitch = (((inputAngle - myoMinPitch) * newRange) / myoPitchRange) + newMin;
  if playing then
      myo.midi(1, "noteOn", scaleNotes[pitch], 100)
  end
end


function onForegroundWindowChange(app, title)
  return app == "com.apple.garageband10"
end

function onUnlock()
  myo.unlock("hold")
end
