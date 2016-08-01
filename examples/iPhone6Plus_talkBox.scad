include <../lib/iPhone6Plus.scad>

$fn=50;

iPhone6Plus_CaseWithSpeakerMouthPipe();
translate([iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness+iPhone6Plus_SpeakerMouthPipe_HornLength+iPhone6Plus_SpeakerMouthPipe_BaseThickness])iPhone6Plus();