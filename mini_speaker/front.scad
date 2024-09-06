


$fa = 1;
$fs = 0.4;

difference() {
    cube([60, 4, 60]);

    rotate([90,0,0])
        translate([30, 30, -8])
            cylinder(h=10,r=23);
    
    rotate([90,0,0])
        translate([2, 2, -8])
            cylinder(h=10,r=.5);
    rotate([90,0,0])
        translate([58, 2, -8])
            cylinder(h=10,r=.5);
    rotate([90,0,0])
        translate([58, 58, -8])
            cylinder(h=10,r=.5);
    rotate([90,0,0])
        translate([2, 58, -8])
            cylinder(h=10,r=.5);    
    
    
    rotate([90,0,0])
        translate([2, 2, -2])
            cylinder(h=4,r=1.5);
    rotate([90,0,0])
        translate([58, 2, -2])
            cylinder(h=4,r=1.5);
    rotate([90,0,0])
        translate([58, 58, -2])
            cylinder(h=4,r=1.5);
    rotate([90,0,0])
        translate([2, 58, -2])
            cylinder(h=4,r=1.5);    
    
}

difference() {
    rotate([90,0,0])
        translate([8, 8, -8])
            cylinder(h=4, r=3);
    rotate([90,0,0])
        translate([8, 8, -8])
            cylinder(h=4, r=.5);
}

difference() {
    rotate([90,0,0])
        translate([52, 8, -8])
            cylinder(h=4, r=3);
    rotate([90,0,0])
        translate([52, 8, -8])
            cylinder(h=4, r=.5);
}

difference() {
    rotate([90,0,0])
        translate([8, 52, -8])
            cylinder(h=4, r=3);
    rotate([90,0,0])
        translate([8, 52, -8])
            cylinder(h=4, r=.5);
}

difference() {
    rotate([90,0,0])
        translate([52, 52, -8])
            cylinder(h=4, r=3);
    rotate([90,0,0])
        translate([52, 52, -8])
            cylinder(h=4, r=.5);
}

translate([0, 4, 0])
    cube([60, 1, 1]);
translate([0, 4, 59])
    cube([60, 1, 1]);
translate([0, 4, 0])
    cube([1, 1, 60]);
translate([59, 4, 0])
    cube([1, 1, 60]);

