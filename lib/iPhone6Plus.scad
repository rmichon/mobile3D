// ## iPhone6Plus.scad
	
// ### Useful iPod Touch 6 Global Variables
// Global variables control the dimensions of the different elements contained in this library. Any of them can be overriden right after the library call. This actually is the recommended way to change the dimensions of any of the elements of this library since it will make these modifications globably. Some functions have global variables that are directly associated to them. These are presented with each function. 
// #### iPod Touch 6 Dimensions
// These variables define the dimension of the iPod Touch 6 as well as the position of its different elements: speaker, audio jack, ligthening port, etc.
// * `iPhone6Plus_Width`: the width of the iPod Touch 6
// * `iPhone6Plus_Depth`: the depth of the iPod Touch 6
// * `iPhone6Plus_Height`: the height of the iPod Touch 6
// * `iPhone6Plus_EdgeRadius`: the radius of the vertical edges of the iPod Touch 6
// * `iPhone6Plus_Module_WallThickness`: the global wall thickness of the different modules
// #### Colors
// * `color_DarkGrey`
// * `color_BlackNinjaFlex`
// * `color_WhiteAcrylic`
// * `color_OrangeAcrylic`
// * `color_BluePLA`
	// This library provides a series of tools to design iPhone6Plus augmentations as well as various ready-to-use elements. 

include <basics.scad>
iPhone6Plus_Width = 77.8;
iPhone6Plus_Depth = 7.1;
iPhone6Plus_Height = 158.1;
iPhone6Plus_EdgeRadius = 8;



iPhone6Plus_Module_WallThickness = 2;

color_DarkGrey = [0.3,0.3,0.3];
color_BlackNinjaFlex = [0.2,0.2,0.2];
color_WhiteAcrylic = [1,1,1,];
color_OrangeAcrylic = [1,0.27,0];
color_BluePLA = [0.12,0.56,1];

// ### `iPhone6Plus()`
// A very simple iPhone 6 model.
module iPhone6Plus(){
	color(color_DarkGrey)
		roundedCube([iPhone6Plus_Width,iPhone6Plus_Depth,iPhone6Plus_Height],iPhone6Plus_EdgeRadius);
}

// ### `iPhone6Plus_BottomHolder(wallThickness,depth,speakerHole,audioJackHole,lighteningHole)`
// A customizable element that can be used to hold an iPod Touch 6 from the bottom. This part is meant to be printed with an elastic material such as Ninjaflex.
// #### Where
// * `wallThickness`: the thickness of the walls
// * `deviceInnerHeight`: the depth of the device in the holder  
// * `speakerHole`: hides the speaker hole if false
// * `audioJackHole`: hides the audio jack hole if false
// * `lighteningHole`: hides the lightening port hole if false
// #### Associated Global Variables
// * `iPhone6Plus_BottomHolder_Depth`: the depth of the device in the holder
// * `iPhone6Plus_BottomHolder_HomeButtonHoleRadius`: the radius of the home button hole
// * `iPhone6Plus_BottomHolder_SpeakerHoleWidth`: the speaker hole width
// * `iPhone6Plus_BottomHolder_SpeakerHoleHeight`: the speaker hole height
// * `iPhone6Plus_BottomHolder_SpeakerHoleXOffset`: the speaker hole X position
// * `iPhone6Plus_BottomHolder_SpeakerHoleYOffset`: the speaker hole Y position
// * `iPhone6Plus_BottomHolder_AudioJackHoleWidth`: the audio jack hole width
// * `iPhone6Plus_BottomHolder_AudioJackHoleXOffset`: the audio jack hole X position
// * `iPhone6Plus_BottomHolder_LighteningHoleWidth`: the lightening hole width
// * `iPhone6Plus_BottomHolder_LighteningHoleHeight`: the lightening hole height
iPhone6Plus_BottomHolder_Depth = 12;
iPhone6Plus_BottomHolder_HomeButtonHoleRadius = 6;
iPhone6Plus_BottomHolder_SpeakerHoleWidth = 17.35;
iPhone6Plus_BottomHolder_SpeakerHoleHeight = 4;
iPhone6Plus_BottomHolder_SpeakerHoleXOffset = 6;
iPhone6Plus_BottomHolder_SpeakerHoleYOffset = 1.5;
iPhone6Plus_BottomHolder_AudioJackHoleWidth = 14;
iPhone6Plus_BottomHolder_AudioJackHoleXOffset = 7;
iPhone6Plus_BottomHolder_LighteningHoleWidth = 11;
iPhone6Plus_BottomHolder_LighteningHoleHeight = iPhone6Plus_Depth;
module iPhone6Plus_BottomHolder(wallThickness=iPhone6Plus_Module_WallThickness,depth=iPhone6Plus_BottomHolder_Depth,
speakerHole=true,audioJackHole=true,lighteningHole=true){
	color(color_BlackNinjaFlex){
		difference(){
			// the base for this part (cf. basics.scad)
			bottomHolder(iPhone6Plus_Width,iPhone6Plus_Depth,iPhone6Plus_EdgeRadius,
			depth,wallThickness);
			// home button hole
			union(){
				translate([(iPhone6Plus_Width/2+wallThickness),wallThickness+0.01,
				wallThickness+2+iPhone6Plus_BottomHolder_HomeButtonHoleRadius])
					rotate([90,0,0])
						cylinder(h=wallThickness+0.02,r=iPhone6Plus_BottomHolder_HomeButtonHoleRadius);
				translate([(iPhone6Plus_Width/2+wallThickness-iPhone6Plus_BottomHolder_HomeButtonHoleRadius),
				0,wallThickness+2+iPhone6Plus_BottomHolder_HomeButtonHoleRadius])
					cube([iPhone6Plus_BottomHolder_HomeButtonHoleRadius*2,wallThickness+0.02,
					iPhone6Plus_BottomHolder_HomeButtonHoleRadius*2]);
			}
			// speaker hole
			if(speakerHole){
				translate([(iPhone6Plus_Width-iPhone6Plus_BottomHolder_SpeakerHoleXOffset-iPhone6Plus_BottomHolder_SpeakerHoleWidth+wallThickness),
				iPhone6Plus_BottomHolder_SpeakerHoleYOffset+wallThickness+iPhone6Plus_BottomHolder_SpeakerHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPhone6Plus_BottomHolder_SpeakerHoleWidth,wallThickness+1,
						iPhone6Plus_BottomHolder_SpeakerHoleHeight]);
			}
	        // audio jack hole
			if(audioJackHole){
				translate([wallThickness+iPhone6Plus_BottomHolder_AudioJackHoleXOffset,wallThickness,-0.01])
					cube([iPhone6Plus_BottomHolder_AudioJackHoleWidth,iPhone6Plus_Depth,wallThickness+1]);
			}
	        // lightening connector hole
			if(lighteningHole){
				translate([((iPhone6Plus_Width-iPhone6Plus_BottomHolder_LighteningHoleWidth)/2+wallThickness),
				wallThickness+iPhone6Plus_BottomHolder_LighteningHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPhone6Plus_BottomHolder_LighteningHoleWidth,wallThickness+1,
						iPhone6Plus_BottomHolder_LighteningHoleHeight]);
			}
		}
	}
}

