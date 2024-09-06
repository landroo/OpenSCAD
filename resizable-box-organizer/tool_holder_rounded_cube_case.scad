$fa = 1;
$fs = 0.4;

radius = 20;
side = 4;
corner_rad = 3;
Xsize = 2;
Ysize = 2;
front = 0;
        
module rounded_ngon(num, r, rounding = 0) {
  function v(a) = let (d = 360/num, v = floor((a+d/2)/d)*d) (r-rounding) * [cos(v), sin(v)];
  polygon([for (a=[0:360-1]) v(a) + rounding*[cos(a),sin(a)]]);
}        

module hole() {
    linear_extrude(height = 8)
        rounded_ngon(num = side, r = radius, rounding = corner_rad);
}

difference() {
    cube([Xsize * (radius + 4) * sqrt(2), 5, Ysize * (radius + 4) * sqrt(2)]);

    for (i=[0: Xsize - 1])
        for (j=[0: Ysize - 1])
            translate([17 + i * (radius + 4) * sqrt(2), 6, 17 + j * (radius + 4) * sqrt(2)])
    rotate([90, 45, 0])
        hole();
}
