include <../lib/iPhone6.scad>

$fn=50;

iPhone6_CaseRock();
translate([iPhone6_Module_WallThickness,iPhone6_Module_WallThickness,iPhone6_Module_WallThickness+iPhone6_SmallPassiveAmp_HornLength+iPhone6_SmallPassiveAmp_BaseThickness])iPhone6();