$fa = 1;
$fs = 0.4;

height = 50;
Xsize = 40;
Ysize = 40;
front = 0;
Xnum = 3;
Ynum = 2;
/*
difference() {
    cube([Xsize, Ysize, 5]);
    
    translate([2, 2, 2])
        cube([Xsize - 4, Ysize - 4, height - 7]);
}
*/

difference() {
    cube([(Xsize + 5) * Xnum + 5, (Ysize + 5) * Ynum + 5, 5]);

    for (i=[0: Xnum -1])
        for (j=[0: Ynum -1])
            translate([5 + i * (Xsize + 5) + front, 5 + j * (Ysize + 5) + front, 0])
                cube([Xsize - front, Ysize - front, 5]);
    }        
        