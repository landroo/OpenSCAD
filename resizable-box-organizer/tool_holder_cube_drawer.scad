$fa = 1;
$fs = 0.4;

height = 50;
Xsize = 40;
Ysize = 40;
open = 0;

module box() {
    difference() {
        cube([Xsize, Ysize, height - 7]);
        
        translate([2, 2, 2])
            cube([Xsize - 4, Ysize - 4, height - 7]);
    }

    difference() {
        translate([1, 1, height - 7])
            cube([Xsize - 2, Ysize - 2, 7]);
        
        translate([2, 2, height - 8])
            cube([Xsize - 4, Ysize - 4, 9]);
    }
}

/*
difference(){
    box();

    translate([-10, Ysize / 3 * 2, 0])
        cube([Xsize * 2, Ysize, height]);
}
*/

difference(){
    translate([2.5, 2.5, 2])
        cube([Xsize - 5, Ysize - 5, height - 2]);
    
    translate([4, 4, 4])
        cube([Xsize - 8, Ysize - 7, height - 6]);

    translate([-10, Ysize / 3 * 2, 0])
        cube([Xsize * 2, Ysize, height - 2]);

    if(open)
        translate([Xsize / 2, Ysize + Ysize / 4, height - 2])
            rotate([0, 0, 0])
                cylinder(2, Xsize / 2, Xsize / 2);
}

translate([Xsize / 2, Ysize / 2, height + 1])
    rotate([90, 90, 0])
        cylinder(2, Xsize / 14, Xsize / 14);



