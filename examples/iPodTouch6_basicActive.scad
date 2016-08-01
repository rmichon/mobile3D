include <../lib/iPodTouch6.scad>

$fn=50;

//projection()rotate([90,0,0])iPodTouch6_BasePlate(wallThickness);

iPodTouch6_CaseWithElectronics();
translate([iPodTouch6_HolderPlate_HandlesWidth+iPodTouch6_Module_WallThickness,-(iPodTouch6_Depth+iPodTouch6_Module_WallThickness),iPodTouch6_HolderPlateElec_ModuleHeight+iPodTouch6_Module_WallThickness])iPodTouch6();