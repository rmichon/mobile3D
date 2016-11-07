//==================`iPhone5.scad`===================
// This library provides a series of tools to design iPhone 5 augmentations as well as various ready-to-use elements.
//===================================================

include <basics.scad>
	
//----------------Useful iPhone 5 Global Variables--------------------
// Global variables control the dimensions of the different elements contained in this library. Any of them can be overriden right after the library call. This actually is the recommended way to change the dimensions of any of the elements of this library since it will make these modifications globably. Some functions have global variables that are directly associated to them. These are presented with each function.
//
// #### iPhone 5 Dimensions
//
// These variables define the dimension of the iPhone 5 as well as the position of its different elements: speaker, audio jack, ligthening port, etc.
//
// * `iPhone5_Width`: the width of the iPhone 5
// * `iPhone5_Depth`: the depth of the iPhone 5
// * `iPhone5_Height`: the height of the iPhone 5
// * `iPhone5_EdgeRadius`: the radius of the vertical edges of the iPhone 5
// * `iPhone5_Module_WallThickness`: the global wall thickness of the different modules
//
// #### Colors
//
// * `color_DarkGrey`
// * `color_BlackNinjaFlex`
// * `color_WhiteAcrylic`
// * `color_OrangeAcrylic`
// * `color_BluePLA`
//-------------------------------------------------------------------------

iPhone5_Width = 58.6;
iPhone5_Depth = 8.4;
iPhone5_Height = 123.8;
iPhone5_EdgeRadius = 8;

iPhone5_Module_WallThickness = 2;

color_DarkGrey = [0.3,0.3,0.3];
color_BlackNinjaFlex = [0.2,0.2,0.2];
color_WhiteAcrylic = [1,1,1,];
color_OrangeAcrylic = [1,0.27,0];
color_BluePLA = [0.12,0.56,1];

//-----------`iPhone5`--------------------
// A very simple iPhone 5 model.
//---------------------------------------

module iPhone5(){
	color(color_DarkGrey)
		roundedCube([iPhone5_Width,iPhone5_Depth,iPhone5_Height],iPhone5_EdgeRadius);
}

//---------------------`iPhone5_BottomHolder`--------------------------
// A customizable element that can be used to hold an iPhone 5 from the bottom. This part is meant to be printed with an elastic material such as Ninjaflex.
//
// `iPhone5_BottomHolder(wallThickness,depth,speakerHole,audioJackHole,lighteningHole)`
//
// #### Where
//
// * `wallThickness`: the thickness of the walls
// * `deviceInnerHeight`: the depth of the device in the holder  
// * `speakerHole`: hides the speaker hole if false
// * `audioJackHole`: hides the audio jack hole if false
// * `lighteningHole`: hides the lightening port hole if false
//
// #### Associated Global Variables
//
// * `iPhone5_BottomHolder_Depth`: the depth of the device in the holder
// * `iPhone5_BottomHolder_HomeButtonHoleRadius`: the radius of the home button hole
// * `iPhone5_BottomHolder_SpeakerHoleWidth`: the speaker hole width
// * `iPhone5_BottomHolder_SpeakerHoleHeight`: the speaker hole height
// * `iPhone5_BottomHolder_SpeakerHoleXOffset`: the speaker hole X position
// * `iPhone5_BottomHolder_SpeakerHoleYOffset`: the speaker hole Y position
// * `iPhone5_BottomHolder_AudioJackHoleWidth`: the audio jack hole width
// * `iPhone5_BottomHolder_AudioJackHoleXOffset`: the audio jack hole X position
// * `iPhone5_BottomHolder_LighteningHoleWidth`: the lightening hole width
// * `iPhone5_BottomHolder_LighteningHoleHeight`: the lightening hole height
//------------------------------------------------------------------------------

