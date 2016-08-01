include <../lib/iPodTouch6.scad>

$fn=50;

iPodTouch6_CaseWithSpeakerMouthPipe();
translate([iPodTouch6_Module_WallThickness,iPodTouch6_Module_WallThickness,iPodTouch6_Module_WallThickness+iPodTouch6_SpeakerMouthPipe_HornLength+iPodTouch6_SpeakerMouthPipe_BaseThickness])iPodTouch6();