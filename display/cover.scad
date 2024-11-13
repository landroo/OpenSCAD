$fa = 1;
$fs = 0.4;


difference(){
    union(){
        translate([0, 0, 1])
            cube([144, 68, 1]);

        translate([1, 1, 0])
            cube([142, 66, 1]);
    }

    translate([70, 67, -1])
        cylinder(5, 4, 4);
    
}