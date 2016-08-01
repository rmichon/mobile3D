include <../lib/iPhone5.scad>

$fn=50;

iPhone5_CaseWithLargePassiveAmp();
translate([iPhone5_Module_WallThickness,iPhone5_Module_WallThickness,iPhone5_Module_WallThickness+iPhone5_LargePassiveAmp_HornLength+iPhone5_LargePassiveAmp_BaseThickness])iPhone5();