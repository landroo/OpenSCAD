$fa = 1;
$fs = 0.4;

height = 50;
radius = 20;
side = 4;
corner_rad = 3;

module rounded_ngon(num, r, rounding = 0) {
  function v(a) = let (d = 360/num, v = floor((a+d/2)/d)*d) (r-rounding) * [cos(v), sin(v)];
  polygon([for (a=[0:360-1]) v(a) + rounding*[cos(a),sin(a)]]);
}        

module box() {
    difference() {
        linear_extrude(height = height - 7)
            rounded_ngon(num = side, r = radius, rounding = corner_rad);
        
        
        translate([0, 0, 2])
        linear_extrude(height = height - 7)
            rounded_ngon(num = side, r = radius - 2, rounding = corner_rad);
    }

    difference() {
        translate([0, 0, height - 7])
        linear_extrude(height = 5)
            rounded_ngon(num = side, r = radius - 1, rounding = corner_rad);

        translate([0, 0, height - 8])
        linear_extrude(height = 8)
            rounded_ngon(num = side, r = radius - 2, rounding = corner_rad);
    }
}
/*
difference() {
    box();
    
    translate([0, -radius - 2, 0])
        rotate([0, 0, 45])
            cube([(radius + 2) * sqrt(2), (radius + 2) * sqrt(2) / 2, height - 2]);

}
*/
difference() {

    translate([0, 0, 2])
        linear_extrude(height = height - 4)
            rounded_ngon(num = side, r = radius - 2.5, rounding = corner_rad);

    translate([0, 0, 3])    
        linear_extrude(height = height -7)
            rounded_ngon(num = side, r = radius - 4, rounding = corner_rad);
    
    translate([0, -radius - 2, 0])
        rotate([0, 0, 45])
            cube([(radius + 2) * sqrt(2), (radius / 2 + 2) * sqrt(2) / 2, height - 4]);

    //translate([radius - 2, -radius + 2, height-10])
    //    cylinder(10, radius, radius);


}

translate([0, 0, height - 1])
    rotate([45, 90, 0])
        //cube([radius / 3, radius / 8, 5]);
        cylinder(2, radius/7, radius/7);

