$fa = 1;
$fs = 0.4;


cube([7.5, 4, 7.5]);

difference(){
    translate([-1.75, 4, -1.5])
        cube([11, 1, 9]);
    
    translate([1, 1, 1])
        cube([6, 5, 6]);
}    