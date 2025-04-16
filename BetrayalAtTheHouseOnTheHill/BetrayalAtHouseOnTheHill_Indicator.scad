union() {
  linear_extrude(height = 5, center = true)
  polygon(points = [[-5, -5], [5, -5], [5, 5], [-5, 5]]);
  translate(v = [0, 5, 0])
  linear_extrude(height = 5, center = true)
  polygon(points = [[-5, 0], [5, 0], [0, 20]]);
  translate(v = [0, 0, 5]) 
  cube(size = [10, 4.5, 5], center = true);
}
