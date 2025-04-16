boxSize = [67.5, 38];
boxHeight = 35;
wallThickness = 1.5;
floorThickness = 1.5;

difference() {
    box = concat(boxSize, [boxHeight]);
    cube(size = box, center = true);

    cutoutInset = wallThickness * 2;
    cutout = [
        boxSize[0] - cutoutInset,
        boxSize[1] - cutoutInset,
        boxHeight,
    ];
    translate(v = [0, 0, floorThickness]) 
    cube(size = cutout, center = true);
}
