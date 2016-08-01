include <../lib/iPhone5.scad>

$fn=50;

iPhone5_CaseWithElectronics();
translate([iPhone5_HolderPlate_HandlesWidth+iPhone5_Module_WallThickness,-(iPhone5_Depth+iPhone5_Module_WallThickness),iPhone5_HolderPlateElec_ModuleHeight+iPhone5_Module_WallThickness])iPhone5();