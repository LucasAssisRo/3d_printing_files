cardBoxSlotWidth = 38;
cardBoxSlotHeight = cardBoxSlotWidth;
cardBoxSlot = [cardBoxSlotWidth, cardBoxSlotHeight];

radius = 1;
wallOffset = 4;

cardBoxWidth = cardBoxSlotWidth + wallOffset - radius;
cardBoxHeight = cardBoxSlotHeight + wallOffset - radius;
cardBox = [cardBoxWidth, cardBoxHeight];

cardBoxZ = 67 - wallOffset;

$fn = 100;
minkowski() {
  difference() {
    linear_extrude(cardBoxZ)
      square(size=cardBox);

    minkowski() {
      linear_extrude(cardBoxZ * 100)
        translate([cardBox[0] / 4, cardBox[1] / 4, 0])
          square(size=cardBox / 2);
      cylinder(h=1, r=2);
    }

    translate(v=[(wallOffset - radius) / 2, (wallOffset - radius) / 2, wallOffset / 2])
      linear_extrude(cardBoxZ)
        square(size=cardBoxSlot);

    translate(v=[cardBox[0] / 4, -wallOffset, wallOffset / 2])
      linear_extrude(cardBoxZ)
        square(size=[cardBox[0] / 2, 1000]);

    rotate(a=90)
      translate(v=[cardBox[0] / 4, -400, wallOffset / 2])
        linear_extrude(cardBoxZ)
          square(size=[cardBox[0] / 2, 100000]);
  }

  cylinder(h=wallOffset, r=radius, center=false);
}
