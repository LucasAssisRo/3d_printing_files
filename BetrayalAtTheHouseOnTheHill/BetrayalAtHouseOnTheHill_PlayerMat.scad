angle = 360 / 5;

module pentagon(radius) {
    angles = [for(i = [0 : 4]) i * angle];
    coords = [for(th = angles) [radius * cos(th), radius * sin(th)]];
    polygon(coords);
}

module pentagonoid(height, radius) {
 linear_extrude(height = height , center = true)
 pentagon(radius = radius);
}

difference() {
  pentagonoid(height = 5, radius = 66);

  for(i = [0 : 4]) {
    rotate(a = angle * i) 
    translate(v = [-49.75, 0, 0])
    cube(size = [4.5, 60, 6], center = true); 
 }

  translate(v = [0, 0, 3])
  pentagonoid(height = 6, radius = 57);
  pentagonoid(height = 10, radius = 43);
}
