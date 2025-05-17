tolerance = 0.5;

ladderDiameter = 29 + tolerance;
hookDiameter = ladderDiameter + 10;

hookLength = 10;

backWidth = (hookDiameter - ladderDiameter) / 2;
backHeight = hookDiameter / 2;

height = 80;

$fn = 100;

module hook() {
  minkowski() {
    union() {
      translate(v=[-hookDiameter / 2 + backWidth / 2, 0, 0])
        cube(size=[backWidth, backHeight + 5, height], center=true);

      difference() {
        translate(v=[hookLength / 2, -hookDiameter / 4, 0])
          cube(size=[hookDiameter + hookLength, hookDiameter / 2, height], center=true);
        rotate(a=[0, 0, 7.5])
          hull() {
            cylinder(h=height * 3, d=ladderDiameter, center=true);
            translate([100, 0, 0])
              cylinder(h=height * 3, d=ladderDiameter, center=true);
          }
      }

      translate(v=[-hookDiameter / 2 + backWidth / 2, -hookDiameter / 2 - 5, 0])
        cube(size=[backWidth, backHeight, height], center=true);

      difference() {
        translate(v=[hookLength / 2, -hookDiameter / 4 - hookDiameter / 2, 0])
          cube(size=[hookDiameter + hookLength, backHeight, height], center=true);

        translate(v=[0, -hookDiameter, 0])
          rotate(a=[0, 0, 7.5])
            hull() {
              cylinder(h=height * 3, d=ladderDiameter, center=true);
              translate([100, 0, 0])
                cylinder(h=height * 3, d=ladderDiameter, center=true);
            }
      }
      translate(v=[-hookDiameter / 2 + backWidth / 2, -hookDiameter, 0])
        cube(size=[backWidth, backHeight + 45, height], center=true);
    }
    translate(v=[-hookDiameter / 2, 0, 0])
      cylinder(h=height, r=1, center=true);
  }
}

hook();
