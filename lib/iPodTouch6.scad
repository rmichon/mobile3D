// ## iPodTouch6.scad
// This library provides a series of tools to design iPod Touch 6 augmentations as well as various ready-to-use elements. 

include <basics.scad>
	
// ### Useful iPod Touch 6 Global Variables
// Global variables control the dimensions of the different elements contained in this library. Any of them can be overriden right after the library call. This actually is the recommended way to change the dimensions of any of the elements of this library since it will make these modifications globably. Some functions have global variables that are directly associated to them. These are presented with each function. 
// #### iPod Touch 6 Dimensions
// These variables define the dimension of the iPod Touch 6 as well as the position of its different elements: speaker, audio jack, ligthening port, etc.
// * `iPodTouch6_Width`: the width of the iPod Touch 6
// * `iPodTouch6_Depth`: the depth of the iPod Touch 6
// * `iPodTouch6_Height`: the height of the iPod Touch 6
// * `iPodTouch6_EdgeRadius`: the radius of the vertical edges of the iPod Touch 6
// * `iPodTouch6_Module_WallThickness`: the global wall thickness of the different modules
// #### Colors
// * `color_DarkGrey`
// * `color_BlackNinjaFlex`
// * `color_WhiteAcrylic`
// * `color_OrangeAcrylic`
// * `color_BluePLA`
	
iPodTouch6_Width = 58.6;
iPodTouch6_Depth = 6.1;
iPodTouch6_Height = 123.4;
iPodTouch6_EdgeRadius = 8;

iPodTouch6_Module_WallThickness = 2;

color_DarkGrey = [0.3,0.3,0.3];
color_BlackNinjaFlex = [0.2,0.2,0.2];
color_WhiteAcrylic = [1,1,1,];
color_OrangeAcrylic = [1,0.27,0];
color_BluePLA = [0.12,0.56,1];

// ### `iPodTouch6()`
// A very simple iPod Touch 6 model.
module iPodTouch6(){
	color(color_DarkGrey)
		roundedCube([iPodTouch6_Width,iPodTouch6_Depth,iPodTouch6_Height],iPodTouch6_EdgeRadius);
}

// ### `iPodTouch6_BottomHolder(wallThickness,depth,speakerHole,audioJackHole,lighteningHole)`
// A customizable element that can be used to hold an iPod Touch 6 from the bottom. This part is meant to be printed with an elastic material such as Ninjaflex.
// #### Where
// * `wallThickness`: the thickness of the walls
// * `deviceInnerHeight`: the depth of the device in the holder  
// * `speakerHole`: hides the speaker hole if false
// * `audioJackHole`: hides the audio jack hole if false
// * `lighteningHole`: hides the lightening port hole if false
// #### Associated Global Variables
// * `iPodTouch6_BottomHolder_Depth`: the depth of the device in the holder
// * `iPodTouch6_BottomHolder_HomeButtonHoleRadius`: the radius of the home button hole
// * `iPodTouch6_BottomHolder_SpeakerHoleWidth`: the speaker hole width
// * `iPodTouch6_BottomHolder_SpeakerHoleHeight`: the speaker hole height
// * `iPodTouch6_BottomHolder_SpeakerHoleXOffset`: the speaker hole X position
// * `iPodTouch6_BottomHolder_SpeakerHoleYOffset`: the speaker hole Y position
// * `iPodTouch6_BottomHolder_AudioJackHoleWidth`: the audio jack hole width
// * `iPodTouch6_BottomHolder_AudioJackHoleXOffset`: the audio jack hole X position
// * `iPodTouch6_BottomHolder_LighteningHoleWidth`: the lightening hole width
// * `iPodTouch6_BottomHolder_LighteningHoleHeight`: the lightening hole height
iPodTouch6_BottomHolder_Depth = 12;
iPodTouch6_BottomHolder_HomeButtonHoleRadius = 6;
iPodTouch6_BottomHolder_SpeakerHoleWidth = 12;
iPodTouch6_BottomHolder_SpeakerHoleHeight = 4;
iPodTouch6_BottomHolder_SpeakerHoleXOffset = 6;
iPodTouch6_BottomHolder_SpeakerHoleYOffset = 1.5;
iPodTouch6_BottomHolder_AudioJackHoleWidth = 9;
iPodTouch6_BottomHolder_AudioJackHoleXOffset = 5.75;
iPodTouch6_BottomHolder_LighteningHoleWidth = 11;
iPodTouch6_BottomHolder_LighteningHoleHeight = iPodTouch6_Depth;
module iPodTouch6_BottomHolder(wallThickness=iPodTouch6_Module_WallThickness,depth=iPodTouch6_BottomHolder_Depth,
speakerHole=true,audioJackHole=true,lighteningHole=true){
	color(color_BlackNinjaFlex){
		difference(){
			// the base for this part (cf. basics.scad)
			bottomHolder(iPodTouch6_Width,iPodTouch6_Depth,iPodTouch6_EdgeRadius,
			depth,wallThickness);
			// home button hole
			union(){
				translate([(iPodTouch6_Width/2+wallThickness),wallThickness+0.01,
				wallThickness+2+iPodTouch6_BottomHolder_HomeButtonHoleRadius])
					rotate([90,0,0])
						cylinder(h=wallThickness+0.02,r=iPodTouch6_BottomHolder_HomeButtonHoleRadius);
				translate([(iPodTouch6_Width/2+wallThickness-iPodTouch6_BottomHolder_HomeButtonHoleRadius),
				0,wallThickness+2+iPodTouch6_BottomHolder_HomeButtonHoleRadius])
					cube([iPodTouch6_BottomHolder_HomeButtonHoleRadius*2,wallThickness+0.02,
					iPodTouch6_BottomHolder_HomeButtonHoleRadius*2]);
			}
			// speaker hole
			if(speakerHole){
				translate([(iPodTouch6_Width-iPodTouch6_BottomHolder_SpeakerHoleXOffset-iPodTouch6_BottomHolder_SpeakerHoleWidth+wallThickness),
				iPodTouch6_BottomHolder_SpeakerHoleYOffset+wallThickness+iPodTouch6_BottomHolder_SpeakerHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPodTouch6_BottomHolder_SpeakerHoleWidth,wallThickness+1,
						iPodTouch6_BottomHolder_SpeakerHoleHeight]);
			}
	        // audio jack hole
			if(audioJackHole){
				translate([wallThickness+iPodTouch6_BottomHolder_AudioJackHoleXOffset,wallThickness,-0.01])
					cube([iPodTouch6_BottomHolder_AudioJackHoleWidth,iPodTouch6_Depth,wallThickness+1]);
			}
	        // lightening connector hole
			if(lighteningHole){
				translate([((iPodTouch6_Width-iPodTouch6_BottomHolder_LighteningHoleWidth)/2+wallThickness),
				wallThickness+iPodTouch6_BottomHolder_LighteningHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPodTouch6_BottomHolder_LighteningHoleWidth,wallThickness+1,
						iPodTouch6_BottomHolder_LighteningHoleHeight]);
			}
		}
	}
}