// ### iPhone6Plus_TopHolder(wallThickness,depth) 
//  An element that can be used to hold an iPod Touch 6 from the top. This part is meant to be printed with an elastic material such as Ninjaflex.
// #### Where
// * `wallThickness`: the thcikness of the walls
// * `depth`: the depth of the device in the holder 
// #### Associated Global Variables
// * `iPhone6Plus_TopHolder_Depth`: the depth of the device in the holder
// * `iPhone6Plus_TopHolder_CameraHoleRadius`: the radius of the camera hole
// * `iPhone6Plus_TopHolder_CameraHoleXOffset`: the camera hole X position
// * `iPhone6Plus_TopHolder_CameraHoleYOffset`: the camera hole Y position
// * `iPhone6Plus_TopHolder_OnOffHoleWidth`: the on/off button width
// * `iPhone6Plus_TopHolder_OnOffHoleHeight`: the on/off button height
// * `iPhone6Plus_TopHolder_OnOffHoleXOffset`: the on/off button X position
// * `iPhone6Plus_TopHolder_OnOffHoleYOffset`: the on/off button Y position
iPhone6Plus_TopHolder_Depth = 12;
iPhone6Plus_TopHolder_CameraHoleRadius = 5;
iPhone6Plus_TopHolder_CameraHoleXOffset = 7+6.52;
iPhone6Plus_TopHolder_CameraHoleYOffset = 2;
iPhone6Plus_TopHolder_OnOffHoleWidth = 10;
iPhone6Plus_TopHolder_OnOffHoleHeight = 4;
iPhone6Plus_TopHolder_OnOffHoleXOffset = 39.5;
iPhone6Plus_TopHolder_OnOffHoleYOffset = 0.5;
module iPhone6Plus_TopHolder(wallThickness=iPhone6Plus_Module_WallThickness,depth=iPhone6Plus_TopHolder_Depth){
	color(color_BlackNinjaFlex){
		difference(){
			topHolder(iPhone6Plus_Width,iPhone6Plus_Depth,iPhone6Plus_EdgeRadius,depth,wallThickness);
        	// camera hole
			translate([iPhone6Plus_Width-iPhone6Plus_TopHolder_CameraHoleXOffset+wallThickness,iPhone6Plus_Depth+wallThickness*2+0.01,
			depth-iPhone6Plus_TopHolder_CameraHoleRadius-iPhone6Plus_TopHolder_CameraHoleYOffset])
				rotate([90,0,0])
					cylinder(r=iPhone6Plus_TopHolder_CameraHoleRadius,wallThickness+1);
			translate([iPhone6Plus_Width-iPhone6Plus_TopHolder_CameraHoleXOffset+
				wallThickness-iPhone6Plus_TopHolder_CameraHoleRadius,iPhone6Plus_Depth+wallThickness-0.01,-depth-3])
				cube([iPhone6Plus_TopHolder_CameraHoleRadius*2,wallThickness+1,iPhone6Plus_TopHolder_CameraHoleRadius*4]);	
		}
	}
}

