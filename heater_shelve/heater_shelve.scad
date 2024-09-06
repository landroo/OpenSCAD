$fa = 1;
$fs = 0.4;

height = 50;
radius = 150;
side = 4;
corner_rad = 8;

module rounded_ngon(num, r, rounding = 0) {
  function v(a) = let (d = 360/num, v = floor((a+d/2)/d)*d) (r-rounding) * [cos(v), sin(v)];
  polygon([for (a=[0:360-1]) v(a) + rounding*[cos(a),sin(a)]]);
}        

translate([0, radius / 3, 0])
    difference() {
        rotate([0,0,45])
            linear_extrude(height = height)
                rounded_ngon(num = side, r = radius, rounding = corner_rad);
        
        rotate([0,0,45])
            translate([0, 0, 2])
                linear_extrude(height = height)
            rounded_ngon(num = side, r = radius - 2, rounding = corner_rad);
        
        translate([-radius, -radius / 3, -1])
            cube([radius * 2, radius * 2, height + 2]);
    }


translate([-radius + 42, 0, 0])
    cube([radius * 2 - 42 * 2, 2, height]);

translate([radius - 42 - 20, 0, 0])
    cube([20, 2, height + 40]);

translate([-radius + 42, 0, 0])
    cube([20, 2, height + 40]);
    
difference() {
    translate([-radius + 42, 12, height + 40])
        rotate([0, 90, 0])    
            cylinder(radius * 2 - 42 * 2, 12, 12);    

    translate([-radius + 41, 12, height + 40])
        rotate([0, 90, 0])    
            cylinder(radius * 2 - 42 * 2 + 2, 10, 10);    

    translate([-radius, 2, height + 20])
        cube([radius * 2, 30, 20]);

    translate([-radius + 62, 0, height + 32])
        cube([radius * 2 - 124, 30, 20]);
}



