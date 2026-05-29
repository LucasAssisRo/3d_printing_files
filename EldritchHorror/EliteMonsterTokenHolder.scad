cardBoxSlotWidth = 38;
cardBoxSlotHeight = cardBoxSlotWidth;
cardBoxSlot = [cardBoxSlotWidth, cardBoxSlotHeight];

radius = 1;
wallOffset = 4;

cardBoxWidth = cardBoxSlotWidth + wallOffset - radius;
cardBoxHeight = cardBoxSlotHeight + wallOffset - radius;
cardBox = [cardBoxWidth, cardBoxHeight];

floorHeight = 2;
cardBoxZ = 67 - floorHeight;

$fn = 100;

module square_triangle(base, height) {
  polygon(points=[[0, 0], [base, 0], [0, height]], paths=[[0, 1, 2]]);
}

module shape(size, base = 12, height = 12) {
  difference() {
    square(size=size);
    square_triangle(base=base, height=base);
  }
}

module cutout() {
  square(size=[cardBox[0] / 2, 1000]);
}

minkowski() {
  difference() {
    linear_extrude(cardBoxZ)
      shape(size=cardBox);

    minkowski() {
      linear_extrude(cardBoxZ * 100)
        translate([cardBox[0] / 4, cardBox[1] / 4, 0])
          shape(size=cardBox / 2, base=5, height=5);
      cylinder(h=1, r=2);
    }

    translate(v=[(wallOffset - radius) / 2, (wallOffset - radius) / 2, floorHeight])
      linear_extrude(cardBoxZ)
        shape(size=cardBoxSlot);

    translate(v=[cardBox[0] / 4 + cardBox[0] / 8, -wallOffset, floorHeight])
      linear_extrude(cardBoxZ)
        cutout();
    rotate(a=90)
      translate(v=[cardBox[0] / 4 + cardBox[0] / 8, -400, floorHeight])
        linear_extrude(cardBoxZ)
          cutout();
  }

  cylinder(h=floorHeight, r=radius, center=false);
}
