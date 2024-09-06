$fa = 1;
$fs = 0.4;

height = 50;
radius = 100;
side = 4;
corner_rad = 8;
rotnum = 27;

module rounded_ngon(num, r, rounding = 0) {
  function v(a) = let (d = 360/num, v = floor((a+d/2)/d)*d) (r-rounding) * [cos(v), sin(v)];
  polygon([for (a=[0:360-1]) v(a) + rounding*[cos(a),sin(a)]]);
}        
difference() {
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
    
    for (i=[-6:6])
        for (j=[0:3])
            translate([i * 10, -30, j * 10 + 10])
                rotate([90, 0, 0])
                    cylinder(20, 3, 3);

    for (i=[-6:6])
        for (j=[0:2])
            translate([i * 10, -j * 10 - 10, -5])
                cylinder(10, 3, 3);
        
    for (i=[0:2])
        for (j=[0:3])
            translate([-radius + rotnum - 10, i * 10 - 25, j * 10 + 10])
                rotate([0, 90, 0])
                    cylinder(20, 3, 3);        
    for (i=[0:2])
        for (j=[0:3])
            translate([radius - rotnum - 10, i * 10 - 25, j * 10 + 10])
                rotate([0, 90, 0])
                    cylinder(20, 3, 3);

}

difference() {
    translate([-radius + rotnum, 0, 0])
        cube([radius * 2 - rotnum * 2, 2, height]);

    for (i=[-6:6])
        for (j=[0:3])
            translate([i * 10, 5, j * 10 + 10])
                rotate([90, 0, 0])
                    cylinder(10, 3, 3);
}

translate([radius - rotnum - 20, 0, height])
    cube([20, 2, 40]);


translate([-radius + rotnum, 0, height])
    cube([20, 2, 40]);

difference() {
    translate([-radius + rotnum, 12, height + 40])
        rotate([0, 90, 0])    
            cylinder(radius * 2 - rotnum * 2, 12, 12);    

    translate([-radius + rotnum - 1, 12, height + 40])
        rotate([0, 90, 0])    
            cylinder(radius * 2 - rotnum * 2 + 2, 10, 10);    

    translate([-radius, 2, height + 20])
        cube([radius * 2, 30, 20]);

    translate([-radius + rotnum + 20, 0, height + 32])
        cube([radius * 2 - rotnum * 2 - 40, 30, 20]);
}




