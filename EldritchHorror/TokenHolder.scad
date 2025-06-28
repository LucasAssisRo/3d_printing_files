cardBoxSlotWidth = 45;
cardBoxSlotHeight = 71;
cardBoxSlot = [cardBoxSlotWidth, cardBoxSlotHeight];

wallOffset = 4;

cardBoxWidth = cardBoxSlotWidth + wallOffset;
cardBoxHeight = cardBoxSlotHeight + wallOffset;
cardBox = [cardBoxWidth, cardBoxHeight];

cardBoxZRatio = 1;
cardBoxZ = (67 - wallOffset) / cardBoxZRatio;

difference() {
  linear_extrude(cardBoxZ)
    square(size=cardBox);

  translate(v=[wallOffset / 2, wallOffset / 2, wallOffset / 2])
    linear_extrude(cardBoxZ)
      square(size=cardBoxSlot);
}
