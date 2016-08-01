include <../lib/iPhone5.scad>

$fn=50;

iPhone5_CaseWithSpeakerMouthPipe();
translate([iPhone5_Module_WallThickness,iPhone5_Module_WallThickness,iPhone5_Module_WallThickness+iPhone5_SpeakerMouthPipe_HornLength+iPhone5_SpeakerMouthPipe_BaseThickness])iPhone5();