which = 0;

floorHeight = 2;
padding = 2;

playerSlotSize = [104, 130];
statsTokenDiameter = 20;
counterRowCount = 10;
counterCutoutWidth = (playerSlotSize[0] - (counterRowCount - 1) * padding) / counterRowCount;
counterColumnCount = 2;

resourcesHeight = 30;

matHeight = floorHeight * 2;
matSize = [
    playerSlotSize[0] + padding * 3 + statsTokenDiameter * 1.1 + resourcesHeight, 
    playerSlotSize[1] + padding * 2 + (counterCutoutWidth + padding) * counterColumnCount 
];

resourcesWidth = (matSize[1] - padding * 5) / 5;

playerCutoutDiameter = 24;
playerSlotCenter = [
    -(matSize[0] - playerSlotSize[0]) / 2 + resourcesHeight + padding, 
     (matSize[1] - playerSlotSize[1]) / 2
];

statsTokenCutoutV = [
    playerSlotCenter[0] + playerSlotSize[0] / 2 + playerCutoutDiameter / 2 + padding * 2,
    playerSlotCenter[1] - playerSlotSize[1] / 2 + playerCutoutDiameter / 2,
    floorHeight / 1.9
];

smallResourceTrayCount = 5;

module statsCutout(index) {
    hull() {
        step = index * (statsTokenDiameter + padding);
        translate(v = [
            statsTokenCutoutV[0],
            statsTokenCutoutV[1] + step,
            statsTokenCutoutV[2]
        ])
        linear_extrude(height = floorHeight, center = true)
            circle(d = statsTokenDiameter);
         translate(v = [
            statsTokenCutoutV[0] + statsTokenDiameter / 2,
            statsTokenCutoutV[1] + step,
            statsTokenCutoutV[2]
        ])
        linear_extrude(height = floorHeight, center = true)
            circle(d = statsTokenDiameter);
    }
}

module resourceTracker(column) {
    for(row = [1:counterRowCount]) {
        v = [
            playerSlotCenter[0] 
                + playerSlotSize[0] / 2 
                + padding
                - (counterCutoutWidth / 2) 
                - ((padding + counterCutoutWidth) * (row - 1)),
            playerSlotCenter[1] 
                - playerSlotSize[1] / 2 
                - counterCutoutWidth / 2 
                - padding * 2
                - (counterCutoutWidth + padding) * column,
            floorHeight / 1.9
        ];
        translate(v = v)
        linear_extrude(height = floorHeight, center = true) 
            square(size = counterCutoutWidth, center = true);
        
        textSize = counterCutoutWidth / 1.5;
        if(row == 1) {
            translate(v = v)
            rotate(a = 90, v = [0, 0, 1])
            linear_extrude(height = 1000, center = true) 
                text(
                    text = "I", 
                    size = textSize, 
                    font = "Arial Rounded MT Bold:style=Regular",
                    valign = "center",
                    halign = "center"
                );
        }

        if(row == 5) {
            translate(v = v)
            rotate(a = 90, v = [0, 0, 1])
            linear_extrude(height = 1000, center = true) 
                text(
                    text = "V", 
                    size = textSize,
                    font = "Arial Rounded MT Bold:style=Regular",
                    valign = "center",
                    halign = "center"
                );
        }

        if(row == 10) {
            translate(v = v)
            rotate(a = 90, v = [0, 0, 1])
            linear_extrude(height = 1000, center = true) 
                text(
                    text = "x", 
                    size = textSize,
                    font = "Arial Rounded MT Bold:style=Regular",
                    valign = "center",
                    halign = "center"
                );
        }
    }
}

module resourcesTray(index) {
 translate(v = [
        -matSize[0] / 2 + resourcesHeight / 2 + padding,
        -matSize[1] / 2 + resourcesWidth / 2 + padding + (resourcesWidth + padding) * index,
        floorHeight / 1.9
    ])
    linear_extrude(height = floorHeight, center = true)
        square(size = [resourcesHeight, resourcesWidth], center = true);
}

module playerMat() {
    difference() { 
        linear_extrude(height = matHeight, center = true)
            square(size = matSize, center = true);

        translate(v = [
            playerSlotCenter[0] + padding,
            playerSlotCenter[1] - padding,
            floorHeight / 1.9
        ])
        linear_extrude(height = floorHeight, center = true)
            square(size = playerSlotSize, center = true);

        translate(v = [
            playerSlotCenter[0],
            playerSlotCenter[1],
            floorHeight / 1.9
        ])
        linear_extrude(height = 100, center = true)
            circle(d = playerCutoutDiameter);
        
        for(index = [0:4]) {
            statsCutout(index = index);
        }

        for(index = [0:counterColumnCount - 1]) {
            resourceTracker(column = index);
        }
       
        for(index = [0:smallResourceTrayCount - 1]) {
            if(index == smallResourceTrayCount - 1) {
                translate(v = [0, -padding, 0]) 
                    resourcesTray(index = index);
            } else {
                resourcesTray(index = index);
            }
        }
    }
}

module healthCounterToken() {
    translate([matSize[0] / 2 + 10, 0, 0])
    minkowski() {
        cubeWidth = counterCutoutWidth - 4;
        cube(size = [cubeWidth, cubeWidth, 10], center = true);
        cylinder(h = 1, r = 2, center = true, $fn = 360);
    }
}


if (which == 1) {
    playerMat();
} else if (which == 2) {
    healthCounterToken();
} else {
    playerMat();
    healthCounterToken();
}
