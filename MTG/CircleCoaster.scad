$fn = 1000;

slotRadius = 86 / 2;
slotThickness = 2;
coasterOffset = 5;
coasterRadius = slotRadius + coasterOffset;
coasterThickness = 4;

difference() {
  linear_extrude(coasterThickness) {
    circle(coasterRadius);
  }

  translate(v=[0, 0, coasterThickness - slotThickness]) {
    linear_extrude(slotThickness) {
      circle(slotRadius);
    }
  }
}
