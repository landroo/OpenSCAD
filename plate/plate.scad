$fa = 1;
$fs = .4;
$fn = 100;

rad = 100;


difference(){
    resize([rad * 2, rad * 2, 40])
        sphere(rad);
    
    translate([0, 0, 4])
        resize([rad * 2 - 4, rad * 2 - 4, 48])
            sphere(rad);
    
    translate([-rad, -rad, 3])
        cube([rad * 2, rad * 2, rad]);
    
}

translate([0, 0, -20])
    cylinder(3, rad / 2, rad / 2);