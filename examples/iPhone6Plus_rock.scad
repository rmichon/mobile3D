include <../lib/iPhone6Plus.scad>

$fn=50;

iPhone6Plus_CaseRock();
translate([iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness+iPhone6Plus_SmallPassiveAmp_HornLength+iPhone6Plus_SmallPassiveAmp_BaseThickness])iPhone6Plus();