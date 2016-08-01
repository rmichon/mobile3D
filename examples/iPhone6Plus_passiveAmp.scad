include <../lib/iPhone6Plus.scad>

$fn=50;

iPhone6Plus_CaseWithLargePassiveAmp();
translate([iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness,iPhone6Plus_Module_WallThickness+iPhone6Plus_LargePassiveAmp_HornLength+iPhone6Plus_LargePassiveAmp_BaseThickness])iPhone6Plus();