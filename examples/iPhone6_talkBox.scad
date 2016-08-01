include <../lib/iPhone6.scad>

$fn=50;

iPhone6_CaseWithSpeakerMouthPipe();
translate([iPhone6_Module_WallThickness,iPhone6_Module_WallThickness,iPhone6_Module_WallThickness+iPhone6_SpeakerMouthPipe_HornLength+iPhone6_SpeakerMouthPipe_BaseThickness])iPhone6();