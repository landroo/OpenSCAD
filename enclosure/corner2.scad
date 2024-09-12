$fa = 1;
$fs = .4;
$fn = 100;


Di = 18.4;
Do = 18.4 + 4;
Ln = 40;



difference(){
    union(){
        sphere(Do / 2);
        cylinder(Ln, Do / 2, Do / 2);
        rotate([0, 90, 0])
            cylinder(Ln, Do / 2, Do / 2);
    }
    
    cylinder(Ln, Di / 2, Di / 2);
    rotate([0, 90, 0])
        cylinder(Ln, Di / 2, Di / 2);
    
}