// ### iPodTouch6_TopHolder(wallThickness,depth) 
//  An element that can be used to hold an iPod Touch 6 from the top. This part is meant to be printed with an elastic material such as Ninjaflex.
// #### Where
// * `wallThickness`: the thcikness of the walls
// * `depth`: the depth of the device in the holder 
// #### Associated Global Variables
// * `iPodTouch6_TopHolder_Depth`: the depth of the device in the holder
// * `iPodTouch6_TopHolder_CameraHoleRadius`: the radius of the camera hole
// * `iPodTouch6_TopHolder_CameraHoleXOffset`: the camera hole X position
// * `iPodTouch6_TopHolder_CameraHoleYOffset`: the camera hole Y position
// * `iPodTouch6_TopHolder_OnOffHoleWidth`: the on/off button width
// * `iPodTouch6_TopHolder_OnOffHoleHeight`: the on/off button height
// * `iPodTouch6_TopHolder_OnOffHoleXOffset`: the on/off button X position
// * `iPodTouch6_TopHolder_OnOffHoleYOffset`: the on/off button Y position
iPodTouch6_TopHolder_Depth = 12;
iPodTouch6_TopHolder_CameraHoleRadius = 5;
iPodTouch6_TopHolder_CameraHoleXOffset = 7;
iPodTouch6_TopHolder_CameraHoleYOffset = 2;
iPodTouch6_TopHolder_OnOffHoleWidth = 10;
iPodTouch6_TopHolder_OnOffHoleHeight = 4;
iPodTouch6_TopHolder_OnOffHoleXOffset = 39.5;
iPodTouch6_TopHolder_OnOffHoleYOffset = 0.5;
module iPodTouch6_TopHolder(wallThickness=iPodTouch6_Module_WallThickness,depth=iPodTouch6_TopHolder_Depth){
	color(color_BlackNinjaFlex){
		difference(){
			topHolder(iPodTouch6_Width,iPodTouch6_Depth,iPodTouch6_EdgeRadius,depth,wallThickness);
        	// camera hole
			translate([iPodTouch6_Width-iPodTouch6_TopHolder_CameraHoleXOffset+wallThickness,iPodTouch6_Depth+wallThickness*2+0.01,
			depth-iPodTouch6_TopHolder_CameraHoleRadius-iPodTouch6_TopHolder_CameraHoleYOffset])
				rotate([90,0,0])
					cylinder(r=iPodTouch6_TopHolder_CameraHoleRadius,wallThickness+1);
			translate([iPodTouch6_Width-iPodTouch6_TopHolder_CameraHoleXOffset+
				wallThickness-iPodTouch6_TopHolder_CameraHoleRadius,iPodTouch6_Depth+wallThickness-0.01,-depth-3])
				cube([iPodTouch6_TopHolder_CameraHoleRadius*2,wallThickness+1,iPodTouch6_TopHolder_CameraHoleRadius*4]);
	        // on/off button hole
			translate([iPodTouch6_TopHolder_OnOffHoleXOffset+wallThickness,(iPodTouch6_Depth-iPodTouch6_TopHolder_OnOffHoleHeight)/2+
			wallThickness+iPodTouch6_TopHolder_OnOffHoleHeight,depth-iPodTouch6_TopHolder_OnOffHoleYOffset])
				rotate([90,0,0])
					roundedCube([iPodTouch6_TopHolder_OnOffHoleWidth,wallThickness+1,iPodTouch6_TopHolder_OnOffHoleHeight]);
			
		}
	}
}