// ### `iPhone6Plus_BasePlate(wallThickness,plateThickness)`
// A simple plate to put the bottom and top holder together. This part is meant to be laser cut from an acrylic plate. 
// #### Where
// * `deviceWidth`: the width of the device
// * `deviceHeight`: the height of the device
// * `wallThickness`: the wall thickness of the top and bottom holders
// * `plateThickness`: the thickness of the plate 
// #### Associated Global Variables
// * `iPhone6Plus_BasePlate_Thickness`: the thickness of the plate
iPhone6Plus_BasePlate_Thickness = 3.175;
module iPhone6Plus_BasePlate(deviceWidth=iPhone6Plus_Width,deviceHeight=iPhone6Plus_Height,
wallThickness=iPhone6Plus_Module_WallThickness,plateThickness=iPhone6Plus_BasePlate_Thickness){
	color(color_OrangeAcrylic){
		cube([deviceWidth+wallThickness*2,plateThickness,deviceHeight+wallThickness*2]);
	}
}

// ### `iPhone6Plus_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
// A simple plate where the iPod Touch 6 can be mounted using `iPhone6Plus_BottomHolder` and `iPhone6Plus_TopHolder` and that adds a side handle to the device. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `height`: the height of the plate
// * `handleWidth`: the width of the handle
// * `handleHoleBorder`: the size of the border of the handle hole
// * `handleHoleWidth`: the size of the handle hole
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the thickness of the plate
// * `edgeRadius`: the vertical edge radius
// #### Associated Global Variables
// * `iPhone6Plus_PlateWithHandle_HandleWidth`: the width of the handle
// * `iPhone6Plus_PlateWithHandle_HandleHoleWidth`: the size of the handle hole
// * `iPhone6Plus_PlateWithHandle_HandleHoleBorder`: the size of the border of the handle hole
// * `iPhone6Plus_PlateWithHandle_Thickness`: the plate thickness
// * `iPhone6Plus_PlateWithHandle_EdgeRadius`: the vertical edge radius
iPhone6Plus_PlateWithHandle_HandleWidth = 72;
iPhone6Plus_PlateWithHandle_HandleHoleWidth = 34;
iPhone6Plus_PlateWithHandle_HandleHoleBorder = 14;
iPhone6Plus_PlateWithHandle_Thickness = 6.35;
iPhone6Plus_PlateWithHandle_EdgeRadius = 2;
module iPhone6Plus_PlateWithSideHandle(height=iPhone6Plus_Height+iPhone6Plus_Module_WallThickness*2,
handleWidth=iPhone6Plus_PlateWithHandle_HandleWidth,handleHoleWidth=iPhone6Plus_PlateWithHandle_HandleHoleWidth,
wallThickness=iPhone6Plus_Module_WallThickness,handleHoleBorder=iPhone6Plus_PlateWithHandle_HandleHoleBorder,
plateThickness=iPhone6Plus_PlateWithHandle_Thickness,edgeRadius=iPhone6Plus_PlateWithHandle_EdgeRadius){
	width=iPhone6Plus_Width+iPhone6Plus_Module_WallThickness*2+handleWidth;
	color(color_OrangeAcrylic){
		difference(){
			roundedCube([width,plateThickness,height],edgeRadius);
			translate([width-handleHoleBorder-handleHoleWidth,-0.01,handleHoleBorder])
				roundedCube([handleHoleWidth,plateThickness+0.02,height-handleHoleBorder*2]);
		}
	}
}

