cardBoxSlotWidth = 62;
cardBoxSlotHeight = 90;
cardBoxSlot = [cardBoxSlotWidth, cardBoxSlotHeight];

wallOffset = 4;

cardBoxWidth = cardBoxSlotWidth + wallOffset;
cardBoxHeight = cardBoxSlotHeight + wallOffset;
cardBox = [cardBoxWidth, cardBoxHeight];

cardBoxZ = 67 - wallOffset;

difference() {
  linear_extrude(cardBoxZ)
    square(size=cardBox);

  translate(v=[wallOffset / 2, wallOffset / 2, wallOffset / 2])
    linear_extrude(cardBoxZ)
      square(size=cardBoxSlot);

  translate(v=[wallOffset / 2, -wallOffset, wallOffset / 2])
    linear_extrude(cardBoxZ)
      square(size=cardBoxSlot);
  translate(v=[cardBoxSlotWidth / 4, -wallOffset, -wallOffset])
    linear_extrude(cardBoxZ * 2)
      square(
        size=[
          cardBoxSlotWidth / 2,
          cardBoxSlotHeight - cardBoxSlotWidth / 4 + wallOffset,
        ]
      );
}
