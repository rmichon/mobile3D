include <../lib/iPhone5.scad>

$fn=60;

iPhone5_CaseTop();
translate([iPhone5_Module_WallThickness,iPhone5_Module_WallThickness,iPhone5_Module_WallThickness+iPhone5_SmallPassiveAmp_HornLength+iPhone5_SmallPassiveAmp_BaseThickness])iPhone5();