// ### `iPhone6Plus_HolderPlate(handleWidth,wallThickness,plateThickness)`
// A simple plate where the iPod Touch 6 can be mounted using `iPhone6Plus_BottomHolder` and `iPhone6Plus_TopHolder` and that adds handles to the device. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `handleWidth`: the width of the handles around the device
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// #### Associated Global Variables
// * `iPhone6Plus_HolderPlate_Thickness`: the plate thickness
// * `iPhone6Plus_HolderPlate_HandlesWidth`: the width of the handles around the device
// * `iPhone6Plus_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
iPhone6Plus_HolderPlate_Thickness = 6.35;
iPhone6Plus_HolderPlate_HandlesWidth = 50;
iPhone6Plus_HolderPlate_EdgeRadius = 10;
module iPhone6Plus_HolderPlate(handleWidth=iPhone6Plus_HolderPlate_HandlesWidth,wallThickness=iPhone6Plus_Module_WallThickness,
plateThickness=iPhone6Plus_HolderPlate_Thickness){
	color(color_WhiteAcrylic){
		roundedCube([iPhone6Plus_Width+handleWidth*2+wallThickness*2,plateThickness,iPhone6Plus_Height+wallThickness*2],
		iPhone6Plus_HolderPlate_EdgeRadius);
	}
}

