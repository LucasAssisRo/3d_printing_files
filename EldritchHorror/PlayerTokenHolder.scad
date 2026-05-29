cardBoxSlotWidth = 35;
cardBoxSlotHeight = 38.5;
cardBoxSlot = [cardBoxSlotWidth, cardBoxSlotHeight];

radius = 1;
wallOffset = 4;

cardBoxWidth = cardBoxSlotWidth + wallOffset - radius;
cardBoxHeight = cardBoxSlotHeight + wallOffset - radius;
cardBox = [cardBoxWidth, cardBoxHeight];

floorHeight = 2;
cardBoxZ = 67 - floorHeight;
$fn = 50;

module shape(size) {
  union() {
    square(size=size);
    translate([size[0] / 2, size[1], 0])
      scale(v=[1.5, 0.65])
        circle(size[0] / 3);
  }
}

minkowski() {
  difference() {
    linear_extrude(cardBoxZ)
      shape(size=cardBox);

    minkowski() {
      factor = 2;
      linear_extrude(cardBoxZ * 100)
        translate(
          [
            cardBox[0] / (factor * 2),
            cardBox[1] / (factor * 2) - 5,
            0,
          ]
        )
          shape(size=[
          cardBox[0] / factor,
          cardBox[1] / factor + 10
          ]);
      cylinder(h=1, r=2);
    }

    translate(v=[(wallOffset - radius) / 2, (wallOffset - radius) / 2, floorHeight])
      linear_extrude(cardBoxZ)
        shape(size=cardBoxSlot);

    translate(v=[cardBox[0] / 4, -wallOffset, floorHeight])
      linear_extrude(cardBoxZ)
        square(size=[cardBox[0] / 2, 1000]);
    rotate(a=90)
      translate(v=[cardBox[1] / 4, -400, floorHeight])
        linear_extrude(cardBoxZ)
          square(size=[cardBox[1] / 2, 1000]);
  }

  cylinder(h=floorHeight, r=radius, center=false);
}