// ### `iPodTouch6_BasePlate(wallThickness,plateThickness)`
// A simple plate to put the bottom and top holder together. This part is meant to be laser cut from an acrylic plate. 
// #### Where
// * `deviceWidth`: the width of the device
// * `deviceHeight`: the height of the device
// * `wallThickness`: the wall thickness of the top and bottom holders
// * `plateThickness`: the thickness of the plate 
// #### Associated Global Variables
// * `iPodTouch6_BasePlate_Thickness`: the thickness of the plate
iPodTouch6_BasePlate_Thickness = 3.175;
module iPodTouch6_BasePlate(deviceWidth=iPodTouch6_Width,deviceHeight=iPodTouch6_Height,
wallThickness=iPodTouch6_Module_WallThickness,plateThickness=iPodTouch6_BasePlate_Thickness){
	color(color_OrangeAcrylic){
		cube([deviceWidth+wallThickness*2,plateThickness,deviceHeight+wallThickness*2]);
	}
}

// ### `iPodTouch6_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
// A simple plate where the iPod Touch 6 can be mounted using `iPodTouch6_BottomHolder` and `iPodTouch6_TopHolder` and that adds a side handle to the device. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `height`: the height of the plate
// * `handleWidth`: the width of the handle
// * `handleHoleBorder`: the size of the border of the handle hole
// * `handleHoleWidth`: the size of the handle hole
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the thickness of the plate
// * `edgeRadius`: the vertical edge radius
// #### Associated Global Variables
// * `iPodTouch6_PlateWithHandle_HandleWidth`: the width of the handle
// * `iPodTouch6_PlateWithHandle_HandleHoleWidth`: the size of the handle hole
// * `iPodTouch6_PlateWithHandle_HandleHoleBorder`: the size of the border of the handle hole
// * `iPodTouch6_PlateWithHandle_Thickness`: the plate thickness
// * `iPodTouch6_PlateWithHandle_EdgeRadius`: the vertical edge radius
iPodTouch6_PlateWithHandle_HandleWidth = 72;
iPodTouch6_PlateWithHandle_HandleHoleWidth = 34;
iPodTouch6_PlateWithHandle_HandleHoleBorder = 14;
iPodTouch6_PlateWithHandle_Thickness = 6.35;
iPodTouch6_PlateWithHandle_EdgeRadius = 2;
module iPodTouch6_PlateWithSideHandle(height=iPodTouch6_Height+iPodTouch6_Module_WallThickness*2,
handleWidth=iPodTouch6_PlateWithHandle_HandleWidth,handleHoleWidth=iPodTouch6_PlateWithHandle_HandleHoleWidth,
wallThickness=iPodTouch6_Module_WallThickness,handleHoleBorder=iPodTouch6_PlateWithHandle_HandleHoleBorder,
plateThickness=iPodTouch6_PlateWithHandle_Thickness,edgeRadius=iPodTouch6_PlateWithHandle_EdgeRadius){
	width=iPodTouch6_Width+iPodTouch6_Module_WallThickness*2+handleWidth;
	color(color_OrangeAcrylic){
		difference(){
			roundedCube([width,plateThickness,height],edgeRadius);
			translate([width-handleHoleBorder-handleHoleWidth,-0.01,handleHoleBorder])
				roundedCube([handleHoleWidth,plateThickness+0.02,height-handleHoleBorder*2]);
		}
	}
}

