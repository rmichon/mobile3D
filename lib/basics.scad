// ## `basics.scad`
// This library contains basic elements to construct mobile device augmentations.

// ### `roundedCube(dimension,edgeRadius)`
// A cube with rounded edges on the depth axis. This function is helpful for creating simple phone shapes.
// #### Where
// * `dimension=[width,depth,height]`: the size of the cube
// * `edgeRadius`: the radius of the rounded edges 
module roundedCube(dimension=[10,10,10],edgeRadius=1){
    translate([0,dimension[1],0])
		rotate([90,0,0])
			hull(){
        		translate([edgeRadius,edgeRadius,0])
					cylinder(r=edgeRadius,h=dimension[1]);
        		translate([dimension[0]-edgeRadius,edgeRadius,0])
					cylinder(r=edgeRadius,h=dimension[1]);
        		translate([edgeRadius,dimension[2]-edgeRadius,0])
					cylinder(r=edgeRadius,h=dimension[1]);
        		translate([dimension[0]-edgeRadius,dimension[2]-edgeRadius,0])
					cylinder(r=edgeRadius,h=dimension[1]);
    		}
}

// ### `bottomHolder(deviceWidth,deviceDepth,deviceEdgeRadius,deviceHeightInHolder,wallThickness,holderEdgeRadius)`
// A basic generic element to hold the bottom part of a device
// #### Where
// * `deviceWidth`: the width of the device to be held
// * `deviceDepth`: the depth of the device to be held
// * `deviceEdgeRadius`: the edge radius of the device to be held
// * `deviceHeightInHolder`: the height of the part of the holder covering the device
// * `wallThickness`: the holder's wall thickness
// * `holderEdgeRadius`: the holder's edge radius
module bottomHolder(deviceWidth=10,deviceDepth=10,deviceEdgeRadius=1,
deviceHeightInHolder=10,wallThickness=1,holderEdgeRadius=1){
	difference(){
		translate([0,deviceDepth+wallThickness*2,0])
			rotate([90,0,0])
				roundedCube([deviceWidth+wallThickness*2,deviceHeightInHolder+wallThickness,
				deviceDepth+wallThickness*2],holderEdgeRadius);
		translate([wallThickness,wallThickness,wallThickness])
			roundedCube([deviceWidth,deviceDepth,
			deviceHeightInHolder+deviceEdgeRadius],deviceEdgeRadius);
	}
}

// ### `topHolder(deviceWidth,deviceDepth,deviceEdgeRadius,deviceHeightInHolder,wallThickness,lipsWidth,holderEdgeRadius)`
// A basic generic element to hold the top part of a device
// #### Where
// * `deviceWidth`: the width of the device to be held
// * `deviceDepth`: the depth of the device to be held
// * `deviceEdgeRadius`: the edge radius of the device to be held
// * `deviceHeightInHolder`: the height of the part of the holder covering the device
// * `wallThickness`: the holder's wall thickness
// * `lipsWidth`: size of the lips holding the device
// * `holderEdgeRadius`: the holder's edge radius
module topHolder(deviceWidth=10,deviceDepth=10,deviceEdgeRadius=1,deviceHeightInHolder=10,
wallThickness=1,lipsWidth=2,holderEdgeRadius=1){
	difference(){
		translate([0,deviceDepth+wallThickness*2,0])rotate([90,0,0])
			roundedCube([deviceWidth+wallThickness*2,deviceHeightInHolder+wallThickness,
			deviceDepth+wallThickness*2],holderEdgeRadius);
		translate([wallThickness,wallThickness,-wallThickness*2])
			roundedCube([deviceWidth,deviceDepth,deviceHeightInHolder],deviceEdgeRadius);
		//translate([wallThickness+lipsWidth,-0.01,-wallThickness-lipsWidth-0.85]) // TODO: 0.85 wrong here: needs to be fixed
		//	roundedCube([deviceWidth-lipsWidth*2,wallThickness+0.02,deviceHeightInHolder],
	//		deviceEdgeRadius*((deviceWidth-lipsWidth*2)/deviceWidth));
	}
}

// ### `rectangleCircularHorn(rectangleWidth,rectangleHeight,circleRadius,hornLength,wallThickness,hornDeformationFactor,hornDerivation,endsHeight)`
// A horn with a square termination on one side and a circle termination on the other.
// #### Where
// * `rectangleWidth`: the width of the rectangular termination
// * `rectangleHeight`: the height of the rectangular termination
// * `circleRadius`: the radius of the circular termination
// * `hornLength`: the length of the horn
// * `wallThickness`: the thickness of the walls
// * `hornDeformationFactor`: controls the vertical flatness of the horn with (1=perfect circle, >1=flatened circle) 
// * `hornDerivation`: displace the position of the circular end relatively to the rectangular end on the horizontal axis
// * `endsHeight`: the height of the two ends
module rectangleCircularHorn(rectangleWidth=10,rectangleHeight=10,circleRadius=10,hornLength=10,wallThickness=1,
hornDeformationFactor=1,hornDerivation=0,endsHeight=0.5){
	difference(){
		hull(){
			cube([rectangleWidth+wallThickness,rectangleHeight+wallThickness,endsHeight],center=true);
			translate([hornDerivation,0,hornLength-endsHeight*2])
				scale([1,hornDeformationFactor,1])
					cylinder(r=circleRadius+wallThickness,h=endsHeight);
		}
		hull(){
			translate([0,0,-0.01])
				cube([rectangleWidth,rectangleHeight,endsHeight],center=true);
			translate([hornDerivation,0,hornLength-endsHeight*2+0.01])
				scale([1,hornDeformationFactor,1])
					cylinder(r=circleRadius,h=endsHeight);
		}
	}
}

// ### `halfSphere(radius)`
// A half sphere useful to create tops.
// #### Where
// * `radius`: the radius of the half sphere
module halfSphere(radius=10){
	difference(){
		translate([radius,radius,0])sphere(radius);
		translate([0,0,-radius*2])cube([radius*2,radius*2,radius*2]);
	}
}

// ### `halfCylinder(dimension=[10,10,10])`
// A half cylinder with controllable height.
// #### Where
// * `dimension=[width,depth,height]`: the size of the half cylinder
module halfCylinder(dimension=[10,10,10]){
	rotate([-90,0,0])scale([1,dimension[2]/dimension[0],1])difference(){
		translate([dimension[0]/2,0,0.01])cylinder(r=dimension[0]/2,h=dimension[1]);
		cube([dimension[0],dimension[0],dimension[1]+0.02]);
	}
}





