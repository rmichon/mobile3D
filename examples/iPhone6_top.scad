include <../lib/iPhone6.scad>

$fn=60;

iPhone6_CaseTop();
translate([iPhone6_Module_WallThickness,iPhone6_Module_WallThickness,iPhone6_Module_WallThickness+iPhone6_SmallPassiveAmp_HornLength+iPhone6_SmallPassiveAmp_BaseThickness])iPhone6();