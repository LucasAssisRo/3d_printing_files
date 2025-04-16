cardSize = [67.5, 91];
boxHeight = 35;
wallThickness = 1.5;
floorThickness = 1.5;
bottomCutInset = 10; 

difference() {
    box = concat([for(size = cardSize) size + wallThickness * 2], [boxHeight]);
    cube(size = box, center = true);

    cutout = [cardSize[0], cardSize[1] + wallThickness * 2, boxHeight];
    translate(v = [0, wallThickness, floorThickness]) 
    cube(size = cutout, center = true);

    bottomCut = [
        cardSize[0] - bottomCutInset * 2,
        cardSize[1],
        floorThickness * 2,
    ];
    translate(v = [0, bottomCutInset, -boxHeight / 2 + floorThickness / 2])
    cube(size = bottomCut, center = true);
}
