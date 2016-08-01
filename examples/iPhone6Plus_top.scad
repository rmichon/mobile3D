include <../lib/iPhone6Plus.scad>

$fn=60;

iPhone6Plus_CaseTop();
translate([iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness+iPhone6Plus_SmallPassiveAmp_HornLength+iPhone6Plus_SmallPassiveAmp_BaseThickness])iPhone6Plus();