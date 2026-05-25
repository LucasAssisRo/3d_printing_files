cardBoxSlotWidth = 62;
cardBoxSlotHeight = 90;
cardBoxSlot = [cardBoxSlotWidth, cardBoxSlotHeight];

wallOffset = 6;

cardBoxWidth = cardBoxSlotWidth + wallOffset;
cardBoxHeight = cardBoxSlotHeight + wallOffset;
cardBox = [cardBoxWidth, cardBoxHeight];

bottomThickness = 2;
cardBoxZRatio = 2;
cardBoxZ = (67 - bottomThickness) / cardBoxZRatio;

difference() {
  linear_extrude(cardBoxZ)
    square(size=cardBox);

  translate(v=[wallOffset / 2, wallOffset / 1.25, bottomThickness / 2])
    linear_extrude(cardBoxZ)
      square(size=cardBoxSlot);

  translate(v=[wallOffset / 2, -wallOffset, bottomThickness / 2])
    linear_extrude(cardBoxZ)
      square(size=cardBoxSlot);
  translate(v=[cardBoxWidth / 4, -wallOffset, -bottomThickness])
    linear_extrude(cardBoxZ * 2)
      square(
        size=[
          cardBoxWidth / 2,
          cardBoxHeight - cardBoxWidth / 4 + wallOffset,
        ],
      );
}
