# Mobile Device Augmentation Library
This library contains a set of variables and functions to facilitate the design of mobile device augmentations towards musical instrument making. The main idea behind this concept is to place mobile devices at the heart of hybrid musical instruments that are partly physical and partly virtual. In its current state, this library focuses on passive augmentations that leverage elements already present on the device: microphone, speaker, sensors (accelerometers, gyroscope, touch screen, etc.).

TODO: more.

## Using This Library

TODO.

## Supported Devices
* iPod Touch 6 (see iPodTouch6.scad)

# Reference
## `basics.scad`
This library contains basic elements to construct mobile device augmentations.
### `roundedCube(dimension,edgeRadius)`
A cube with rounded edges on the depth axis. This function is helpful for creating simple phone shapes.
#### Where
* `dimension=[width,depth,height]`: the size of the cube
* `edgeRadius`: the radius of the rounded edges 
### `bottomHolder(deviceWidth,deviceDepth,deviceEdgeRadius,deviceHeightInHolder,wallThickness,holderEdgeRadius)`
A basic generic element to hold the bottom part of a device
#### Where
* `deviceWidth`: the width of the device to be held
* `deviceDepth`: the depth of the device to be held
* `deviceEdgeRadius`: the edge radius of the device to be held
* `deviceHeightInHolder`: the height of the part of the holder covering the device
* `wallThickness`: the holder's wall thickness
* `holderEdgeRadius`: the holder's edge radius
### `topHolder(deviceWidth,deviceDepth,deviceEdgeRadius,deviceHeightInHolder,wallThickness,lipsWidth,holderEdgeRadius)`
A basic generic element to hold the top part of a device
#### Where
* `deviceWidth`: the width of the device to be held
* `deviceDepth`: the depth of the device to be held
* `deviceEdgeRadius`: the edge radius of the device to be held
* `deviceHeightInHolder`: the height of the part of the holder covering the device
* `wallThickness`: the holder's wall thickness
* `lipsWidth`: size of the lips holding the device
* `holderEdgeRadius`: the holder's edge radius
### `rectangleCircularHorn(rectangleWidth,rectangleHeight,circleRadius,hornLength,wallThickness,hornDeformationFactor,hornDerivation,endsHeight)`
A horn with a square termination on one side and a circle termination on the other.
#### Where
* `rectangleWidth`: the width of the rectangular termination
* `rectangleHeight`: the height of the rectangular termination
* `circleRadius`: the radius of the circular termination
* `hornLength`: the length of the horn
* `wallThickness`: the thickness of the walls
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `endsHeight`: the height of the two ends
### `halfSphere(radius)`
A half sphere useful to create tops.
#### Where
* `radius`: the radius of the half sphere
### `halfCylinder(dimension=[10,10,10])`
A half cylinder with controllable height.
#### Where
* `dimension=[width,depth,height]`: the size of the half cylinder
## iPodTouch6.scad
This library provides a series of tools to design iPod Touch 6 augmentations as well as various ready-to-use elements. 
### Useful iPod Touch 6 Global Variables
Global variables control the dimensions of the different elements contained in this library. Any of them can be overriden right after the library call. This actually is the recommended way to change the dimensions of any of the elements of this library since it will make these modifications globably. Some functions have global variables that are directly associated to them. These are presented with each function. 
#### iPod Touch 6 Dimensions
These variables define the dimension of the iPod Touch 6 as well as the position of its different elements: speaker, audio jack, ligthening port, etc.
* `iPodTouch6_Width`: the width of the iPod Touch 6
* `iPodTouch6_Depth`: the depth of the iPod Touch 6
* `iPodTouch6_Height`: the height of the iPod Touch 6
* `iPodTouch6_EdgeRadius`: the radius of the vertical edges of the iPod Touch 6
* `iPodTouch6_Module_WallThickness`: the global wall thickness of the different modules
#### Colors
* `color_DarkGrey`
* `color_BlackNinjaFlex`
* `color_WhiteAcrylic`
* `color_OrangeAcrylic`
* `color_BluePLA`
### `iPodTouch6()`
A very simple iPod Touch 6 model.
### `iPodTouch6_BottomHolder(wallThickness,depth,speakerHole,audioJackHole,lighteningHole)`
A customizable element that can be used to hold an iPod Touch 6 from the bottom.
#### Where
* `wallThickness`: the thickness of the walls
* `deviceInnerHeight`: the depth of the device in the holder  
* `speakerHole`: hides the speaker hole if false
* `audioJackHole`: hides the audio jack hole if false
* `lighteningHole`: hides the lightening port hole if false
#### Associated Global Variables
* `iPodTouch6_BottomHolder_Depth`: the depth of the device in the holder
* `iPodTouch6_BottomHolder_HomeButtonHoleRadius`: the radius of the home button hole
* `iPodTouch6_BottomHolder_SpeakerHoleWidth`: the speaker hole width
* `iPodTouch6_BottomHolder_SpeakerHoleHeight`: the speaker hole height
* `iPodTouch6_BottomHolder_SpeakerHoleXOffset`: the speaker hole X position
* `iPodTouch6_BottomHolder_SpeakerHoleYOffset`: the speaker hole Y position
* `iPodTouch6_BottomHolder_AudioJackHoleWidth`: the audio jack hole width
* `iPodTouch6_BottomHolder_AudioJackHoleXOffset`: the audio jack hole X position
* `iPodTouch6_BottomHolder_LighteningHoleWidth`: the lightening hole width
* `iPodTouch6_BottomHolder_LighteningHoleHeight`: the lightening hole height
### iPodTouch6_TopHolder(wallThickness,depth) 
 An element that can be used to hold an iPod Touch 6 from the top.
