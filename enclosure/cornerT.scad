$fa = 1;
$fs = .4;
$fn = 100;


Di = 18.4;
Do = 18.4 + 4;
Ln = 40;

difference(){
    union(){
        translate([0, -Ln, 0])
            rotate([270, 0, 0])
                cylinder(Ln * 2, Do / 2, Do / 2);

        difference(){
            cylinder(Ln, Do / 2, Do / 2);
            cylinder(Ln, Di / 2, Di / 2);
        }
    }
    
    translate([0, -Ln, 0])
        rotate([270, 0, 0])
            cylinder(Ln * 2, Di / 2, Di / 2);
}
