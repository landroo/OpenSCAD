$fa = 1;
$fs = 0.4;

height = 10;
radius = 20;

difference() {
    cylinder(h = height - 7, r = radius);
    
    translate([0, 0, 2])
        cylinder(h = height - 7, r = radius - 2);
}

difference() {
    translate([0, 0, height - 7])
        cylinder(h = 5, r = radius);
    
    translate([0, 0, height - 8])
        cylinder(h = 8, r = radius - 1);
}