#### Where
* `wallThickness`: the thcikness of the walls
* `depth`: the depth of the device in the holder 
#### Associated Global Variables
* `iPodTouch6_TopHolder_Depth`: the depth of the device in the holder
* `iPodTouch6_TopHolder_CameraHoleRadius`: the radius of the camera hole
* `iPodTouch6_TopHolder_CameraHoleXOffset`: the camera hole X position
* `iPodTouch6_TopHolder_CameraHoleYOffset`: the camera hole Y position
* `iPodTouch6_TopHolder_OnOffHoleWidth`: the on/off button width
* `iPodTouch6_TopHolder_OnOffHoleHeight`: the on/off button height
* `iPodTouch6_TopHolder_OnOffHoleXOffset`: the on/off button X position
* `iPodTouch6_TopHolder_OnOffHoleYOffset`: the on/off button Y position
### `iPodTouch6_BasePlate(wallThickness,plateThickness)`
A simple plate to put the bottom and top holder together. 
#### Where
* `deviceWidth`: the width of the device
* `deviceHeight`: the height of the device
* `wallThickness`: the wall thickness of the top and bottom holders
* `plateThickness`: the thickness of the plate 
#### Associated Global Variables
* `iPodTouch6_BasePlate_Thickness`: the thickness of the plate
### `iPodTouch6_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
A simple plate where the iPod Touch 6 can be mounted using `iPodTouch6_BottomHolder` and `iPodTouch6_TopHolder` and that adds a side handle to the device.
#### Where
* `height`: the height of the plate
* `handleWidth`: the width of the handle
* `handleHoleBorder`: the size of the border of the handle hole
* `handleHoleWidth`: the size of the handle hole
* `wallThickness`: the global wall thickness
* `plateThickness`: the thickness of the plate
* `edgeRadius`: the vertical edge radius
#### Associated Global Variables
* `iPodTouch6_PlateWithHandle_HandleWidth`: the width of the handle
* `iPodTouch6_PlateWithHandle_HandleHoleWidth`: the size of the handle hole
* `iPodTouch6_PlateWithHandle_HandleHoleBorder`: the size of the border of the handle hole
* `iPodTouch6_PlateWithHandle_Thickness`: the plate thickness
* `iPodTouch6_PlateWithHandle_EdgeRadius`: the vertical edge radius
### `iPodTouch6_HolderPlate(handleWidth,wallThickness,plateThickness)`
A simple plate where the iPod Touch 6 can be mounted using `iPodTouch6_BottomHolder` and `iPodTouch6_TopHolder` and that adds handles to the device.
#### Where
* `handleWidth`: the width of the handles around the device
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
#### Associated Global Variables
* `iPodTouch6_HolderPlate_Thickness`: the plate thickness
* `iPodTouch6_HolderPlate_HandlesWidth`: the width of the handles around the device
* `iPodTouch6_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
### `iPodTouch6_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
Similar to `iPodTouch6_HolderPlate()` except that a module has been adeed to install electronic components to it.
#### Where
* `handleWidth`: the size of the handles
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPodTouch6_HolderPlateElec_ModuleHeight`: the electronic module height 
* `iPodTouch6_HolderPlateElec_ModuleEdgeRadius`: the electronic module edge radius
* `iPodTouch6_HolderPlateElec_BoxHoleRadius`: the radius of the screw holes
### `iPodTouch6_HolderPlateElecTop(wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
A simple cover for the electronic components used with `iPodTouch6_HolderPlateElec`
#### Where
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPodTouch6_HolderPlateElecTop_Thickness`: the plate thickness
### `iPodTouch6_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A customizable horn that plugs to the built-in speaker of the iPod Touch. It comes with a base plate that is used to easily glue the horn to the bottom holder.
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
* `lighteningConnectorHole`: if true, adds a hole to the base plate for the ligthening connector
### `iPodTouch6_SmallPassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A small passive amplifier for the iPod Touch 6 that can be glued to `iPodTouch6_BottomHolder`. 
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
#### Associated Global Variables
* `iPodTouch6_SmallPassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPodTouch6_SmallPassiveAmp_HornLength`: the length of the horn
* `iPodTouch6_SmallPassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPodTouch6_SmallPassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPodTouch6_SmallPassiveAmp_BaseThickness`: the thickness of the base plate
* `iPodTouch6_SmallPassiveAmp_HornThickness`: the thickness of the walls of the horn
### `iPodTouch6_LargePassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness,reinforcementBarWidth)`
A large passive amplifier with a reinforcement bar for the iPod Touch 6 that can be glued to `iPodTouch6_BottomHolder`. 
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
* `reinforcementBarWidth`: the width of the reinforcement bar
#### Associated Global Variables
* `iPodTouch6_LargePassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPodTouch6_LargePassiveAmp_HornLength`: the length of the horn
* `iPodTouch6_LargePassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPodTouch6_LargePassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPodTouch6_LargePassiveAmp_BaseThickness`: the thickness of the base plate
* `iPodTouch6_LargePassiveAmp_HornThickness`: the thickness of the walls of the horn
* `iPodTouch6_LargePassiveAmp_ReinforcementBarWidth`: the width of the reinforcement bar
### `iPodTouch6_Case()`
A simple iPod Touch 6 case.
### `iPodTouch6_CaseWithSideHandle()`
A iPod Touch 6 case with a side handle.
### `iPodTouch6_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPodTouch6_CaseWithLargePassiveAmp()`
A case for the iPod Touch 6 with a large passive amplifier.
### `iPodTouch6_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPodTouch6_CaseWithSideHandleAndPassiveAmp()`
An iPod Touch 6 case with a side handle and a small passive amplifier.
### `iPodTouch6_CaseTop()`
A case that turn the iPod Touch 6 into a top.
### `iPodTouch6_CaseRock()`
A iPod Touch 6 case with a swing on it to rock it.
#### Where
* `swingWidth`: the width of the swing
#### Associated Global Variables
* `iPodTouch6_CaseRock_SwingWidth`: the width of the swing
### `iPodTouch6_HolderWithElectronics()`
A case for the iPod Touch 6 with handles and that can host extra electronic components.

