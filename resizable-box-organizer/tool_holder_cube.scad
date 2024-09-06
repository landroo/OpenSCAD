$fa = 1;
$fs = 0.4;

height = 150;
Xsize = 60;
Ysize = 40;

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