iPhone5_BottomHolder_Depth = 12;
iPhone5_BottomHolder_HomeButtonHoleRadius = 6;
iPhone5_BottomHolder_SpeakerHoleWidth = 14;
iPhone5_BottomHolder_SpeakerHoleHeight = 6;
iPhone5_BottomHolder_SpeakerHoleXOffset = 7;
iPhone5_BottomHolder_SpeakerHoleYOffset = 1.5;
iPhone5_BottomHolder_AudioJackHoleWidth = 15;
iPhone5_BottomHolder_AudioJackHoleXOffset = 5.75;
iPhone5_BottomHolder_LighteningHoleWidth = 11;
iPhone5_BottomHolder_LighteningHoleHeight = iPhone5_Depth;
module iPhone5_BottomHolder(wallThickness=iPhone5_Module_WallThickness,depth=iPhone5_BottomHolder_Depth,
speakerHole=true,audioJackHole=true,lighteningHole=true){
	color(color_BlackNinjaFlex){
		difference(){
			// the base for this part (cf. basics.scad)
			bottomHolder(iPhone5_Width,iPhone5_Depth,iPhone5_EdgeRadius,
			depth,wallThickness);
			// home button hole
			union(){
				translate([(iPhone5_Width/2+wallThickness),wallThickness+0.01,
				wallThickness+2+iPhone5_BottomHolder_HomeButtonHoleRadius])
					rotate([90,0,0])
						cylinder(h=wallThickness+0.02,r=iPhone5_BottomHolder_HomeButtonHoleRadius);
				translate([(iPhone5_Width/2+wallThickness-iPhone5_BottomHolder_HomeButtonHoleRadius),
				-0.01,wallThickness+2+iPhone5_BottomHolder_HomeButtonHoleRadius])
					cube([iPhone5_BottomHolder_HomeButtonHoleRadius*2,wallThickness+0.02,
					iPhone5_BottomHolder_HomeButtonHoleRadius*2]);
			}
			// speaker hole
			if(speakerHole){
				translate([(iPhone5_Width-iPhone5_BottomHolder_SpeakerHoleXOffset-iPhone5_BottomHolder_SpeakerHoleWidth+wallThickness),
				iPhone5_BottomHolder_SpeakerHoleYOffset+wallThickness+iPhone5_BottomHolder_SpeakerHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPhone5_BottomHolder_SpeakerHoleWidth,wallThickness+1,
						iPhone5_BottomHolder_SpeakerHoleHeight]);
			}
	        // audio jack hole
			if(audioJackHole){
				translate([wallThickness+iPhone5_BottomHolder_AudioJackHoleXOffset,wallThickness,-0.01])
					cube([iPhone5_BottomHolder_AudioJackHoleWidth,iPhone5_Depth,wallThickness+1]);
			}
	        // lightening connector hole
			if(lighteningHole){
				translate([((iPhone5_Width-iPhone5_BottomHolder_LighteningHoleWidth)/2+wallThickness),
				wallThickness+iPhone5_BottomHolder_LighteningHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPhone5_BottomHolder_LighteningHoleWidth,wallThickness+1,
						iPhone5_BottomHolder_LighteningHoleHeight]);
			}
		}
	}
}

//-------------`iPhone5_TopHolder`----------------------- 
//  An element that can be used to hold an iPhone 5 from the top. This part is meant to be printed with an elastic material such as Ninjaflex.
//
// `iPhone5_TopHolder(wallThickness,depth)`
//
// #### Where
//
// * `wallThickness`: the thcikness of the walls
// * `depth`: the depth of the device in the holder 
//
// #### Associated Global Variables
//
// * `iPhone5_TopHolder_Depth`: the depth of the device in the holder
// * `iPhone5_TopHolder_OnOffHoleWidth`: the on/off button width
// * `iPhone5_TopHolder_OnOffHoleHeight`: the on/off button height
// * `iPhone5_TopHolder_OnOffHoleXOffset`: the on/off button X position
// * `iPhone5_TopHolder_OnOffHoleYOffset`: the on/off button Y position
//--------------------------------------------------------

iPhone5_TopHolder_Depth = 12;
iPhone5_TopHolder_OnOffHoleWidth = 10;
iPhone5_TopHolder_OnOffHoleHeight = 4;
iPhone5_TopHolder_OnOffHoleXOffset = 39.5;
iPhone5_TopHolder_OnOffHoleYOffset = 0.5;
module iPhone5_TopHolder(wallThickness=iPhone5_Module_WallThickness,depth=iPhone5_TopHolder_Depth){
	color(color_BlackNinjaFlex){
		difference(){
			topHolder(iPhone5_Width,iPhone5_Depth,iPhone5_EdgeRadius,depth,wallThickness);
    	    // on/off button hole
			translate([iPhone5_TopHolder_OnOffHoleXOffset+wallThickness,(iPhone5_Depth-iPhone5_TopHolder_OnOffHoleHeight)/2+
			wallThickness+iPhone5_TopHolder_OnOffHoleHeight,depth-iPhone5_TopHolder_OnOffHoleYOffset])
				rotate([90,0,0])
					roundedCube([iPhone5_TopHolder_OnOffHoleWidth,wallThickness+1,iPhone5_TopHolder_OnOffHoleHeight]);
			
		}
	}
}

//--------------------`iPhone5_BasePlate`--------------------
// A simple plate to put the bottom and top holder together. This part is meant to be laser cut from an acrylic plate. 
//
// `iPhone5_BasePlate(wallThickness,plateThickness)`
//
// #### Where
//
// * `deviceWidth`: the width of the device
// * `deviceHeight`: the height of the device
// * `wallThickness`: the wall thickness of the top and bottom holders
// * `plateThickness`: the thickness of the plate 
//
// #### Associated Global Variables
//
// * `iPhone5_BasePlate_Thickness`: the thickness of the plate
//------------------------------------------------------------

