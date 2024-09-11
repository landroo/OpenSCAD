$fa = 1;
$fs = .4;
$fn = 100;


Di = 18.4;
Do = 18.4 + 4;
Ln = 10;


difference(){
    cylinder(Ln, Do / 2, Do / 2);
    cylinder(Ln, Di / 2 + .5, Di / 2);
}

translate([Do, 0, 0])
    difference(){
        cylinder(Ln, Do / 2, Do / 2);
        cylinder(Ln, Di / 2, Di / 2);
    }

translate([Do / 2 - 2, -6, 0])
cube([4, 12, 10]);
    