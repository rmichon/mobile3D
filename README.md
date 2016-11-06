# Mobile Device Augmentation Library

This library contains a set of variables and functions to facilitate the design of mobile device augmentations towards musical instrument making. The main idea behind this concept is to place mobile devices at the heart of hybrid musical instruments that are partly physical and partly virtual. In its current state, this library focuses on passive augmentations that leverage elements already present on the device: microphone, speaker, sensors (accelerometers, gyroscope, touch screen, etc.).

This documentation was generated using the `generateDocumentation` script contained in this repository.

## Supported Devices

* iPhone 5 (see `iPhone5.scad`)
* iPod Touch 6 (see `iPodTouch6.scad`)
* iPhone 6 (see `iPhone6.scad`)
* iPhone 6 Plus (see `iPhone6Plus.scad`)

## Examples

The `/examples` folder contains a series of examples demonstrating how to use this library.

Check out the [CCRMA composed instrument summer workshop website](https://ccrma.stanford.edu/~rmichon/composedInstrumentWorkshop/) for some concrete use examples of `mobile3D`.

## API Reference
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
## iPhone5.scad
This library provides a series of tools to design iPod Touch 6 augmentations as well as various ready-to-use elements. 
### Useful iPod Touch 6 Global Variables
Global variables control the dimensions of the different elements contained in this library. Any of them can be overriden right after the library call. This actually is the recommended way to change the dimensions of any of the elements of this library since it will make these modifications globably. Some functions have global variables that are directly associated to them. These are presented with each function. 
#### iPod Touch 6 Dimensions
These variables define the dimension of the iPod Touch 6 as well as the position of its different elements: speaker, audio jack, ligthening port, etc.
* `iPhone5_Width`: the width of the iPod Touch 6
* `iPhone5_Depth`: the depth of the iPod Touch 6
* `iPhone5_Height`: the height of the iPod Touch 6
* `iPhone5_EdgeRadius`: the radius of the vertical edges of the iPod Touch 6
* `iPhone5_Module_WallThickness`: the global wall thickness of the different modules
#### Colors
* `color_DarkGrey`
* `color_BlackNinjaFlex`
* `color_WhiteAcrylic`
* `color_OrangeAcrylic`
* `color_BluePLA`
### `iPhone5()`
A very simple iPod Touch 6 model.
### `iPhone5_BottomHolder(wallThickness,depth,speakerHole,audioJackHole,lighteningHole)`
A customizable element that can be used to hold an iPod Touch 6 from the bottom. This part is meant to be printed with an elastic material such as Ninjaflex.
#### Where
* `wallThickness`: the thickness of the walls
* `deviceInnerHeight`: the depth of the device in the holder  
* `speakerHole`: hides the speaker hole if false
* `audioJackHole`: hides the audio jack hole if false
* `lighteningHole`: hides the lightening port hole if false
#### Associated Global Variables
* `iPhone5_BottomHolder_Depth`: the depth of the device in the holder
* `iPhone5_BottomHolder_HomeButtonHoleRadius`: the radius of the home button hole
* `iPhone5_BottomHolder_SpeakerHoleWidth`: the speaker hole width
* `iPhone5_BottomHolder_SpeakerHoleHeight`: the speaker hole height
* `iPhone5_BottomHolder_SpeakerHoleXOffset`: the speaker hole X position
* `iPhone5_BottomHolder_SpeakerHoleYOffset`: the speaker hole Y position
* `iPhone5_BottomHolder_AudioJackHoleWidth`: the audio jack hole width
* `iPhone5_BottomHolder_AudioJackHoleXOffset`: the audio jack hole X position
* `iPhone5_BottomHolder_LighteningHoleWidth`: the lightening hole width
* `iPhone5_BottomHolder_LighteningHoleHeight`: the lightening hole height
### iPhone5_TopHolder(wallThickness,depth) 
 An element that can be used to hold an iPod Touch 6 from the top. This part is meant to be printed with an elastic material such as Ninjaflex.
#### Where
* `wallThickness`: the thcikness of the walls
* `depth`: the depth of the device in the holder 
#### Associated Global Variables
* `iPhone5_TopHolder_Depth`: the depth of the device in the holder
* `iPhone5_TopHolder_OnOffHoleWidth`: the on/off button width
* `iPhone5_TopHolder_OnOffHoleHeight`: the on/off button height
* `iPhone5_TopHolder_OnOffHoleXOffset`: the on/off button X position
* `iPhone5_TopHolder_OnOffHoleYOffset`: the on/off button Y position
### `iPhone5_BasePlate(wallThickness,plateThickness)`
A simple plate to put the bottom and top holder together. This part is meant to be laser cut from an acrylic plate. 
#### Where
* `deviceWidth`: the width of the device
* `deviceHeight`: the height of the device
* `wallThickness`: the wall thickness of the top and bottom holders
* `plateThickness`: the thickness of the plate 
#### Associated Global Variables
* `iPhone5_BasePlate_Thickness`: the thickness of the plate
### `iPhone5_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
A simple plate where the iPod Touch 6 can be mounted using `iPhone5_BottomHolder` and `iPhone5_TopHolder` and that adds a side handle to the device. This part is meant to be laser cut from an acrylic plate.
#### Where
* `height`: the height of the plate
* `handleWidth`: the width of the handle
* `handleHoleBorder`: the size of the border of the handle hole
* `handleHoleWidth`: the size of the handle hole
* `wallThickness`: the global wall thickness
* `plateThickness`: the thickness of the plate
* `edgeRadius`: the vertical edge radius
#### Associated Global Variables
* `iPhone5_PlateWithHandle_HandleWidth`: the width of the handle
* `iPhone5_PlateWithHandle_HandleHoleWidth`: the size of the handle hole
* `iPhone5_PlateWithHandle_HandleHoleBorder`: the size of the border of the handle hole
* `iPhone5_PlateWithHandle_Thickness`: the plate thickness
* `iPhone5_PlateWithHandle_EdgeRadius`: the vertical edge radius
### `iPhone5_HolderPlate(handleWidth,wallThickness,plateThickness)`
A simple plate where the iPod Touch 6 can be mounted using `iPhone5_BottomHolder` and `iPhone5_TopHolder` and that adds handles to the device. This part is meant to be laser cut from an acrylic plate.
#### Where
* `handleWidth`: the width of the handles around the device
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
#### Associated Global Variables
* `iPhone5_HolderPlate_Thickness`: the plate thickness
* `iPhone5_HolderPlate_HandlesWidth`: the width of the handles around the device
* `iPhone5_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
### `iPhone5_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
Similar to `iPhone5_HolderPlate()` except that a module has been adeed to install electronic components to it. This part is meant to be laser cut from an acrylic plate.
#### Where
* `handleWidth`: the size of the handles
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPhone5_HolderPlateElec_ModuleHeight`: the electronic module height 
* `iPhone5_HolderPlateElec_ModuleEdgeRadius`: the electronic module edge radius
* `iPhone5_HolderPlateElec_BoxHoleRadius`: the radius of the screw holes
### `iPhone5_HolderPlateElecTop(wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
A simple cover for the electronic components used with `iPhone5_HolderPlateElec`. This part is meant to be laser cut from an acrylic plate.
#### Where
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPhone5_HolderPlateElecTop_Thickness`: the plate thickness
### `iPhone5_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A customizable horn that plugs to the built-in speaker of the iPod Touch. It comes with a base plate that is used to easily glue the horn to the bottom holder. This part is meant to be printed with PLA or ABS.
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
* `lighteningConnectorHole`: if true, adds a hole to the base plate for the ligthening connector
### `iPhone5_SmallPassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A small passive amplifier for the iPod Touch 6 that can be glued to `iPhone5_BottomHolder`. This part is meant to be printed with PLA or ABS.
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
#### Associated Global Variables
* `iPhone5_SmallPassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPhone5_SmallPassiveAmp_HornLength`: the length of the horn
* `iPhone5_SmallPassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPhone5_SmallPassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPhone5_SmallPassiveAmp_BaseThickness`: the thickness of the base plate
* `iPhone5_SmallPassiveAmp_HornThickness`: the thickness of the walls of the horn
### `iPhone5_LargePassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness,reinforcementBarWidth)`
A large passive amplifier with a reinforcement bar for the iPod Touch 6 that can be glued to `iPhone5_BottomHolder`. This part is meant to be printed with PLA or ABS. 
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
* `iPhone5_LargePassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPhone5_LargePassiveAmp_HornLength`: the length of the horn
* `iPhone5_LargePassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPhone5_LargePassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPhone5_LargePassiveAmp_BaseThickness`: the thickness of the base plate
* `iPhone5_LargePassiveAmp_HornThickness`: the thickness of the walls of the horn
* `iPhone5_LargePassiveAmp_ReinforcementBarWidth`: the width of the reinforcement bar
### `iPhone5_Case()`
A simple iPod Touch 6 case.
### `iPhone5_CaseWithSideHandle()`
A iPod Touch 6 case with a side handle.
### `iPhone5_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPhone5_CaseWithLargePassiveAmp()`
A case for the iPod Touch 6 with a large passive amplifier.
### `iPhone5_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPhone5_CaseWithSideHandleAndPassiveAmp()`
An iPod Touch 6 case with a side handle and a small passive amplifier.
### `iPhone5_CaseTop()`
A case that turn the iPod Touch 6 into a top.
### `iPhone5_CaseRock()`
A iPod Touch 6 case with a swing on it to rock it.
#### Where
* `swingWidth`: the width of the swing
#### Associated Global Variables
* `iPhone5_CaseRock_SwingWidth`: the width of the swing
### `iPhone5_HolderWithElectronics()`
A case for the iPod Touch 6 with handles and that can host extra electronic components.
## iPhone6Plus.scad
### Useful iPod Touch 6 Global Variables
Global variables control the dimensions of the different elements contained in this library. Any of them can be overriden right after the library call. This actually is the recommended way to change the dimensions of any of the elements of this library since it will make these modifications globably. Some functions have global variables that are directly associated to them. These are presented with each function. 
#### iPod Touch 6 Dimensions
These variables define the dimension of the iPod Touch 6 as well as the position of its different elements: speaker, audio jack, ligthening port, etc.
* `iPhone6Plus_Width`: the width of the iPod Touch 6
* `iPhone6Plus_Depth`: the depth of the iPod Touch 6
* `iPhone6Plus_Height`: the height of the iPod Touch 6
* `iPhone6Plus_EdgeRadius`: the radius of the vertical edges of the iPod Touch 6
* `iPhone6Plus_Module_WallThickness`: the global wall thickness of the different modules
#### Colors
* `color_DarkGrey`
* `color_BlackNinjaFlex`
* `color_WhiteAcrylic`
* `color_OrangeAcrylic`
* `color_BluePLA`
### `iPhone6Plus()`
A very simple iPhone 6 model.
### `iPhone6Plus_BottomHolder(wallThickness,depth,speakerHole,audioJackHole,lighteningHole)`
A customizable element that can be used to hold an iPod Touch 6 from the bottom. This part is meant to be printed with an elastic material such as Ninjaflex.
#### Where
* `wallThickness`: the thickness of the walls
* `deviceInnerHeight`: the depth of the device in the holder  
* `speakerHole`: hides the speaker hole if false
* `audioJackHole`: hides the audio jack hole if false
* `lighteningHole`: hides the lightening port hole if false
#### Associated Global Variables
* `iPhone6Plus_BottomHolder_Depth`: the depth of the device in the holder
* `iPhone6Plus_BottomHolder_HomeButtonHoleRadius`: the radius of the home button hole
* `iPhone6Plus_BottomHolder_SpeakerHoleWidth`: the speaker hole width
* `iPhone6Plus_BottomHolder_SpeakerHoleHeight`: the speaker hole height
* `iPhone6Plus_BottomHolder_SpeakerHoleXOffset`: the speaker hole X position
* `iPhone6Plus_BottomHolder_SpeakerHoleYOffset`: the speaker hole Y position
* `iPhone6Plus_BottomHolder_AudioJackHoleWidth`: the audio jack hole width
* `iPhone6Plus_BottomHolder_AudioJackHoleXOffset`: the audio jack hole X position
* `iPhone6Plus_BottomHolder_LighteningHoleWidth`: the lightening hole width
* `iPhone6Plus_BottomHolder_LighteningHoleHeight`: the lightening hole height
### iPhone6Plus_TopHolder(wallThickness,depth) 
 An element that can be used to hold an iPod Touch 6 from the top. This part is meant to be printed with an elastic material such as Ninjaflex.
#### Where
* `wallThickness`: the thcikness of the walls
* `depth`: the depth of the device in the holder 
#### Associated Global Variables
* `iPhone6Plus_TopHolder_Depth`: the depth of the device in the holder
* `iPhone6Plus_TopHolder_CameraHoleRadius`: the radius of the camera hole
* `iPhone6Plus_TopHolder_CameraHoleXOffset`: the camera hole X position
* `iPhone6Plus_TopHolder_CameraHoleYOffset`: the camera hole Y position
* `iPhone6Plus_TopHolder_OnOffHoleWidth`: the on/off button width
* `iPhone6Plus_TopHolder_OnOffHoleHeight`: the on/off button height
* `iPhone6Plus_TopHolder_OnOffHoleXOffset`: the on/off button X position
* `iPhone6Plus_TopHolder_OnOffHoleYOffset`: the on/off button Y position
### `iPhone6Plus_BasePlate(wallThickness,plateThickness)`
A simple plate to put the bottom and top holder together. This part is meant to be laser cut from an acrylic plate. 
#### Where
* `deviceWidth`: the width of the device
* `deviceHeight`: the height of the device
* `wallThickness`: the wall thickness of the top and bottom holders
* `plateThickness`: the thickness of the plate 
#### Associated Global Variables
* `iPhone6Plus_BasePlate_Thickness`: the thickness of the plate
### `iPhone6Plus_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
A simple plate where the iPod Touch 6 can be mounted using `iPhone6Plus_BottomHolder` and `iPhone6Plus_TopHolder` and that adds a side handle to the device. This part is meant to be laser cut from an acrylic plate.
#### Where
* `height`: the height of the plate
* `handleWidth`: the width of the handle
* `handleHoleBorder`: the size of the border of the handle hole
* `handleHoleWidth`: the size of the handle hole
* `wallThickness`: the global wall thickness
* `plateThickness`: the thickness of the plate
* `edgeRadius`: the vertical edge radius
#### Associated Global Variables
* `iPhone6Plus_PlateWithHandle_HandleWidth`: the width of the handle
* `iPhone6Plus_PlateWithHandle_HandleHoleWidth`: the size of the handle hole
* `iPhone6Plus_PlateWithHandle_HandleHoleBorder`: the size of the border of the handle hole
* `iPhone6Plus_PlateWithHandle_Thickness`: the plate thickness
* `iPhone6Plus_PlateWithHandle_EdgeRadius`: the vertical edge radius
### `iPhone6Plus_HolderPlate(handleWidth,wallThickness,plateThickness)`
A simple plate where the iPod Touch 6 can be mounted using `iPhone6Plus_BottomHolder` and `iPhone6Plus_TopHolder` and that adds handles to the device. This part is meant to be laser cut from an acrylic plate.
#### Where
* `handleWidth`: the width of the handles around the device
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
#### Associated Global Variables
* `iPhone6Plus_HolderPlate_Thickness`: the plate thickness
* `iPhone6Plus_HolderPlate_HandlesWidth`: the width of the handles around the device
* `iPhone6Plus_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
### `iPhone6Plus_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
Similar to `iPhone6Plus_HolderPlate()` except that a module has been adeed to install electronic components to it. This part is meant to be laser cut from an acrylic plate.
#### Where
* `handleWidth`: the size of the handles
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPhone6Plus_HolderPlateElec_ModuleHeight`: the electronic module height 
* `iPhone6Plus_HolderPlateElec_ModuleEdgeRadius`: the electronic module edge radius
* `iPhone6Plus_HolderPlateElec_BoxHoleRadius`: the radius of the screw holes
### `iPhone6Plus_HolderPlateElecTop(wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
A simple cover for the electronic components used with `iPhone6Plus_HolderPlateElec`. This part is meant to be laser cut from an acrylic plate.
#### Where
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPhone6Plus_HolderPlateElecTop_Thickness`: the plate thickness
### `iPhone6Plus_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A customizable horn that plugs to the built-in speaker of the iPod Touch. It comes with a base plate that is used to easily glue the horn to the bottom holder. This part is meant to be printed with PLA or ABS.
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
* `lighteningConnectorHole`: if true, adds a hole to the base plate for the ligthening connector
### `iPhone6Plus_SmallPassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A small passive amplifier for the iPod Touch 6 that can be glued to `iPhone6Plus_BottomHolder`. This part is meant to be printed with PLA or ABS.
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
#### Associated Global Variables
* `iPhone6Plus_SmallPassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPhone6Plus_SmallPassiveAmp_HornLength`: the length of the horn
* `iPhone6Plus_SmallPassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPhone6Plus_SmallPassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPhone6Plus_SmallPassiveAmp_BaseThickness`: the thickness of the base plate
* `iPhone6Plus_SmallPassiveAmp_HornThickness`: the thickness of the walls of the horn
### `iPhone6Plus_LargePassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness,reinforcementBarWidth)`
A large passive amplifier with a reinforcement bar for the iPod Touch 6 that can be glued to `iPhone6Plus_BottomHolder`. This part is meant to be printed with PLA or ABS. 
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
* `iPhone6Plus_LargePassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPhone6Plus_LargePassiveAmp_HornLength`: the length of the horn
* `iPhone6Plus_LargePassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPhone6Plus_LargePassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPhone6Plus_LargePassiveAmp_BaseThickness`: the thickness of the base plate
* `iPhone6Plus_LargePassiveAmp_HornThickness`: the thickness of the walls of the horn
* `iPhone6Plus_LargePassiveAmp_ReinforcementBarWidth`: the width of the reinforcement bar
### `iPhone6Plus_Case()`
A simple iPod Touch 6 case.
### `iPhone6Plus_CaseWithSideHandle()`
A iPod Touch 6 case with a side handle.
### `iPhone6Plus_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPhone6Plus_CaseWithLargePassiveAmp()`
A case for the iPod Touch 6 with a large passive amplifier.
### `iPhone6Plus_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPhone6Plus_CaseWithSideHandleAndPassiveAmp()`
An iPod Touch 6 case with a side handle and a small passive amplifier.
### `iPhone6Plus_CaseTop()`
A case that turn the iPod Touch 6 into a top.
### `iPhone6Plus_CaseRock()`
A iPod Touch 6 case with a swing on it to rock it.
#### Where
* `swingWidth`: the width of the swing
#### Associated Global Variables
* `iPhone6Plus_CaseRock_SwingWidth`: the width of the swing
### `iPhone6Plus_HolderWithElectronics()`
A case for the iPod Touch 6 with handles and that can host extra electronic components.
## iPhone6.scad
This library provides a series of tools to design iPod Touch 6 augmentations as well as various ready-to-use elements. 
### Useful iPod Touch 6 Global Variables
Global variables control the dimensions of the different elements contained in this library. Any of them can be overriden right after the library call. This actually is the recommended way to change the dimensions of any of the elements of this library since it will make these modifications globably. Some functions have global variables that are directly associated to them. These are presented with each function. 
#### iPod Touch 6 Dimensions
These variables define the dimension of the iPod Touch 6 as well as the position of its different elements: speaker, audio jack, ligthening port, etc.
* `iPhone6_Width`: the width of the iPod Touch 6
* `iPhone6_Depth`: the depth of the iPod Touch 6
* `iPhone6_Height`: the height of the iPod Touch 6
* `iPhone6_EdgeRadius`: the radius of the vertical edges of the iPod Touch 6
* `iPhone6_Module_WallThickness`: the global wall thickness of the different modules
#### Colors
* `color_DarkGrey`
* `color_BlackNinjaFlex`
* `color_WhiteAcrylic`
* `color_OrangeAcrylic`
* `color_BluePLA`
### `iPhone6()`
A very simple iPod Touch 6 model.
### `iPhone6_BottomHolder(wallThickness,depth,speakerHole,audioJackHole,lighteningHole)`
A customizable element that can be used to hold an iPod Touch 6 from the bottom. This part is meant to be printed with an elastic material such as Ninjaflex.
#### Where
* `wallThickness`: the thickness of the walls
* `deviceInnerHeight`: the depth of the device in the holder  
* `speakerHole`: hides the speaker hole if false
* `audioJackHole`: hides the audio jack hole if false
* `lighteningHole`: hides the lightening port hole if false
#### Associated Global Variables
* `iPhone6_BottomHolder_Depth`: the depth of the device in the holder
* `iPhone6_BottomHolder_HomeButtonHoleRadius`: the radius of the home button hole
* `iPhone6_BottomHolder_SpeakerHoleWidth`: the speaker hole width
* `iPhone6_BottomHolder_SpeakerHoleHeight`: the speaker hole height
* `iPhone6_BottomHolder_SpeakerHoleXOffset`: the speaker hole X position
* `iPhone6_BottomHolder_SpeakerHoleYOffset`: the speaker hole Y position
* `iPhone6_BottomHolder_AudioJackHoleWidth`: the audio jack hole width
* `iPhone6_BottomHolder_AudioJackHoleXOffset`: the audio jack hole X position
* `iPhone6_BottomHolder_LighteningHoleWidth`: the lightening hole width
* `iPhone6_BottomHolder_LighteningHoleHeight`: the lightening hole height
### iPhone6_TopHolder(wallThickness,depth) 
 An element that can be used to hold an iPod Touch 6 from the top. This part is meant to be printed with an elastic material such as Ninjaflex.
#### Where
* `wallThickness`: the thcikness of the walls
* `depth`: the depth of the device in the holder 
#### Associated Global Variables
* `iPhone6_TopHolder_Depth`: the depth of the device in the holder
* `iPhone6_TopHolder_CameraHoleRadius`: the radius of the camera hole
* `iPhone6_TopHolder_CameraHoleXOffset`: the camera hole X position
* `iPhone6_TopHolder_CameraHoleYOffset`: the camera hole Y position
* `iPhone6_TopHolder_OnOffHoleWidth`: the on/off button width
* `iPhone6_TopHolder_OnOffHoleHeight`: the on/off button height
* `iPhone6_TopHolder_OnOffHoleXOffset`: the on/off button X position
* `iPhone6_TopHolder_OnOffHoleYOffset`: the on/off button Y position
### `iPhone6_BasePlate(wallThickness,plateThickness)`
A simple plate to put the bottom and top holder together. This part is meant to be laser cut from an acrylic plate. 
#### Where
* `deviceWidth`: the width of the device
* `deviceHeight`: the height of the device
* `wallThickness`: the wall thickness of the top and bottom holders
* `plateThickness`: the thickness of the plate 
#### Associated Global Variables
* `iPhone6_BasePlate_Thickness`: the thickness of the plate
### `iPhone6_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
A simple plate where the iPod Touch 6 can be mounted using `iPhone6_BottomHolder` and `iPhone6_TopHolder` and that adds a side handle to the device. This part is meant to be laser cut from an acrylic plate.
#### Where
* `height`: the height of the plate
* `handleWidth`: the width of the handle
* `handleHoleBorder`: the size of the border of the handle hole
* `handleHoleWidth`: the size of the handle hole
* `wallThickness`: the global wall thickness
* `plateThickness`: the thickness of the plate
* `edgeRadius`: the vertical edge radius
#### Associated Global Variables
* `iPhone6_PlateWithHandle_HandleWidth`: the width of the handle
* `iPhone6_PlateWithHandle_HandleHoleWidth`: the size of the handle hole
* `iPhone6_PlateWithHandle_HandleHoleBorder`: the size of the border of the handle hole
* `iPhone6_PlateWithHandle_Thickness`: the plate thickness
* `iPhone6_PlateWithHandle_EdgeRadius`: the vertical edge radius
### `iPhone6_HolderPlate(handleWidth,wallThickness,plateThickness)`
A simple plate where the iPod Touch 6 can be mounted using `iPhone6_BottomHolder` and `iPhone6_TopHolder` and that adds handles to the device. This part is meant to be laser cut from an acrylic plate.
#### Where
* `handleWidth`: the width of the handles around the device
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
#### Associated Global Variables
* `iPhone6_HolderPlate_Thickness`: the plate thickness
* `iPhone6_HolderPlate_HandlesWidth`: the width of the handles around the device
* `iPhone6_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
### `iPhone6_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
Similar to `iPhone6_HolderPlate()` except that a module has been adeed to install electronic components to it. This part is meant to be laser cut from an acrylic plate.
#### Where
* `handleWidth`: the size of the handles
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPhone6_HolderPlateElec_ModuleHeight`: the electronic module height 
* `iPhone6_HolderPlateElec_ModuleEdgeRadius`: the electronic module edge radius
* `iPhone6_HolderPlateElec_BoxHoleRadius`: the radius of the screw holes
### `iPhone6_HolderPlateElecTop(wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
A simple cover for the electronic components used with `iPhone6_HolderPlateElec`. This part is meant to be laser cut from an acrylic plate.
#### Where
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPhone6_HolderPlateElecTop_Thickness`: the plate thickness
### `iPhone6_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A customizable horn that plugs to the built-in speaker of the iPod Touch. It comes with a base plate that is used to easily glue the horn to the bottom holder. This part is meant to be printed with PLA or ABS.
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
* `lighteningConnectorHole`: if true, adds a hole to the base plate for the ligthening connector
### `iPhone6_SmallPassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A small passive amplifier for the iPod Touch 6 that can be glued to `iPhone6_BottomHolder`. This part is meant to be printed with PLA or ABS.
#### Where
* `hornRadius`: the radius of the circular end of the horn
* `hornLength`: the length of the horn
* `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `wallThickness`: the thickness of the walls of the different modules
* `hornThickness`: the thickness of the walls of the horn
* `basePlateThickness`: the thickness of the base plate
#### Associated Global Variables
* `iPhone6_SmallPassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPhone6_SmallPassiveAmp_HornLength`: the length of the horn
* `iPhone6_SmallPassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPhone6_SmallPassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPhone6_SmallPassiveAmp_BaseThickness`: the thickness of the base plate
* `iPhone6_SmallPassiveAmp_HornThickness`: the thickness of the walls of the horn
### `iPhone6_LargePassiveAmp(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness,reinforcementBarWidth)`
A large passive amplifier with a reinforcement bar for the iPod Touch 6 that can be glued to `iPhone6_BottomHolder`. This part is meant to be printed with PLA or ABS. 
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
* `iPhone6_LargePassiveAmp_HornRadius`: the radius of the circular end of the horn
* `iPhone6_LargePassiveAmp_HornLength`: the length of the horn
* `iPhone6_LargePassiveAmp_HornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
* `iPhone6_LargePassiveAmp_HornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
* `iPhone6_LargePassiveAmp_BaseThickness`: the thickness of the base plate
* `iPhone6_LargePassiveAmp_HornThickness`: the thickness of the walls of the horn
* `iPhone6_LargePassiveAmp_ReinforcementBarWidth`: the width of the reinforcement bar
### `iPhone6_Case()`
A simple iPod Touch 6 case.
### `iPhone6_CaseWithSideHandle()`
A iPod Touch 6 case with a side handle.
### `iPhone6_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPhone6_CaseWithLargePassiveAmp()`
A case for the iPod Touch 6 with a large passive amplifier.
### `iPhone6_CaseWithSmallPassiveAmp()`
A case for the iPod Touch 6 with a small passive amplifier.
### `iPhone6_CaseWithSideHandleAndPassiveAmp()`
An iPod Touch 6 case with a side handle and a small passive amplifier.
### `iPhone6_CaseTop()`
A case that turn the iPod Touch 6 into a top.
### `iPhone6_CaseRock()`
A iPod Touch 6 case with a swing on it to rock it.
#### Where
* `swingWidth`: the width of the swing
#### Associated Global Variables
* `iPhone6_CaseRock_SwingWidth`: the width of the swing
### `iPhone6_HolderWithElectronics()`
A case for the iPod Touch 6 with handles and that can host extra electronic components.
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
A customizable element that can be used to hold an iPod Touch 6 from the bottom. This part is meant to be printed with an elastic material such as Ninjaflex.
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
 An element that can be used to hold an iPod Touch 6 from the top. This part is meant to be printed with an elastic material such as Ninjaflex.
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
A simple plate to put the bottom and top holder together. This part is meant to be laser cut from an acrylic plate. 
#### Where
* `deviceWidth`: the width of the device
* `deviceHeight`: the height of the device
* `wallThickness`: the wall thickness of the top and bottom holders
* `plateThickness`: the thickness of the plate 
#### Associated Global Variables
* `iPodTouch6_BasePlate_Thickness`: the thickness of the plate
### `iPodTouch6_PlateWithSideHandle(height,handleWidth,handleHoleWidth,handleHoleBorder,wallThickness,plateThickness,edgeRadius)`
A simple plate where the iPod Touch 6 can be mounted using `iPodTouch6_BottomHolder` and `iPodTouch6_TopHolder` and that adds a side handle to the device. This part is meant to be laser cut from an acrylic plate.
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
A simple plate where the iPod Touch 6 can be mounted using `iPodTouch6_BottomHolder` and `iPodTouch6_TopHolder` and that adds handles to the device. This part is meant to be laser cut from an acrylic plate.
#### Where
* `handleWidth`: the width of the handles around the device
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
#### Associated Global Variables
* `iPodTouch6_HolderPlate_Thickness`: the plate thickness
* `iPodTouch6_HolderPlate_HandlesWidth`: the width of the handles around the device
* `iPodTouch6_HolderPlate_EdgeRadius`: the radius of the vertical edges of the plate
### `iPodTouch6_HolderPlateElec(handleWidth,wallThickness,plateThickness,elecModuleHeight,elecModuleEdgeRadius)`
Similar to `iPodTouch6_HolderPlate()` except that a module has been adeed to install electronic components to it. This part is meant to be laser cut from an acrylic plate.
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
A simple cover for the electronic components used with `iPodTouch6_HolderPlateElec`. This part is meant to be laser cut from an acrylic plate.
#### Where
* `wallThickness`: the global wall thickness
* `plateThickness`: the plate thickness
* `elecModuleHeight`: the electronic module height
* `elecModuleEdgeRadius`: the electronic module edge radius
#### Associated Global Variables
* `iPodTouch6_HolderPlateElecTop_Thickness`: the plate thickness
### `iPodTouch6_GenericHorn(hornRadius,hornLength,hornDeformationFactor,hornDerivation,wallThickness,hornThickness,basePlateThickness)`
A customizable horn that plugs to the built-in speaker of the iPod Touch. It comes with a base plate that is used to easily glue the horn to the bottom holder. This part is meant to be printed with PLA or ABS.
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
A small passive amplifier for the iPod Touch 6 that can be glued to `iPodTouch6_BottomHolder`. This part is meant to be printed with PLA or ABS.
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
A large passive amplifier with a reinforcement bar for the iPod Touch 6 that can be glued to `iPodTouch6_BottomHolder`. This part is meant to be printed with PLA or ABS. 
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

