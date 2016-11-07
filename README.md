# Mobile 3D: Mobile Device Augmentation Library

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

# API Reference

## `basics.scad`
This library contains basic elements to construct mobile device augmentations.

### `roundedCube`
Arguments: `roundedCube(dimension,edgeRadius)`

A cube with rounded edges on the depth axis. This function is helpful for creating simple phone shapes.

#### Where

* `dimension=[width,depth,height]`: the size of the cube
* `edgeRadius`: the radius of the rounded edges

---


### `bottomHolder`
Arguments: `bottomHolder(deviceWidth,deviceDepth,deviceEdgeRadius,deviceHeightInHolder,wallThickness,holderEdgeRadius)`

A basic generic element to hold the bottom part of a device

#### Where

* `deviceWidth`: the width of the device to be held
* `deviceDepth`: the depth of the device to be held
* `deviceEdgeRadius`: the edge radius of the device to be held
* `deviceHeightInHolder`: the height of the part of the holder covering the device
* `wallThickness`: the holder's wall thickness
* `holderEdgeRadius`: the holder's edge radius

---


### `topHolder`
Arguments: `topHolder(deviceWidth,deviceDepth,deviceEdgeRadius,deviceHeightInHolder,wallThickness,lipsWidth,holderEdgeRadius)`

A basic generic element to hold the top part of a device

#### Where

* `deviceWidth`: the width of the device to be held
* `deviceDepth`: the depth of the device to be held
* `deviceEdgeRadius`: the edge radius of the device to be held
* `deviceHeightInHolder`: the height of the part of the holder covering the device
* `wallThickness`: the holder's wall thickness
* `lipsWidth`: size of the lips holding the device
* `holderEdgeRadius`: the holder's edge radius

---


### `rectangleCircularHorn`
Arguments: `rectangleCircularHorn(rectangleWidth,rectangleHeight,circleRadius,hornLength,wallThickness,hornDeformationFactor,hornDerivation,endsHeight)`

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

---


### `halfSphere`
Arguments: `halfSphere(radius)`

A half sphere useful to create tops.

#### Where

* `radius`: the radius of the half sphere

---


### `halfCylinder`
Arguments: `halfCylinder(dimension=[10,10,10])`

A half cylinder with controllable height.

#### Where

* `dimension=[width,depth,height]`: the size of the half cylinder

---
