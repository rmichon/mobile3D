include <../lib/iPhone6.scad>

$fn=50;

iPhone6_CaseWithLargePassiveAmp();
translate([iPhone6_Module_WallThickness,iPhone6_Module_WallThickness,iPhone6_Module_WallThickness+iPhone6_LargePassiveAmp_HornLength+iPhone6_LargePassiveAmp_BaseThickness])iPhone6();