iPhone5_BasePlate_Thickness = 3.175;
module iPhone5_BasePlate(deviceWidth=iPhone5_Width,deviceHeight=iPhone5_Height,
wallThickness=iPhone5_Module_WallThickness,plateThickness=iPhone5_BasePlate_Thickness){
	color(color_OrangeAcrylic){
		cube([deviceWidth+wallThickness*2,plateThickness,deviceHeight+wallThickness*2]);
	}
}

//-----------------`iPhone5_PlateWithSideHandle`----------------------
// A simple plate where the iPhone 5 can be mounted using `iPhone5_BottomHolder` and `iPhone5_TopHolder` and that adds a side handle to the device. This part is meant to be laser cut from an acrylic plate.
//
// `iPhone5_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
//
// #### Where
//
// * `height`: the height of the plate
// * `handleWidth`: the width of the handle
// * `handleHoleBorder`: the size of the border of the handle hole
// * `handleHoleWidth`: the size of the handle hole
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the thickness of the plate
// * `edgeRadius`: the vertical edge radius
//
// #### Associated Global Variables
//
// * `iPhone5_PlateWithHandle_HandleWidth`: the width of the handle
// * `iPhone5_PlateWithHandle_HandleHoleWidth`: the size of the handle hole
// * `iPhone5_PlateWithHandle_HandleHoleBorder`: the size of the border of the handle hole
// * `iPhone5_PlateWithHandle_Thickness`: the plate thickness
// * `iPhone5_PlateWithHandle_EdgeRadius`: the vertical edge radius
//------------------------------------------------------------------

iPhone5_PlateWithHandle_HandleWidth = 72;
iPhone5_PlateWithHandle_HandleHoleWidth = 34;
iPhone5_PlateWithHandle_HandleHoleBorder = 14;
iPhone5_PlateWithHandle_Thickness = 6.35;
iPhone5_PlateWithHandle_EdgeRadius = 2;
module iPhone5_PlateWithSideHandle(height=iPhone5_Height+iPhone5_Module_WallThickness*2,
handleWidth=iPhone5_PlateWithHandle_HandleWidth,handleHoleWidth=iPhone5_PlateWithHandle_HandleHoleWidth,
wallThickness=iPhone5_Module_WallThickness,handleHoleBorder=iPhone5_PlateWithHandle_HandleHoleBorder,
plateThickness=iPhone5_PlateWithHandle_Thickness,edgeRadius=iPhone5_PlateWithHandle_EdgeRadius){
	width=iPhone5_Width+iPhone5_Module_WallThickness*2+handleWidth;
	color(color_OrangeAcrylic){
		difference(){
			roundedCube([width,plateThickness,height],edgeRadius);
			translate([width-handleHoleBorder-handleHoleWidth,-0.01,handleHoleBorder])
				roundedCube([handleHoleWidth,plateThickness+0.02,height-handleHoleBorder*2]);
		}
	}
}

//----------------`iPhone5_HolderPlate`-----------------------
// A simple plate where the iPhone 5 can be mounted using `iPhone5_BottomHolder` and `iPhone5_TopHolder` and that adds handles to the device. This part is meant to be laser cut from an acrylic plate.
//
// `iPhone5_HolderPlate(handleWidth,wallThickness,plateThickness)`
//
// #### Where
//
// * `handleWidth`: the width of the handles around the device
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
//
// #### Associated Global Variables
//
// * `iPhone5_HolderPlate_Thickness`: the plate thickness
// * `iPhone5_HolderPlate_HandlesWidth`: the width of the handles around the device
// * `iPhone5_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
//-------------------------------------------------------------

iPhone5_HolderPlate_Thickness = 6.35;
iPhone5_HolderPlate_HandlesWidth = 50;
iPhone5_HolderPlate_EdgeRadius = 10;
module iPhone5_HolderPlate(handleWidth=iPhone5_HolderPlate_HandlesWidth,wallThickness=iPhone5_Module_WallThickness,
plateThickness=iPhone5_HolderPlate_Thickness){
	color(color_WhiteAcrylic){
		roundedCube([iPhone5_Width+handleWidth*2+wallThickness*2,plateThickness,iPhone5_Height+wallThickness*2],
		iPhone5_HolderPlate_EdgeRadius);
	}
}

//--------------`iPhone5_HolderPlateElec`-------------------
// Similar to `iPhone5_HolderPlate()` except that a module has been adeed to install electronic components to it. This part is meant to be laser cut from an acrylic plate.
//
// `iPhone5_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)
//
// #### Where
//
// * `handleWidth`: the size of the handles
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// * `elecModuleHeight`: the electronic module height
// * `elecModuleEdgeRadius`: the electronic module edge radius
//
// #### Associated Global Variables
//
// * `iPhone5_HolderPlateElec_ModuleHeight`: the electronic module height 
// * `iPhone5_HolderPlateElec_ModuleEdgeRadius`: the electronic module edge radius
// * `iPhone5_HolderPlateElec_BoxHoleRadius`: the radius of the screw holes
//-----------------------------------------------------------