// ### `iPodTouch6_HolderPlate(handleWidth,wallThickness,plateThickness)`
// A simple plate where the iPod Touch 6 can be mounted using `iPodTouch6_BottomHolder` and `iPodTouch6_TopHolder` and that adds handles to the device. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `handleWidth`: the width of the handles around the device
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// #### Associated Global Variables
// * `iPodTouch6_HolderPlate_Thickness`: the plate thickness
// * `iPodTouch6_HolderPlate_HandlesWidth`: the width of the handles around the device
// * `iPodTouch6_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
iPodTouch6_HolderPlate_Thickness = 6.35;
iPodTouch6_HolderPlate_HandlesWidth = 50;
iPodTouch6_HolderPlate_EdgeRadius = 10;
module iPodTouch6_HolderPlate(handleWidth=iPodTouch6_HolderPlate_HandlesWidth,wallThickness=iPodTouch6_Module_WallThickness,
plateThickness=iPodTouch6_HolderPlate_Thickness){
	color(color_WhiteAcrylic){
		roundedCube([iPodTouch6_Width+handleWidth*2+wallThickness*2,plateThickness,iPodTouch6_Height+wallThickness*2],
		iPodTouch6_HolderPlate_EdgeRadius);
	}
}

// ### `iPodTouch6_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
// Similar to `iPodTouch6_HolderPlate()` except that a module has been adeed to install electronic components to it. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `handleWidth`: the size of the handles
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// * `elecModuleHeight`: the electronic module height
// * `elecModuleEdgeRadius`: the electronic module edge radius
// #### Associated Global Variables
// * `iPodTouch6_HolderPlateElec_ModuleHeight`: the electronic module height 
// * `iPodTouch6_HolderPlateElec_ModuleEdgeRadius`: the electronic module edge radius
// * `iPodTouch6_HolderPlateElec_BoxHoleRadius`: the radius of the screw holes
iPodTouch6_HolderPlateElec_ModuleHeight = 44;
iPodTouch6_HolderPlateElec_ModuleEdgeRadius = 4;
iPodTouch6_HolderPlateElec_BoxHoleRadius = 1.5;
module iPodTouch6_HolderPlateElec(handleWidth=iPodTouch6_HolderPlate_HandlesWidth,wallThickness=iPodTouch6_Module_WallThickness,
plateThickness=iPodTouch6_HolderPlate_Thickness,elecModuleHeight=iPodTouch6_HolderPlateElec_ModuleHeight,
elecModuleEdgeRadius=iPodTouch6_HolderPlateElec_ModuleEdgeRadius){
	color(color_WhiteAcrylic){
		translate([0,0,elecModuleHeight]){
			union(){
				iPodTouch6_HolderPlate(handleWidth,wallThickness,plateThickness);
				translate([iPodTouch6_HolderPlate_HandlesWidth,0,-elecModuleHeight])
					difference(){
						roundedCube([iPodTouch6_Width+wallThickness*2,iPodTouch6_HolderPlate_Thickness,
						elecModuleHeight+elecModuleEdgeRadius],
						elecModuleEdgeRadius);
						translate([elecModuleEdgeRadius,-0.01,elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlate_Thickness+0.02);
						translate([iPodTouch6_Width+wallThickness*2-elecModuleEdgeRadius,-0.01,
						elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlate_Thickness+0.02);
						translate([iPodTouch6_Width+wallThickness*2-elecModuleEdgeRadius,-0.01,
						elecModuleHeight-elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlate_Thickness+0.02);
						translate([elecModuleEdgeRadius,-0.01,
						elecModuleHeight-elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlate_Thickness+0.02);
					}
			}
		}
	}
}

// ### `iPodTouch6_HolderPlateElecTop(wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
// A simple cover for the electronic components used with `iPodTouch6_HolderPlateElec`. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// * `elecModuleHeight`: the electronic module height
// * `elecModuleEdgeRadius`: the electronic module edge radius
// #### Associated Global Variables
// * `iPodTouch6_HolderPlateElecTop_Thickness`: the plate thickness
iPodTouch6_HolderPlateElecTop_Thickness = 3.125;
module iPodTouch6_HolderPlateElecTop(wallThickness=iPodTouch6_Module_WallThickness,elecModuleHeight=iPodTouch6_HolderPlateElec_ModuleHeight,
elecModuleEdgeRadius=iPodTouch6_HolderPlateElec_ModuleEdgeRadius){
	color(color_WhiteAcrylic){
	difference(){
		roundedCube([iPodTouch6_Width+wallThickness*2,iPodTouch6_HolderPlateElecTop_Thickness,
		iPodTouch6_HolderPlateElec_ModuleHeight],iPodTouch6_HolderPlateElec_ModuleEdgeRadius);
		translate([iPodTouch6_HolderPlateElec_ModuleEdgeRadius,-0.01,iPodTouch6_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlateElecTop_Thickness+0.02);
		translate([iPodTouch6_Width+wallThickness*2-iPodTouch6_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPodTouch6_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlateElecTop_Thickness+0.02);
		translate([iPodTouch6_Width+wallThickness*2-iPodTouch6_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPodTouch6_HolderPlateElec_ModuleHeight-iPodTouch6_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlateElecTop_Thickness+0.02);
		translate([iPodTouch6_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPodTouch6_HolderPlateElec_ModuleHeight-iPodTouch6_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,h=iPodTouch6_HolderPlateElecTop_Thickness+0.02);
	}
	}
}

// ### `iPodTouch6_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
// A customizable horn that plugs to the built-in speaker of the iPod Touch. It comes with a base plate that is used to easily glue the horn to the bottom holder. This part is meant to be printed with PLA or ABS.
// #### Where
// * `hornRadius`: the radius of the circular end of the horn
// * `hornLength`: the length of the horn
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `wallThickness`: the thickness of the walls of the different modules
// * `hornThickness`: the thickness of the walls of the horn
// * `basePlateThickness`: the thickness of the base plate
// * `lighteningConnectorHole`: if true, adds a hole to the base plate for the ligthening connector
module iPodTouch6_GenericHorn(hornRadius=iPodTouch6_LargePassiveAmp_HornRadius,hornLength=iPodTouch6_LargePassiveAmp_HornLength,
hornDeformationFactor=iPodTouch6_LargePassiveAmp_HornDeformationFactor,hornDerivation=iPodTouch6_LargePassiveAmp_HornDerivation,
wallThickness=iPodTouch6_Module_WallThickness,hornThickness=iPodTouch6_LargePassiveAmp_HornThickness,
basePlateThickness=iPodTouch6_LargePassiveAmp_BaseThickness,lighteningConnectorHole=true){
	color(color_BluePLA){
		translate([0,0,hornLength]){
		difference(){
			// base plate
			cube([iPodTouch6_Width+wallThickness*2,iPodTouch6_Depth+wallThickness*2,basePlateThickness]);
			// speaker hole
			translate([(iPodTouch6_Width-iPodTouch6_BottomHolder_SpeakerHoleXOffset-iPodTouch6_BottomHolder_SpeakerHoleWidth+wallThickness),
			iPodTouch6_BottomHolder_SpeakerHoleYOffset+wallThickness+iPodTouch6_BottomHolder_SpeakerHoleHeight,-0.01])
				rotate([90,0,0])
					roundedCube([iPodTouch6_BottomHolder_SpeakerHoleWidth,basePlateThickness+0.02,iPodTouch6_BottomHolder_SpeakerHoleHeight]);
	        // lightening connector hole
			if(lighteningConnectorHole){
				translate([((iPodTouch6_Width-iPodTouch6_BottomHolder_LighteningHoleWidth)/2+wallThickness),
				wallThickness+iPodTouch6_BottomHolder_LighteningHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPodTouch6_BottomHolder_LighteningHoleWidth,basePlateThickness+0.02,iPodTouch6_BottomHolder_LighteningHoleHeight]);
			}
		}
		// the horn
		translate([iPodTouch6_Width-iPodTouch6_BottomHolder_SpeakerHoleXOffset-iPodTouch6_BottomHolder_SpeakerHoleWidth+(iPodTouch6_BottomHolder_SpeakerHoleWidth+wallThickness*2)/2,
		iPodTouch6_BottomHolder_SpeakerHoleYOffset+wallThickness*2+iPodTouch6_BottomHolder_SpeakerHoleHeight-(iPodTouch6_BottomHolder_SpeakerHoleHeight+wallThickness*2)/2,0])
			rotate([180,0,0])
				rectangleCircularHorn(iPodTouch6_BottomHolder_SpeakerHoleWidth,iPodTouch6_BottomHolder_SpeakerHoleHeight,hornRadius,hornLength,hornThickness,
				hornDeformationFactor,hornDerivation);
		}
	}
}

// ### `iPodTouch6_SmallPassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
// A small passive amplifier for the iPod Touch 6 that can be glued to `iPodTouch6_BottomHolder`. This part is meant to be printed with PLA or ABS.
// #### Where
// * `hornRadius`: the radius of the circular end of the horn
// * `hornLength`: the length of the horn
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `wallThickness`: the thickness of the walls of the different modules
// * `hornThickness`: the thickness of the walls of the horn
// * `basePlateThickness`: the thickness of the base plate
// #### Associated Global Variables
// * `iPodTouch6_SmallPassiveAmp_HornRadius`: the radius of the circular end of the horn
// * `iPodTouch6_SmallPassiveAmp_HornLength`: the length of the horn
// * `iPodTouch6_SmallPassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `iPodTouch6_SmallPassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `iPodTouch6_SmallPassiveAmp_BaseThickness`: the thickness of the base plate
// * `iPodTouch6_SmallPassiveAmp_HornThickness`: the thickness of the walls of the horn
iPodTouch6_SmallPassiveAmp_HornRadius = 30;
iPodTouch6_SmallPassiveAmp_HornLength = 25;
iPodTouch6_SmallPassiveAmp_HornDeformationFactor = 0.5;
iPodTouch6_SmallPassiveAmp_HornDerivation = -15;
iPodTouch6_SmallPassiveAmp_BaseThickness = 2;
iPodTouch6_SmallPassiveAmp_HornThickness = 2;
module iPodTouch6_SmallPassiveAmp(hornRadius=iPodTouch6_SmallPassiveAmp_HornRadius,hornLength=iPodTouch6_SmallPassiveAmp_HornLength,
hornDeformationFactor=iPodTouch6_SmallPassiveAmp_HornDeformationFactor,hornDerivation=iPodTouch6_SmallPassiveAmp_HornDerivation,
wallThickness=iPodTouch6_Module_WallThickness,hornThickness=iPodTouch6_SmallPassiveAmp_HornThickness,
baseThickness=iPodTouch6_SmallPassiveAmp_BaseThickness){
	color(color_BluePLA){
		iPodTouch6_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
	}
}

// ### `iPodTouch6_LargePassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness,reinforcementBarWidth)`
// A large passive amplifier with a reinforcement bar for the iPod Touch 6 that can be glued to `iPodTouch6_BottomHolder`. This part is meant to be printed with PLA or ABS. 
// #### Where
// * `hornRadius`: the radius of the circular end of the horn
// * `hornLength`: the length of the horn
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `wallThickness`: the thickness of the walls of the different modules
// * `hornThickness`: the thickness of the walls of the horn
// * `basePlateThickness`: the thickness of the base plate
// * `reinforcementBarWidth`: the width of the reinforcement bar
// #### Associated Global Variables
// * `iPodTouch6_LargePassiveAmp_HornRadius`: the radius of the circular end of the horn
// * `iPodTouch6_LargePassiveAmp_HornLength`: the length of the horn
// * `iPodTouch6_LargePassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `iPodTouch6_LargePassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `iPodTouch6_LargePassiveAmp_BaseThickness`: the thickness of the base plate
// * `iPodTouch6_LargePassiveAmp_HornThickness`: the thickness of the walls of the horn
// * `iPodTouch6_LargePassiveAmp_ReinforcementBarWidth`: the width of the reinforcement bar
iPodTouch6_LargePassiveAmp_HornRadius = 40;
iPodTouch6_LargePassiveAmp_HornLength = 90;
iPodTouch6_LargePassiveAmp_HornDeformationFactor = 0.75;
iPodTouch6_LargePassiveAmp_HornDerivation = -15;
iPodTouch6_LargePassiveAmp_BaseThickness = 10;
iPodTouch6_LargePassiveAmp_HornThickness = 2;
iPodTouch6_LargePassiveAmp_ReinforcementBarWidth = 5;
module iPodTouch6_LargePassiveAmp(hornRadius=iPodTouch6_LargePassiveAmp_HornRadius,hornLength=iPodTouch6_LargePassiveAmp_HornLength,
hornDeformationFactor=iPodTouch6_LargePassiveAmp_HornDeformationFactor,hornDerivation=iPodTouch6_LargePassiveAmp_HornDerivation,
wallThickness=iPodTouch6_Module_WallThickness,hornThickness=iPodTouch6_LargePassiveAmp_HornThickness,
baseThickness=iPodTouch6_LargePassiveAmp_BaseThickness,reinforcementBarWidth=iPodTouch6_LargePassiveAmp_ReinforcementBarWidth){
	color(color_BluePLA){
		iPodTouch6_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
		// reinforcement bar
		translate([0,iPodTouch6_Depth+wallThickness*2,hornLength])
			rotate([180,0,0]) // TODO: the ratio for the length of the reinforcement bar should be computed
				cube([reinforcementBarWidth,iPodTouch6_Depth+wallThickness*2,hornLength*0.85]);
	}
}

iPodTouch6_SpeakerMouthPipe_HornRadius = 10;
iPodTouch6_SpeakerMouthPipe_HornLength = 60;
iPodTouch6_SpeakerMouthPipe_HornDeformationFactor = 0.75;
iPodTouch6_SpeakerMouthPipe_HornDerivation = 0;
iPodTouch6_SpeakerMouthPipe_BaseThickness = 10;
iPodTouch6_SpeakerMouthPipe_HornThickness = 2;
module iPodTouch6_SpeakerMouthPipe(hornRadius=iPodTouch6_SpeakerMouthPipe_HornRadius,hornLength=iPodTouch6_SpeakerMouthPipe_HornLength,
hornDeformationFactor=iPodTouch6_SpeakerMouthPipe_HornDeformationFactor,hornDerivation=iPodTouch6_SpeakerMouthPipe_HornDerivation,
wallThickness=iPodTouch6_Module_WallThickness,hornThickness=iPodTouch6_SpeakerMouthPipe_HornThickness,
baseThickness=iPodTouch6_SpeakerMouthPipe_BaseThickness){
	color(color_BluePLA){
		iPodTouch6_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
	}
}

// ### `iPodTouch6_Case()`
// A simple iPod Touch 6 case.
module iPodTouch6_Case(){
	iPodTouch6_BottomHolder();
	translate([0,iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2,0])iPodTouch6_BasePlate();
	translate([0,0,iPodTouch6_Height+iPodTouch6_Module_WallThickness-iPodTouch6_TopHolder_Depth])
		iPodTouch6_TopHolder();
};

// ### `iPodTouch6_CaseWithSideHandle()`
// A iPod Touch 6 case with a side handle.
module iPodTouch6_CaseWithSideHandle(){
	iPodTouch6_BottomHolder();
	translate([0,iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2,0])iPodTouch6_PlateWithSideHandle();
	translate([0,0,iPodTouch6_Height+iPodTouch6_Module_WallThickness-iPodTouch6_TopHolder_Depth])
		iPodTouch6_TopHolder();
}

// ### `iPodTouch6_CaseWithSmallPassiveAmp()`
// A case for the iPod Touch 6 with a small passive amplifier.
module iPodTouch6_CaseWithSmallPassiveAmp(){
	iPodTouch6_SmallPassiveAmp();
	translate([0,0,iPodTouch6_SmallPassiveAmp_HornLength+iPodTouch6_SmallPassiveAmp_BaseThickness])
		iPodTouch6_BottomHolder();
	translate([0,iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2,iPodTouch6_SmallPassiveAmp_HornLength+iPodTouch6_SmallPassiveAmp_BaseThickness])
		iPodTouch6_BasePlate(deviceHeight=iPodTouch6_Height);
	translate([0,0,iPodTouch6_Height+iPodTouch6_SmallPassiveAmp_BaseThickness+iPodTouch6_SmallPassiveAmp_HornLength
	+iPodTouch6_Module_WallThickness-iPodTouch6_TopHolder_Depth])
		iPodTouch6_TopHolder();
}

// ### `iPodTouch6_CaseWithLargePassiveAmp()`
// A case for the iPod Touch 6 with a large passive amplifier.
module iPodTouch6_CaseWithLargePassiveAmp(){
	iPodTouch6_LargePassiveAmp();
	translate([0,0,iPodTouch6_LargePassiveAmp_HornLength+iPodTouch6_LargePassiveAmp_BaseThickness])
		iPodTouch6_BottomHolder();
	translate([0,iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2,iPodTouch6_LargePassiveAmp_HornLength])
		iPodTouch6_BasePlate(deviceHeight=iPodTouch6_LargePassiveAmp_BaseThickness+iPodTouch6_Height);
	translate([0,0,iPodTouch6_Height+iPodTouch6_LargePassiveAmp_BaseThickness+iPodTouch6_LargePassiveAmp_HornLength
	+iPodTouch6_Module_WallThickness-iPodTouch6_TopHolder_Depth])
		iPodTouch6_TopHolder();
}

// ### `iPodTouch6_CaseWithSmallPassiveAmp()`
// A case for the iPod Touch 6 with a small passive amplifier.
module iPodTouch6_CaseWithSpeakerMouthPipe(){
	iPodTouch6_SpeakerMouthPipe();
	translate([0,0,iPodTouch6_SpeakerMouthPipe_HornLength+iPodTouch6_SpeakerMouthPipe_BaseThickness])
		iPodTouch6_BottomHolder();
	translate([0,iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2,iPodTouch6_SpeakerMouthPipe_HornLength])
		iPodTouch6_BasePlate(deviceHeight=iPodTouch6_SpeakerMouthPipe_BaseThickness+iPodTouch6_Height);
	translate([0,0,iPodTouch6_Height+iPodTouch6_SpeakerMouthPipe_BaseThickness+iPodTouch6_SpeakerMouthPipe_HornLength
	+iPodTouch6_Module_WallThickness-iPodTouch6_TopHolder_Depth])
		iPodTouch6_TopHolder();
}

// ### `iPodTouch6_CaseWithSideHandleAndPassiveAmp()`
// An iPod Touch 6 case with a side handle and a small passive amplifier.
module iPodTouch6_CaseWithSideHandleAndPassiveAmp(){
	iPodTouch6_SmallPassiveAmp();
	translate([0,iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2,iPodTouch6_SmallPassiveAmp_HornLength+iPodTouch6_SmallPassiveAmp_BaseThickness])
		iPodTouch6_PlateWithSideHandle(height=iPodTouch6_Height+iPodTouch6_Module_WallThickness*2);
	translate([0,0,iPodTouch6_SmallPassiveAmp_HornLength+iPodTouch6_SmallPassiveAmp_BaseThickness])
		iPodTouch6_BottomHolder();
	translate([0,0,iPodTouch6_Height+iPodTouch6_SmallPassiveAmp_BaseThickness+iPodTouch6_SmallPassiveAmp_HornLength
	+iPodTouch6_Module_WallThickness-iPodTouch6_TopHolder_Depth])
		iPodTouch6_TopHolder();
}

// ### `iPodTouch6_CaseTop()`
// A case that turn the iPod Touch 6 into a top.
module iPodTouch6_CaseTop(){
	iPodTouch6_CaseWithSmallPassiveAmp();
	color(color_BluePLA){
		translate([0,iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2+iPodTouch6_BasePlate_Thickness,
		(iPodTouch6_Height+iPodTouch6_Module_WallThickness*2+iPodTouch6_SmallPassiveAmp_HornLength+iPodTouch6_SmallPassiveAmp_BaseThickness+iPodTouch6_SmallPassiveAmp_BaseThickness+
		(iPodTouch6_Width+iPodTouch6_Module_WallThickness*2)/2)/2])
			rotate([-90,0,0])
				halfSphere((iPodTouch6_Width+iPodTouch6_Module_WallThickness*2)/2);
	}
}

// ### `iPodTouch6_CaseRock()`
// A iPod Touch 6 case with a swing on it to rock it.
// #### Where
// * `swingWidth`: the width of the swing
// #### Associated Global Variables
// * `iPodTouch6_CaseRock_SwingWidth`: the width of the swing
iPodTouch6_CaseRock_SwingWidth = 20;
module iPodTouch6_CaseRock(swingWidth = iPodTouch6_CaseRock_SwingWidth){
	iPodTouch6_CaseWithSmallPassiveAmp();
	color(color_BluePLA){
		translate([(iPodTouch6_Width+iPodTouch6_Module_WallThickness*2-swingWidth)/2,
		iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2+iPodTouch6_BasePlate_Thickness,
		iPodTouch6_SmallPassiveAmp_HornLength])
		rotate([-90,-90,0])
		halfCylinder([iPodTouch6_Height+iPodTouch6_Module_WallThickness*2+iPodTouch6_SmallPassiveAmp_BaseThickness,
		swingWidth,(iPodTouch6_Height+iPodTouch6_Module_WallThickness*2+iPodTouch6_SmallPassiveAmp_BaseThickness)/1.5]);
	}
}

// ### `iPodTouch6_HolderWithElectronics()`
// A case for the iPod Touch 6 with handles and that can host extra electronic components.
iPodTouch6_HolderPlateElec_ModuleInterplateSpace = 25;
module iPodTouch6_CaseWithElectronics(){
	module screwElec(){
	    color([0.6,0.6,0.6]){
	        cylinder(r=iPodTouch6_HolderPlateElec_BoxHoleRadius,
			h=iPodTouch6_HolderPlate_Thickness+iPodTouch6_HolderPlateElec_ModuleInterplateSpace+
				iPodTouch6_HolderPlateElecTop_Thickness);
	    }
	}
	iPodTouch6_HolderPlateElec();
	translate([iPodTouch6_HolderPlate_HandlesWidth,-(iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2),
	iPodTouch6_HolderPlateElec_ModuleHeight])
		iPodTouch6_BottomHolder();
	translate([iPodTouch6_HolderPlate_HandlesWidth,-(iPodTouch6_Depth+iPodTouch6_Module_WallThickness*2),
	iPodTouch6_HolderPlateElec_ModuleHeight+iPodTouch6_Height-iPodTouch6_TopHolder_Depth+iPodTouch6_Module_WallThickness])
		iPodTouch6_TopHolder();
	translate([iPodTouch6_HolderPlate_HandlesWidth,iPodTouch6_HolderPlate_Thickness+
		iPodTouch6_HolderPlateElec_ModuleInterplateSpace,0])
			iPodTouch6_HolderPlateElecTop();
	// screws
	rotate([270,0,0]){
	    translate([iPodTouch6_HolderPlate_HandlesWidth+iPodTouch6_HolderPlateElec_ModuleEdgeRadius,
		iPodTouch6_HolderPlateElec_ModuleEdgeRadius-iPodTouch6_HolderPlateElec_ModuleHeight,0])
			screwElec();
	    translate([iPodTouch6_HolderPlate_HandlesWidth+iPodTouch6_HolderPlateElec_ModuleEdgeRadius,
		-iPodTouch6_HolderPlateElec_ModuleEdgeRadius,0])
			screwElec();
	    translate([iPodTouch6_Width+iPodTouch6_Module_WallThickness*2+iPodTouch6_HolderPlate_HandlesWidth-
		iPodTouch6_HolderPlateElec_ModuleEdgeRadius,iPodTouch6_HolderPlateElec_ModuleHeight-
		iPodTouch6_HolderPlateElec_ModuleEdgeRadius-iPodTouch6_HolderPlateElec_ModuleHeight,0])
			screwElec();
	    translate([iPodTouch6_Width+iPodTouch6_Module_WallThickness*2+iPodTouch6_HolderPlate_HandlesWidth-
		iPodTouch6_HolderPlateElec_ModuleEdgeRadius,iPodTouch6_HolderPlateElec_ModuleEdgeRadius-
		iPodTouch6_HolderPlateElec_ModuleHeight,0])
			screwElec();
	}
}