// ### `iPhone6Plus_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
// Similar to `iPhone6Plus_HolderPlate()` except that a module has been adeed to install electronic components to it. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `handleWidth`: the size of the handles
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// * `elecModuleHeight`: the electronic module height
// * `elecModuleEdgeRadius`: the electronic module edge radius
// #### Associated Global Variables
// * `iPhone6Plus_HolderPlateElec_ModuleHeight`: the electronic module height 
// * `iPhone6Plus_HolderPlateElec_ModuleEdgeRadius`: the electronic module edge radius
// * `iPhone6Plus_HolderPlateElec_BoxHoleRadius`: the radius of the screw holes
iPhone6Plus_HolderPlateElec_ModuleHeight = 44;
iPhone6Plus_HolderPlateElec_ModuleEdgeRadius = 4;
iPhone6Plus_HolderPlateElec_BoxHoleRadius = 1.5;
module iPhone6Plus_HolderPlateElec(handleWidth=iPhone6Plus_HolderPlate_HandlesWidth,wallThickness=iPhone6Plus_Module_WallThickness,
plateThickness=iPhone6Plus_HolderPlate_Thickness,elecModuleHeight=iPhone6Plus_HolderPlateElec_ModuleHeight,
elecModuleEdgeRadius=iPhone6Plus_HolderPlateElec_ModuleEdgeRadius){
	color(color_WhiteAcrylic){
		translate([0,0,elecModuleHeight]){
			union(){
				iPhone6Plus_HolderPlate(handleWidth,wallThickness,plateThickness);
				translate([iPhone6Plus_HolderPlate_HandlesWidth,0,-elecModuleHeight])
					difference(){
						roundedCube([iPhone6Plus_Width+wallThickness*2,iPhone6Plus_HolderPlate_Thickness,
						elecModuleHeight+elecModuleEdgeRadius],
						elecModuleEdgeRadius);
						translate([elecModuleEdgeRadius,-0.01,elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlate_Thickness+0.02);
						translate([iPhone6Plus_Width+wallThickness*2-elecModuleEdgeRadius,-0.01,
						elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlate_Thickness+0.02);
						translate([iPhone6Plus_Width+wallThickness*2-elecModuleEdgeRadius,-0.01,
						elecModuleHeight-elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlate_Thickness+0.02);
						translate([elecModuleEdgeRadius,-0.01,
						elecModuleHeight-elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlate_Thickness+0.02);
					}
			}
		}
	}
}

// ### `iPhone6Plus_HolderPlateElecTop(wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
// A simple cover for the electronic components used with `iPhone6Plus_HolderPlateElec`. This part is meant to be laser cut from an acrylic plate.
// #### Where
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// * `elecModuleHeight`: the electronic module height
// * `elecModuleEdgeRadius`: the electronic module edge radius
// #### Associated Global Variables
// * `iPhone6Plus_HolderPlateElecTop_Thickness`: the plate thickness
iPhone6Plus_HolderPlateElecTop_Thickness = 3.125;
module iPhone6Plus_HolderPlateElecTop(wallThickness=iPhone6Plus_Module_WallThickness,elecModuleHeight=iPhone6Plus_HolderPlateElec_ModuleHeight,
elecModuleEdgeRadius=iPhone6Plus_HolderPlateElec_ModuleEdgeRadius){
	color(color_WhiteAcrylic){
	difference(){
		roundedCube([iPhone6Plus_Width+wallThickness*2,iPhone6Plus_HolderPlateElecTop_Thickness,
		iPhone6Plus_HolderPlateElec_ModuleHeight],iPhone6Plus_HolderPlateElec_ModuleEdgeRadius);
		translate([iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,-0.01,iPhone6Plus_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlateElecTop_Thickness+0.02);
		translate([iPhone6Plus_Width+wallThickness*2-iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPhone6Plus_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlateElecTop_Thickness+0.02);
		translate([iPhone6Plus_Width+wallThickness*2-iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPhone6Plus_HolderPlateElec_ModuleHeight-iPhone6Plus_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlateElecTop_Thickness+0.02);
		translate([iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPhone6Plus_HolderPlateElec_ModuleHeight-iPhone6Plus_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,h=iPhone6Plus_HolderPlateElecTop_Thickness+0.02);
	}
	}
}

// ### `iPhone6Plus_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
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
module iPhone6Plus_GenericHorn(hornRadius=iPhone6Plus_LargePassiveAmp_HornRadius,hornLength=iPhone6Plus_LargePassiveAmp_HornLength,
hornDeformationFactor=iPhone6Plus_LargePassiveAmp_HornDeformationFactor,hornDerivation=iPhone6Plus_LargePassiveAmp_HornDerivation,
wallThickness=iPhone6Plus_Module_WallThickness,hornThickness=iPhone6Plus_LargePassiveAmp_HornThickness,
basePlateThickness=iPhone6Plus_LargePassiveAmp_BaseThickness,lighteningConnectorHole=true){
	color(color_BluePLA){
		translate([0,0,hornLength]){
		difference(){
			// base plate
			cube([iPhone6Plus_Width+wallThickness*2,iPhone6Plus_Depth+wallThickness*2,basePlateThickness]);
			// speaker hole
			translate([(iPhone6Plus_Width-iPhone6Plus_BottomHolder_SpeakerHoleXOffset-iPhone6Plus_BottomHolder_SpeakerHoleWidth+wallThickness),
			iPhone6Plus_BottomHolder_SpeakerHoleYOffset+wallThickness+iPhone6Plus_BottomHolder_SpeakerHoleHeight,-0.01])
				rotate([90,0,0])
					roundedCube([iPhone6Plus_BottomHolder_SpeakerHoleWidth,basePlateThickness+0.02,iPhone6Plus_BottomHolder_SpeakerHoleHeight]);
	        // lightening connector hole
			if(lighteningConnectorHole){
				translate([((iPhone6Plus_Width-iPhone6Plus_BottomHolder_LighteningHoleWidth)/2+wallThickness),
				wallThickness+iPhone6Plus_BottomHolder_LighteningHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPhone6Plus_BottomHolder_LighteningHoleWidth,basePlateThickness+0.02,iPhone6Plus_BottomHolder_LighteningHoleHeight]);
			}
		}
		// the horn
		translate([iPhone6Plus_Width-iPhone6Plus_BottomHolder_SpeakerHoleXOffset-iPhone6Plus_BottomHolder_SpeakerHoleWidth+(iPhone6Plus_BottomHolder_SpeakerHoleWidth+wallThickness*2)/2,
		iPhone6Plus_BottomHolder_SpeakerHoleYOffset+wallThickness*2+iPhone6Plus_BottomHolder_SpeakerHoleHeight-(iPhone6Plus_BottomHolder_SpeakerHoleHeight+wallThickness*2)/2,0])
			rotate([180,0,0])
				rectangleCircularHorn(iPhone6Plus_BottomHolder_SpeakerHoleWidth,iPhone6Plus_BottomHolder_SpeakerHoleHeight,hornRadius,hornLength,hornThickness,
				hornDeformationFactor,hornDerivation);
		}
	}
}

// ### `iPhone6Plus_SmallPassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
// A small passive amplifier for the iPod Touch 6 that can be glued to `iPhone6Plus_BottomHolder`. This part is meant to be printed with PLA or ABS.
// #### Where
// * `hornRadius`: the radius of the circular end of the horn
// * `hornLength`: the length of the horn
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `wallThickness`: the thickness of the walls of the different modules
// * `hornThickness`: the thickness of the walls of the horn
// * `basePlateThickness`: the thickness of the base plate
// #### Associated Global Variables
// * `iPhone6Plus_SmallPassiveAmp_HornRadius`: the radius of the circular end of the horn
// * `iPhone6Plus_SmallPassiveAmp_HornLength`: the length of the horn
// * `iPhone6Plus_SmallPassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `iPhone6Plus_SmallPassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `iPhone6Plus_SmallPassiveAmp_BaseThickness`: the thickness of the base plate
// * `iPhone6Plus_SmallPassiveAmp_HornThickness`: the thickness of the walls of the horn
iPhone6Plus_SmallPassiveAmp_HornRadius = 30;
iPhone6Plus_SmallPassiveAmp_HornLength = 25;
iPhone6Plus_SmallPassiveAmp_HornDeformationFactor = 0.5;
iPhone6Plus_SmallPassiveAmp_HornDerivation = -15;
iPhone6Plus_SmallPassiveAmp_BaseThickness = 2;
iPhone6Plus_SmallPassiveAmp_HornThickness = 2;
module iPhone6Plus_SmallPassiveAmp(hornRadius=iPhone6Plus_SmallPassiveAmp_HornRadius,hornLength=iPhone6Plus_SmallPassiveAmp_HornLength,
hornDeformationFactor=iPhone6Plus_SmallPassiveAmp_HornDeformationFactor,hornDerivation=iPhone6Plus_SmallPassiveAmp_HornDerivation,
wallThickness=iPhone6Plus_Module_WallThickness,hornThickness=iPhone6Plus_SmallPassiveAmp_HornThickness,
baseThickness=iPhone6Plus_SmallPassiveAmp_BaseThickness){
	color(color_BluePLA){
		iPhone6Plus_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
	}
}

// ### `iPhone6Plus_LargePassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness,reinforcementBarWidth)`
// A large passive amplifier with a reinforcement bar for the iPod Touch 6 that can be glued to `iPhone6Plus_BottomHolder`. This part is meant to be printed with PLA or ABS. 
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
// * `iPhone6Plus_LargePassiveAmp_HornRadius`: the radius of the circular end of the horn
// * `iPhone6Plus_LargePassiveAmp_HornLength`: the length of the horn
// * `iPhone6Plus_LargePassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `iPhone6Plus_LargePassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `iPhone6Plus_LargePassiveAmp_BaseThickness`: the thickness of the base plate
// * `iPhone6Plus_LargePassiveAmp_HornThickness`: the thickness of the walls of the horn
// * `iPhone6Plus_LargePassiveAmp_ReinforcementBarWidth`: the width of the reinforcement bar
iPhone6Plus_LargePassiveAmp_HornRadius = 40;
iPhone6Plus_LargePassiveAmp_HornLength = 90;
iPhone6Plus_LargePassiveAmp_HornDeformationFactor = 0.75;
iPhone6Plus_LargePassiveAmp_HornDerivation = -15;
iPhone6Plus_LargePassiveAmp_BaseThickness = 10;
iPhone6Plus_LargePassiveAmp_HornThickness = 2;
iPhone6Plus_LargePassiveAmp_ReinforcementBarWidth = 5;
module iPhone6Plus_LargePassiveAmp(hornRadius=iPhone6Plus_LargePassiveAmp_HornRadius,hornLength=iPhone6Plus_LargePassiveAmp_HornLength,
hornDeformationFactor=iPhone6Plus_LargePassiveAmp_HornDeformationFactor,hornDerivation=iPhone6Plus_LargePassiveAmp_HornDerivation,
wallThickness=iPhone6Plus_Module_WallThickness,hornThickness=iPhone6Plus_LargePassiveAmp_HornThickness,
baseThickness=iPhone6Plus_LargePassiveAmp_BaseThickness,reinforcementBarWidth=iPhone6Plus_LargePassiveAmp_ReinforcementBarWidth){
	color(color_BluePLA){
		iPhone6Plus_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
		// reinforcement bar
		translate([10,iPhone6Plus_Depth+wallThickness*2,hornLength])
			rotate([180,0,0]) // TODO: the ratio for the length of the reinforcement bar should be computed
				cube([reinforcementBarWidth,iPhone6Plus_Depth+wallThickness*2,hornLength*1]);
	}
}

iPhone6Plus_SpeakerMouthPipe_HornRadius = 10;
iPhone6Plus_SpeakerMouthPipe_HornLength = 60;
iPhone6Plus_SpeakerMouthPipe_HornDeformationFactor = 0.75;
iPhone6Plus_SpeakerMouthPipe_HornDerivation = 0;
iPhone6Plus_SpeakerMouthPipe_BaseThickness = 10;
iPhone6Plus_SpeakerMouthPipe_HornThickness = 2;
module iPhone6Plus_SpeakerMouthPipe(hornRadius=iPhone6Plus_SpeakerMouthPipe_HornRadius,hornLength=iPhone6Plus_SpeakerMouthPipe_HornLength,
hornDeformationFactor=iPhone6Plus_SpeakerMouthPipe_HornDeformationFactor,hornDerivation=iPhone6Plus_SpeakerMouthPipe_HornDerivation,
wallThickness=iPhone6Plus_Module_WallThickness,hornThickness=iPhone6Plus_SpeakerMouthPipe_HornThickness,
baseThickness=iPhone6Plus_SpeakerMouthPipe_BaseThickness){
	color(color_BluePLA){
		iPhone6Plus_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
	}
}

// ### `iPhone6Plus_Case()`
// A simple iPod Touch 6 case.
module iPhone6Plus_Case(){
	iPhone6Plus_BottomHolder();
	translate([0,iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2,0])iPhone6Plus_BasePlate();
	translate([0,0,iPhone6Plus_Height+iPhone6Plus_Module_WallThickness-iPhone6Plus_TopHolder_Depth])
		iPhone6Plus_TopHolder();
};

// ### `iPhone6Plus_CaseWithSideHandle()`
// A iPod Touch 6 case with a side handle.
module iPhone6Plus_CaseWithSideHandle(){
	iPhone6Plus_BottomHolder();
	translate([0,iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2,0])iPhone6Plus_PlateWithSideHandle();
	translate([0,0,iPhone6Plus_Height+iPhone6Plus_Module_WallThickness-iPhone6Plus_TopHolder_Depth])
		iPhone6Plus_TopHolder();
}

// ### `iPhone6Plus_CaseWithSmallPassiveAmp()`
// A case for the iPod Touch 6 with a small passive amplifier.
module iPhone6Plus_CaseWithSmallPassiveAmp(){
	iPhone6Plus_SmallPassiveAmp();
	translate([0,0,iPhone6Plus_SmallPassiveAmp_HornLength+iPhone6Plus_SmallPassiveAmp_BaseThickness])
		iPhone6Plus_BottomHolder();
	translate([0,iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2,iPhone6Plus_SmallPassiveAmp_HornLength+iPhone6Plus_SmallPassiveAmp_BaseThickness])
		iPhone6Plus_BasePlate(deviceHeight=iPhone6Plus_Height);
	translate([0,0,iPhone6Plus_Height+iPhone6Plus_SmallPassiveAmp_BaseThickness+iPhone6Plus_SmallPassiveAmp_HornLength
	+iPhone6Plus_Module_WallThickness-iPhone6Plus_TopHolder_Depth])
		iPhone6Plus_TopHolder();
}

// ### `iPhone6Plus_CaseWithLargePassiveAmp()`
// A case for the iPod Touch 6 with a large passive amplifier.
module iPhone6Plus_CaseWithLargePassiveAmp(){
	iPhone6Plus_LargePassiveAmp();
	translate([0,0,iPhone6Plus_LargePassiveAmp_HornLength+iPhone6Plus_LargePassiveAmp_BaseThickness])
		iPhone6Plus_BottomHolder();
	translate([0,iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2,iPhone6Plus_LargePassiveAmp_HornLength])
		iPhone6Plus_BasePlate(deviceHeight=iPhone6Plus_LargePassiveAmp_BaseThickness+iPhone6Plus_Height);
	translate([0,0,iPhone6Plus_Height+iPhone6Plus_LargePassiveAmp_BaseThickness+iPhone6Plus_LargePassiveAmp_HornLength
	+iPhone6Plus_Module_WallThickness-iPhone6Plus_TopHolder_Depth])
		iPhone6Plus_TopHolder();
}

// ### `iPhone6Plus_CaseWithSmallPassiveAmp()`
// A case for the iPod Touch 6 with a small passive amplifier.
module iPhone6Plus_CaseWithSpeakerMouthPipe(){
	iPhone6Plus_SpeakerMouthPipe();
	translate([0,0,iPhone6Plus_SpeakerMouthPipe_HornLength+iPhone6Plus_SpeakerMouthPipe_BaseThickness])
		iPhone6Plus_BottomHolder();
	translate([0,iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2,iPhone6Plus_SpeakerMouthPipe_HornLength])
		iPhone6Plus_BasePlate(deviceHeight=iPhone6Plus_SpeakerMouthPipe_BaseThickness+iPhone6Plus_Height);
	translate([0,0,iPhone6Plus_Height+iPhone6Plus_SpeakerMouthPipe_BaseThickness+iPhone6Plus_SpeakerMouthPipe_HornLength
	+iPhone6Plus_Module_WallThickness-iPhone6Plus_TopHolder_Depth])
		iPhone6Plus_TopHolder();
}

// ### `iPhone6Plus_CaseWithSideHandleAndPassiveAmp()`
// An iPod Touch 6 case with a side handle and a small passive amplifier.
module iPhone6Plus_CaseWithSideHandleAndPassiveAmp(){
	iPhone6Plus_SmallPassiveAmp();
	translate([0,iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2,iPhone6Plus_SmallPassiveAmp_HornLength+iPhone6Plus_SmallPassiveAmp_BaseThickness])
		iPhone6Plus_PlateWithSideHandle(height=iPhone6Plus_Height+iPhone6Plus_Module_WallThickness*2);
	translate([0,0,iPhone6Plus_SmallPassiveAmp_HornLength+iPhone6Plus_SmallPassiveAmp_BaseThickness])
		iPhone6Plus_BottomHolder();
	translate([0,0,iPhone6Plus_Height+iPhone6Plus_SmallPassiveAmp_BaseThickness+iPhone6Plus_SmallPassiveAmp_HornLength
	+iPhone6Plus_Module_WallThickness-iPhone6Plus_TopHolder_Depth])
		iPhone6Plus_TopHolder();
}

// ### `iPhone6Plus_CaseTop()`
// A case that turn the iPod Touch 6 into a top.
module iPhone6Plus_CaseTop(){
	iPhone6Plus_CaseWithSmallPassiveAmp();
	color(color_BluePLA){
		translate([0,iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2+iPhone6Plus_BasePlate_Thickness,
		(iPhone6Plus_Height+iPhone6Plus_Module_WallThickness*2+iPhone6Plus_SmallPassiveAmp_HornLength+iPhone6Plus_SmallPassiveAmp_BaseThickness+iPhone6Plus_SmallPassiveAmp_BaseThickness+
		(iPhone6Plus_Width+iPhone6Plus_Module_WallThickness*2)/2)/2])
			rotate([-90,0,0])
				halfSphere((iPhone6Plus_Width+iPhone6Plus_Module_WallThickness*2)/2);
	}
}

// ### `iPhone6Plus_CaseRock()`
// A iPod Touch 6 case with a swing on it to rock it.
// #### Where
// * `swingWidth`: the width of the swing
// #### Associated Global Variables
// * `iPhone6Plus_CaseRock_SwingWidth`: the width of the swing
iPhone6Plus_CaseRock_SwingWidth = 20;
module iPhone6Plus_CaseRock(swingWidth = iPhone6Plus_CaseRock_SwingWidth){
	iPhone6Plus_CaseWithSmallPassiveAmp();
	color(color_BluePLA){
		translate([(iPhone6Plus_Width+iPhone6Plus_Module_WallThickness*2-swingWidth)/2,
		iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2+iPhone6Plus_BasePlate_Thickness,
		iPhone6Plus_SmallPassiveAmp_HornLength])
		rotate([-90,-90,0])
		halfCylinder([iPhone6Plus_Height+iPhone6Plus_Module_WallThickness*2+iPhone6Plus_SmallPassiveAmp_BaseThickness,
		swingWidth,(iPhone6Plus_Height+iPhone6Plus_Module_WallThickness*2+iPhone6Plus_SmallPassiveAmp_BaseThickness)/1.5]);
	}
}

// ### `iPhone6Plus_HolderWithElectronics()`
// A case for the iPod Touch 6 with handles and that can host extra electronic components.
iPhone6Plus_HolderPlateElec_ModuleInterplateSpace = 25;
module iPhone6Plus_CaseWithElectronics(){
	module screwElec(){
	    color([0.6,0.6,0.6]){
	        cylinder(r=iPhone6Plus_HolderPlateElec_BoxHoleRadius,
			h=iPhone6Plus_HolderPlate_Thickness+iPhone6Plus_HolderPlateElec_ModuleInterplateSpace+
				iPhone6Plus_HolderPlateElecTop_Thickness);
	    }
	}
	iPhone6Plus_HolderPlateElec();
	translate([iPhone6Plus_HolderPlate_HandlesWidth,-(iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2),
	iPhone6Plus_HolderPlateElec_ModuleHeight])
		iPhone6Plus_BottomHolder();
	translate([iPhone6Plus_HolderPlate_HandlesWidth,-(iPhone6Plus_Depth+iPhone6Plus_Module_WallThickness*2),
	iPhone6Plus_HolderPlateElec_ModuleHeight+iPhone6Plus_Height-iPhone6Plus_TopHolder_Depth+iPhone6Plus_Module_WallThickness])
		iPhone6Plus_TopHolder();
	translate([iPhone6Plus_HolderPlate_HandlesWidth,iPhone6Plus_HolderPlate_Thickness+
		iPhone6Plus_HolderPlateElec_ModuleInterplateSpace,0])
			iPhone6Plus_HolderPlateElecTop();
	// screws
	rotate([270,0,0]){
	    translate([iPhone6Plus_HolderPlate_HandlesWidth+iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,
		iPhone6Plus_HolderPlateElec_ModuleEdgeRadius-iPhone6Plus_HolderPlateElec_ModuleHeight,0])
			screwElec();
	    translate([iPhone6Plus_HolderPlate_HandlesWidth+iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,
		-iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,0])
			screwElec();
	    translate([iPhone6Plus_Width+iPhone6Plus_Module_WallThickness*2+iPhone6Plus_HolderPlate_HandlesWidth-
		iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,iPhone6Plus_HolderPlateElec_ModuleHeight-
		iPhone6Plus_HolderPlateElec_ModuleEdgeRadius-iPhone6Plus_HolderPlateElec_ModuleHeight,0])
			screwElec();
	    translate([iPhone6Plus_Width+iPhone6Plus_Module_WallThickness*2+iPhone6Plus_HolderPlate_HandlesWidth-
		iPhone6Plus_HolderPlateElec_ModuleEdgeRadius,iPhone6Plus_HolderPlateElec_ModuleEdgeRadius-
		iPhone6Plus_HolderPlateElec_ModuleHeight,0])
			screwElec();
	}
}




