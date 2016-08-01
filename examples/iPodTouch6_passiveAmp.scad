include <../lib/iPodTouch6.scad>

$fn=50;

iPodTouch6_CaseWithLargePassiveAmp();
translate([iPodTouch6_Module_WallThickness,iPodTouch6_Module_WallThickness,iPodTouch6_Module_WallThickness+iPodTouch6_LargePassiveAmp_HornLength+iPodTouch6_LargePassiveAmp_BaseThickness])iPodTouch6();