
$fa = 1;
$fs = 0.4;

Xsize = 60;
Ysize = 56;
Zsize = 60;

module body() {
    difference() {
        translate([0, 1, 0])
            cube([Xsize, Ysize, Zsize]);
        
        translate([2, -2, 2])
            cube([Xsize - 4, Ysize + 1, Zsize - 4]);
    }

    translate([1, 0, 1])
        cube([Xsize - 2, 1, 1]);
    translate([1, 0, Zsize - 2])
        cube([Xsize - 2, 1, 1]);
    translate([1, 0, 1])
        cube([1, 1, Zsize - 2]);
    translate([Xsize - 2, 0, 1])
        cube([1, 1, Zsize - 2]);

    difference() {
        rotate([90,0,0])
            translate([15, 15, -Zsize + 4])
                cylinder(h=5,r=2.5);
        
        rotate([90,0,0])
            translate([15, 15, -Zsize + 4])
                cylinder(h=5,r=.5);
    }
    difference() {
        rotate([90,0,0])
            translate([45, 15, -Zsize + 4])
                cylinder(h=5,r=2.5);
        
        rotate([90,0,0])
            translate([45, 15, -Zsize + 4])
                cylinder(h=5,r=.7);
    }    
    difference() {
        rotate([90,0,0])
            translate([15, 45, -Zsize + 4])
                cylinder(h=5,r=2.5);
        
        rotate([90,0,0])
            translate([15, 45, -Zsize + 4])
                cylinder(h=5,r=.7);
    }
    difference() {
        rotate([90,0,0])
            translate([45, 45, -Zsize + 4])
                cylinder(h=5,r=2.5);
        
        rotate([90,0,0])
            translate([45, 45, -Zsize + 4])
                cylinder(h=5,r=.7);
    }
    
}

module rect() {
    p0 = [1, 1];
    p1 = [1, 6];
    p2 = [6, 1];
    points = [p0, p1, p2];
    polygon(points);
}

module corners() {

translate([0, Ysize, 0])
    rotate([90, 0, 0])
        linear_extrude(height = Ysize)
            rect();
    
translate([Xsize, Ysize, 0])
    rotate([90, 270,0])
        linear_extrude(height = Ysize)
            rect();
    
translate([0, Ysize, Zsize])
    rotate([90, 90, 0])
        linear_extrude(height = Ysize)
            rect();
    
translate([Xsize, Ysize, Zsize])
    rotate([90, 180, 0])
        linear_extrude(height = Ysize)
            rect();
}

module boco() {
    body();
    corners();
}

difference() {
    boco();
    
    rotate([90,0,0])
        translate([2, 2, -8])
            cylinder(h=12,r=.7);
    
    rotate([90,0,0])
        translate([Xsize - 2, 2, -8])
            cylinder(h=12,r=.7);
    
    rotate([90,0,0])
        translate([Xsize - 2, Ysize + 2, -8])
            cylinder(h=12,r=.7);
    
    rotate([90,0,0])
        translate([2, Ysize + 2, -8])
            cylinder(h=12,r=.7);

    rotate([90,0,0])
        translate([30, 7, -Zsize])
            cylinder(h=20, r=2.5);
    
}