iPhone5_HolderPlateElec_ModuleHeight = 44;
iPhone5_HolderPlateElec_ModuleEdgeRadius = 4;
iPhone5_HolderPlateElec_BoxHoleRadius = 1.5;
module iPhone5_HolderPlateElec(handleWidth=iPhone5_HolderPlate_HandlesWidth,wallThickness=iPhone5_Module_WallThickness,
plateThickness=iPhone5_HolderPlate_Thickness,elecModuleHeight=iPhone5_HolderPlateElec_ModuleHeight,
elecModuleEdgeRadius=iPhone5_HolderPlateElec_ModuleEdgeRadius){
	color(color_WhiteAcrylic){
		translate([0,0,elecModuleHeight]){
			union(){
				iPhone5_HolderPlate(handleWidth,wallThickness,plateThickness);
				translate([iPhone5_HolderPlate_HandlesWidth,0,-elecModuleHeight])
					difference(){
						roundedCube([iPhone5_Width+wallThickness*2,iPhone5_HolderPlate_Thickness,
						elecModuleHeight+elecModuleEdgeRadius],
						elecModuleEdgeRadius);
						translate([elecModuleEdgeRadius,-0.01,elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlate_Thickness+0.02);
						translate([iPhone5_Width+wallThickness*2-elecModuleEdgeRadius,-0.01,
						elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlate_Thickness+0.02);
						translate([iPhone5_Width+wallThickness*2-elecModuleEdgeRadius,-0.01,
						elecModuleHeight-elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlate_Thickness+0.02);
						translate([elecModuleEdgeRadius,-0.01,
						elecModuleHeight-elecModuleEdgeRadius])
							rotate([270,0,0])
								cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlate_Thickness+0.02);
					}
			}
		}
	}
}

//-------------`iPhone5_HolderPlateElecTop`-------------------------
// A simple cover for the electronic components used with `iPhone5_HolderPlateElec`. This part is meant to be laser cut from an acrylic plate.
//
// `iPhone5_HolderPlateElecTop(wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
//
// #### Where
//
// * `wallThickness`: the global wall thickness
// * `plateThickness`: the plate thickness
// * `elecModuleHeight`: the electronic module height
// * `elecModuleEdgeRadius`: the electronic module edge radius
//
// #### Associated Global Variables
//
// * `iPhone5_HolderPlateElecTop_Thickness`: the plate thickness
//-----------------------------------------------------------------

iPhone5_HolderPlateElecTop_Thickness = 3.125;
module iPhone5_HolderPlateElecTop(wallThickness=iPhone5_Module_WallThickness,elecModuleHeight=iPhone5_HolderPlateElec_ModuleHeight,
elecModuleEdgeRadius=iPhone5_HolderPlateElec_ModuleEdgeRadius){
	color(color_WhiteAcrylic){
	difference(){
		roundedCube([iPhone5_Width+wallThickness*2,iPhone5_HolderPlateElecTop_Thickness,
		iPhone5_HolderPlateElec_ModuleHeight],iPhone5_HolderPlateElec_ModuleEdgeRadius);
		translate([iPhone5_HolderPlateElec_ModuleEdgeRadius,-0.01,iPhone5_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlateElecTop_Thickness+0.02);
		translate([iPhone5_Width+wallThickness*2-iPhone5_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPhone5_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlateElecTop_Thickness+0.02);
		translate([iPhone5_Width+wallThickness*2-iPhone5_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPhone5_HolderPlateElec_ModuleHeight-iPhone5_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlateElecTop_Thickness+0.02);
		translate([iPhone5_HolderPlateElec_ModuleEdgeRadius,-0.01,
		iPhone5_HolderPlateElec_ModuleHeight-iPhone5_HolderPlateElec_ModuleEdgeRadius])
			rotate([270,0,0])
				cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,h=iPhone5_HolderPlateElecTop_Thickness+0.02);
	}
	}
}

//-------------------`iPhone5_GenericHorn`-----------------------
// A customizable horn that plugs to the built-in speaker of the iPhone 5. It comes with a base plate that is used to easily glue the horn to the bottom holder. This part is meant to be printed with PLA or ABS.
//
// `iPhone5_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
//
// #### Where
//
// * `hornRadius`: the radius of the circular end of the horn
// * `hornLength`: the length of the horn
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `wallThickness`: the thickness of the walls of the different modules
// * `hornThickness`: the thickness of the walls of the horn
// * `basePlateThickness`: the thickness of the base plate
// * `lighteningConnectorHole`: if true, adds a hole to the base plate for the ligthening connector
//-----------------------------------------------------------------

module iPhone5_GenericHorn(hornRadius=iPhone5_LargePassiveAmp_HornRadius,hornLength=iPhone5_LargePassiveAmp_HornLength,
hornDeformationFactor=iPhone5_LargePassiveAmp_HornDeformationFactor,hornDerivation=iPhone5_LargePassiveAmp_HornDerivation,
wallThickness=iPhone5_Module_WallThickness,hornThickness=iPhone5_LargePassiveAmp_HornThickness,
basePlateThickness=iPhone5_LargePassiveAmp_BaseThickness,lighteningConnectorHole=true){
	color(color_BluePLA){
		translate([0,0,hornLength]){
		difference(){
			// base plate
			cube([iPhone5_Width+wallThickness*2,iPhone5_Depth+wallThickness*2,basePlateThickness]);
			// speaker hole
			translate([(iPhone5_Width-iPhone5_BottomHolder_SpeakerHoleXOffset-iPhone5_BottomHolder_SpeakerHoleWidth+wallThickness),
			iPhone5_BottomHolder_SpeakerHoleYOffset+wallThickness+iPhone5_BottomHolder_SpeakerHoleHeight,-0.01])
				rotate([90,0,0])
					roundedCube([iPhone5_BottomHolder_SpeakerHoleWidth,basePlateThickness+0.02,iPhone5_BottomHolder_SpeakerHoleHeight]);
	        // lightening connector hole
			if(lighteningConnectorHole){
				translate([((iPhone5_Width-iPhone5_BottomHolder_LighteningHoleWidth)/2+wallThickness),
				wallThickness+iPhone5_BottomHolder_LighteningHoleHeight,-0.01])
					rotate([90,0,0])
						roundedCube([iPhone5_BottomHolder_LighteningHoleWidth,basePlateThickness+0.02,iPhone5_BottomHolder_LighteningHoleHeight]);
			}
		}
		// the horn
		translate([iPhone5_Width-iPhone5_BottomHolder_SpeakerHoleXOffset-iPhone5_BottomHolder_SpeakerHoleWidth+(iPhone5_BottomHolder_SpeakerHoleWidth+wallThickness*2)/2,
		iPhone5_BottomHolder_SpeakerHoleYOffset+wallThickness*2+iPhone5_BottomHolder_SpeakerHoleHeight-(iPhone5_BottomHolder_SpeakerHoleHeight+wallThickness*2)/2,0])
			rotate([180,0,0])
				rectangleCircularHorn(iPhone5_BottomHolder_SpeakerHoleWidth,iPhone5_BottomHolder_SpeakerHoleHeight,hornRadius,hornLength,hornThickness,
				hornDeformationFactor,hornDerivation);
		}
	}
}

//-------------`iPhone5_SmallPassiveAmp`-------------------
// A small passive amplifier for the iPhone 5 that can be glued to `iPhone5_BottomHolder`. This part is meant to be printed with PLA or ABS.
//
// `iPhone5_SmallPassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
//
// #### Where
//
// * `hornRadius`: the radius of the circular end of the horn
// * `hornLength`: the length of the horn
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `wallThickness`: the thickness of the walls of the different modules
// * `hornThickness`: the thickness of the walls of the horn
// * `basePlateThickness`: the thickness of the base plate
//
// #### Associated Global Variables
//
// * `iPhone5_SmallPassiveAmp_HornRadius`: the radius of the circular end of the horn
// * `iPhone5_SmallPassiveAmp_HornLength`: the length of the horn
// * `iPhone5_SmallPassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `iPhone5_SmallPassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `iPhone5_SmallPassiveAmp_BaseThickness`: the thickness of the base plate
// * `iPhone5_SmallPassiveAmp_HornThickness`: the thickness of the walls of the horn
//-----------------------------------------------------------------

iPhone5_SmallPassiveAmp_HornRadius = 30;
iPhone5_SmallPassiveAmp_HornLength = 25;
iPhone5_SmallPassiveAmp_HornDeformationFactor = 0.5;
iPhone5_SmallPassiveAmp_HornDerivation = -15;
iPhone5_SmallPassiveAmp_BaseThickness = 2;
iPhone5_SmallPassiveAmp_HornThickness = 2;
module iPhone5_SmallPassiveAmp(hornRadius=iPhone5_SmallPassiveAmp_HornRadius,hornLength=iPhone5_SmallPassiveAmp_HornLength,
hornDeformationFactor=iPhone5_SmallPassiveAmp_HornDeformationFactor,hornDerivation=iPhone5_SmallPassiveAmp_HornDerivation,
wallThickness=iPhone5_Module_WallThickness,hornThickness=iPhone5_SmallPassiveAmp_HornThickness,
baseThickness=iPhone5_SmallPassiveAmp_BaseThickness){
	color(color_BluePLA){
		iPhone5_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
	}
}

//-----------`iPhone5_LargePassiveAmp`-------------------
// A large passive amplifier with a reinforcement bar for the iPhone 5 that can be glued to `iPhone5_BottomHolder`. This part is meant to be printed with PLA or ABS. 
//
// `iPhone5_LargePassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness,reinforcementBarWidth)`
//
// #### Where
//
// * `hornRadius`: the radius of the circular end of the horn
// * `hornLength`: the length of the horn
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `wallThickness`: the thickness of the walls of the different modules
// * `hornThickness`: the thickness of the walls of the horn
// * `basePlateThickness`: the thickness of the base plate
// * `reinforcementBarWidth`: the width of the reinforcement bar
//
// #### Associated Global Variables
//
// * `iPhone5_LargePassiveAmp_HornRadius`: the radius of the circular end of the horn
// * `iPhone5_LargePassiveAmp_HornLength`: the length of the horn
// * `iPhone5_LargePassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `iPhone5_LargePassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `iPhone5_LargePassiveAmp_BaseThickness`: the thickness of the base plate
// * `iPhone5_LargePassiveAmp_HornThickness`: the thickness of the walls of the horn
// * `iPhone5_LargePassiveAmp_ReinforcementBarWidth`: the width of the reinforcement bar
//---------------------------------------------------------

iPhone5_LargePassiveAmp_HornRadius = 40;
iPhone5_LargePassiveAmp_HornLength = 90;
iPhone5_LargePassiveAmp_HornDeformationFactor = 0.75;
iPhone5_LargePassiveAmp_HornDerivation = -15;
iPhone5_LargePassiveAmp_BaseThickness = 10;
iPhone5_LargePassiveAmp_HornThickness = 2;
iPhone5_LargePassiveAmp_ReinforcementBarWidth = 5;
module iPhone5_LargePassiveAmp(hornRadius=iPhone5_LargePassiveAmp_HornRadius,hornLength=iPhone5_LargePassiveAmp_HornLength,
hornDeformationFactor=iPhone5_LargePassiveAmp_HornDeformationFactor,hornDerivation=iPhone5_LargePassiveAmp_HornDerivation,
wallThickness=iPhone5_Module_WallThickness,hornThickness=iPhone5_LargePassiveAmp_HornThickness,
baseThickness=iPhone5_LargePassiveAmp_BaseThickness,reinforcementBarWidth=iPhone5_LargePassiveAmp_ReinforcementBarWidth){
	color(color_BluePLA){
		iPhone5_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
		// reinforcement bar
		translate([0,iPhone5_Depth+wallThickness*2,hornLength])
			rotate([180,0,0]) // TODO: the ratio for the length of the reinforcement bar should be computed
				cube([reinforcementBarWidth,iPhone5_Depth+wallThickness*2,hornLength*0.85]);
	}
}

iPhone5_SpeakerMouthPipe_HornRadius = 10;
iPhone5_SpeakerMouthPipe_HornLength = 60;
iPhone5_SpeakerMouthPipe_HornDeformationFactor = 0.75;
iPhone5_SpeakerMouthPipe_HornDerivation = 0;
iPhone5_SpeakerMouthPipe_BaseThickness = 10;
iPhone5_SpeakerMouthPipe_HornThickness = 2;
module iPhone5_SpeakerMouthPipe(hornRadius=iPhone5_SpeakerMouthPipe_HornRadius,hornLength=iPhone5_SpeakerMouthPipe_HornLength,
hornDeformationFactor=iPhone5_SpeakerMouthPipe_HornDeformationFactor,hornDerivation=iPhone5_SpeakerMouthPipe_HornDerivation,
wallThickness=iPhone5_Module_WallThickness,hornThickness=iPhone5_SpeakerMouthPipe_HornThickness,
baseThickness=iPhone5_SpeakerMouthPipe_BaseThickness){
	color(color_BluePLA){
		iPhone5_GenericHorn(hornRadius,hornLength,hornDeformationFactor,
		hornDerivation,wallThickness,hornThickness,baseThickness,false);
	}
}

//----------------`iPhone5_Case`-------------------------
// A simple iPhone 5 case.
//-------------------------------------------------------

module iPhone5_Case(){
	iPhone5_BottomHolder();
	translate([0,iPhone5_Depth+iPhone5_Module_WallThickness*2,0])iPhone5_BasePlate();
	translate([0,0,iPhone5_Height+iPhone5_Module_WallThickness-iPhone5_TopHolder_Depth])
		iPhone5_TopHolder();
};

//-------------`iPhone5_CaseWithSideHandle`------------------
// A iPhone 5 case with a side handle.
//-----------------------------------------------------------

module iPhone5_CaseWithSideHandle(){
	iPhone5_BottomHolder();
	translate([0,iPhone5_Depth+iPhone5_Module_WallThickness*2,0])iPhone5_PlateWithSideHandle();
	translate([0,0,iPhone5_Height+iPhone5_Module_WallThickness-iPhone5_TopHolder_Depth])
		iPhone5_TopHolder();
}

//------------`iPhone5_CaseWithSmallPassiveAmp`-----------------
// A case for the iPhone 5 with a small passive amplifier.
//--------------------------------------------------------------

module iPhone5_CaseWithSmallPassiveAmp(){
	iPhone5_SmallPassiveAmp();
	translate([0,0,iPhone5_SmallPassiveAmp_HornLength+iPhone5_SmallPassiveAmp_BaseThickness])
		iPhone5_BottomHolder();
	translate([0,iPhone5_Depth+iPhone5_Module_WallThickness*2,iPhone5_SmallPassiveAmp_HornLength+iPhone5_SmallPassiveAmp_BaseThickness])
		iPhone5_BasePlate(deviceHeight=iPhone5_Height);
	translate([0,0,iPhone5_Height+iPhone5_SmallPassiveAmp_BaseThickness+iPhone5_SmallPassiveAmp_HornLength
	+iPhone5_Module_WallThickness-iPhone5_TopHolder_Depth])
		iPhone5_TopHolder();
}

//-------------`iPhone5_CaseWithLargePassiveAmp`----------------
// A case for the iPhone 5 with a large passive amplifier.
//--------------------------------------------------------------

module iPhone5_CaseWithLargePassiveAmp(){
	iPhone5_LargePassiveAmp();
	translate([0,0,iPhone5_LargePassiveAmp_HornLength+iPhone5_LargePassiveAmp_BaseThickness])
		iPhone5_BottomHolder();
	translate([0,iPhone5_Depth+iPhone5_Module_WallThickness*2,iPhone5_LargePassiveAmp_HornLength])
		iPhone5_BasePlate(deviceHeight=iPhone5_LargePassiveAmp_BaseThickness+iPhone5_Height);
	translate([0,0,iPhone5_Height+iPhone5_LargePassiveAmp_BaseThickness+iPhone5_LargePassiveAmp_HornLength
	+iPhone5_Module_WallThickness-iPhone5_TopHolder_Depth])
		iPhone5_TopHolder();
}

//---------`iPhone5_CaseWithSmallPassiveAmp`------------------------
// A case for the iPhone 5 with a small passive amplifier.
//-----------------------------------------------------------------

module iPhone5_CaseWithSpeakerMouthPipe(){
	iPhone5_SpeakerMouthPipe();
	translate([0,0,iPhone5_SpeakerMouthPipe_HornLength+iPhone5_SpeakerMouthPipe_BaseThickness])
		iPhone5_BottomHolder();
	translate([0,iPhone5_Depth+iPhone5_Module_WallThickness*2,iPhone5_SpeakerMouthPipe_HornLength])
		iPhone5_BasePlate(deviceHeight=iPhone5_SpeakerMouthPipe_BaseThickness+iPhone5_Height);
	translate([0,0,iPhone5_Height+iPhone5_SpeakerMouthPipe_BaseThickness+iPhone5_SpeakerMouthPipe_HornLength
	+iPhone5_Module_WallThickness-iPhone5_TopHolder_Depth])
		iPhone5_TopHolder();
}

//-----------`iPhone5_CaseWithSideHandleAndPassiveAmp`-----------------------
// An iPhone 5 case with a side handle and a small passive amplifier.
//---------------------------------------------------------------------------

module iPhone5_CaseWithSideHandleAndPassiveAmp(){
	iPhone5_SmallPassiveAmp();
	translate([0,iPhone5_Depth+iPhone5_Module_WallThickness*2,iPhone5_SmallPassiveAmp_HornLength+iPhone5_SmallPassiveAmp_BaseThickness])
		iPhone5_PlateWithSideHandle(height=iPhone5_Height+iPhone5_Module_WallThickness*2);
	translate([0,0,iPhone5_SmallPassiveAmp_HornLength+iPhone5_SmallPassiveAmp_BaseThickness])
		iPhone5_BottomHolder();
	translate([0,0,iPhone5_Height+iPhone5_SmallPassiveAmp_BaseThickness+iPhone5_SmallPassiveAmp_HornLength
	+iPhone5_Module_WallThickness-iPhone5_TopHolder_Depth])
		iPhone5_TopHolder();
}

//-------------`iPhone5_CaseTop`----------------------------------
// A case that turn the iPhone 5 into a top.
//---------------------------------------------------------------

module iPhone5_CaseTop(){
	iPhone5_CaseWithSmallPassiveAmp();
	color(color_BluePLA){
		translate([0,iPhone5_Depth+iPhone5_Module_WallThickness*2+iPhone5_BasePlate_Thickness,
		(iPhone5_Height+iPhone5_Module_WallThickness*2+iPhone5_SmallPassiveAmp_HornLength+iPhone5_SmallPassiveAmp_BaseThickness+iPhone5_SmallPassiveAmp_BaseThickness+
		(iPhone5_Width+iPhone5_Module_WallThickness*2)/2)/2])
			rotate([-90,0,0])
				halfSphere((iPhone5_Width+iPhone5_Module_WallThickness*2)/2);
	}
}

//---------------`iPhone5_CaseRock`---------------------------
// A iPhone 5 case with a swing on it to rock it.
//
// `iPhone5_CaseRock(swingWidth)`
//
// #### Where
//
// * `swingWidth`: the width of the swing
//
// #### Associated Global Variables
//
// * `iPhone5_CaseRock_SwingWidth`: the width of the swing
//-----------------------------------------------------------

iPhone5_CaseRock_SwingWidth = 20;
module iPhone5_CaseRock(swingWidth = iPhone5_CaseRock_SwingWidth){
	iPhone5_CaseWithSmallPassiveAmp();
	color(color_BluePLA){
		translate([(iPhone5_Width+iPhone5_Module_WallThickness*2-swingWidth)/2,
		iPhone5_Depth+iPhone5_Module_WallThickness*2+iPhone5_BasePlate_Thickness,
		iPhone5_SmallPassiveAmp_HornLength])
		rotate([-90,-90,0])
		halfCylinder([iPhone5_Height+iPhone5_Module_WallThickness*2+iPhone5_SmallPassiveAmp_BaseThickness,
		swingWidth,(iPhone5_Height+iPhone5_Module_WallThickness*2+iPhone5_SmallPassiveAmp_BaseThickness)/1.5]);
	}
}

//------------`iPhone5_HolderWithElectronics`---------------------
// A case for the iPhone 5 with handles and that can host extra electronic components.
//----------------------------------------------------------------

iPhone5_HolderPlateElec_ModuleInterplateSpace = 25;
module iPhone5_CaseWithElectronics(){
	module screwElec(){
	    color([0.6,0.6,0.6]){
	        cylinder(r=iPhone5_HolderPlateElec_BoxHoleRadius,
			h=iPhone5_HolderPlate_Thickness+iPhone5_HolderPlateElec_ModuleInterplateSpace+
				iPhone5_HolderPlateElecTop_Thickness);
	    }
	}
	iPhone5_HolderPlateElec();
	translate([iPhone5_HolderPlate_HandlesWidth,-(iPhone5_Depth+iPhone5_Module_WallThickness*2),
	iPhone5_HolderPlateElec_ModuleHeight])
		iPhone5_BottomHolder();
	translate([iPhone5_HolderPlate_HandlesWidth,-(iPhone5_Depth+iPhone5_Module_WallThickness*2),
	iPhone5_HolderPlateElec_ModuleHeight+iPhone5_Height-iPhone5_TopHolder_Depth+iPhone5_Module_WallThickness])
		iPhone5_TopHolder();
	translate([iPhone5_HolderPlate_HandlesWidth,iPhone5_HolderPlate_Thickness+
		iPhone5_HolderPlateElec_ModuleInterplateSpace,0])
			iPhone5_HolderPlateElecTop();
	// screws
	rotate([270,0,0]){
	    translate([iPhone5_HolderPlate_HandlesWidth+iPhone5_HolderPlateElec_ModuleEdgeRadius,
		iPhone5_HolderPlateElec_ModuleEdgeRadius-iPhone5_HolderPlateElec_ModuleHeight,0])
			screwElec();
	    translate([iPhone5_HolderPlate_HandlesWidth+iPhone5_HolderPlateElec_ModuleEdgeRadius,
		-iPhone5_HolderPlateElec_ModuleEdgeRadius,0])
			screwElec();
	    translate([iPhone5_Width+iPhone5_Module_WallThickness*2+iPhone5_HolderPlate_HandlesWidth-
		iPhone5_HolderPlateElec_ModuleEdgeRadius,iPhone5_HolderPlateElec_ModuleHeight-
		iPhone5_HolderPlateElec_ModuleEdgeRadius-iPhone5_HolderPlateElec_ModuleHeight,0])
			screwElec();
	    translate([iPhone5_Width+iPhone5_Module_WallThickness*2+iPhone5_HolderPlate_HandlesWidth-
		iPhone5_HolderPlateElec_ModuleEdgeRadius,iPhone5_HolderPlateElec_ModuleEdgeRadius-
		iPhone5_HolderPlateElec_ModuleHeight,0])
			screwElec();
	}
}




