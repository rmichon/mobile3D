include <../lib/iPodTouch6.scad>

$fn=50;

iPodTouch6_CaseWithSideHandleAndPassiveAmp();
translate([iPodTouch6_Module_WallThickness,iPodTouch6_Module_WallThickness,iPodTouch6_Module_WallThickness+iPodTouch6_SmallPassiveAmp_HornLength+iPodTouch6_SmallPassiveAmp_BaseThickness])iPodTouch6();