include <../lib/iPhone5.scad>

$fn=50;

iPhone5_CaseWithSideHandleAndPassiveAmp();
translate([iPhone5_Module_WallThickness,iPhone5_Module_WallThickness,iPhone5_Module_WallThickness+iPhone5_SmallPassiveAmp_HornLength+iPhone5_SmallPassiveAmp_BaseThickness])iPhone5();