linear_extrude(height = 10, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) 
difference() {
    circle(d = 180, $fn = 360);
    circle(d = 175,$fn = 360);
}
