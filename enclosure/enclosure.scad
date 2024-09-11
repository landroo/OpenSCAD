$fa = 1;
$fs = .4;
$fn = 100;

module corner3() {
    include <corner3.scad>
}

module corner2() {
    include <corner2.scad>
}

module cornerT() {
    include <cornerT.scad>
}

module door() {
    include <door.scad>
}



w = 400;
h = 600;
d = 500;

Di = 18.4;
Do = 18.4 + 4;
Ln = 40;

// red box
cylinder(h, Di / 2, Di / 2);

translate([w, 0, 0])
    cylinder(h, Di / 2, Di / 2);

translate([w, d, 0])
    cylinder(h, Di / 2, Di / 2);

translate([0, d, 0])
    cylinder(h, Di / 2, Di / 2);

color("red")
    corner3();

rotate([0, 90, 0])
    cylinder(w, Di / 2, Di / 2);

color("red")
    translate([w, 0, 0])
        rotate([0, 0, 90])
            corner3();

rotate([270, 0, 0])
    cylinder(d, Di / 2, Di / 2);
    
color("red")
    translate([0, d, 0])
        rotate([0, 0, 270])
            corner3();

translate([w, 0, 0])    
    rotate([270, 0, 0])
        cylinder(d, Di / 2, Di / 2);

color("red")
    translate([w, d, 0])
        rotate([0, 0, 180])
            corner3();

translate([0, d, 0])    
    rotate([0, 90, 0])
        cylinder(w, Di / 2, Di / 2);

color("red")
    translate([0, 0, h])    
        rotate([0, 90, 0])
            corner3();

color("red")
    translate([0, 0, h])    
        rotate([0, 90, 0])
            corner3();

color("red")
    translate([w, 0, h])    
        rotate([0, 90, 90])
            corner3();

color("red")
    translate([w, d, h])    
        rotate([0, 90, 180])
            corner3();

color("red")
    translate([0, d, h])    
        rotate([0, 90, 270])
            corner3();
            
translate([0, 0, h])
    rotate([0, 90, 0])
        cylinder(w, Di / 2, Di / 2);

translate([0, d, h])
    rotate([0, 90, 0])
        cylinder(w, Di / 2, Di / 2);

translate([0, 0, h])
    rotate([270, 0, 0])
        cylinder(d, Di / 2, Di / 2);

translate([w, 0, h])
    rotate([270, 0, 0])
        cylinder(d, Di / 2, Di / 2);

// green frame
color("green")
    translate([w / 4, 0, 0])
        rotate([0, 0, 90])
            cornerT();

translate([w / 4, 0, 0])
    cylinder(h, Di / 2, Di / 2);


color("green")
    translate([w / 4, 0, h])
        rotate([180, 0, 90])
            cornerT();

color("green")
    translate([w / 4 * 3, 0, 0])
        rotate([0, 0, 90])
            cornerT();

translate([w / 4 * 3, 0, 0])
    cylinder(h, Di / 2, Di / 2);


color("green")
    translate([w / 4 * 3, 0, h])
        rotate([180, 0, 90])
            cornerT();

// blue door
color("blue")
    translate([w / 4 + Do, 0, Do])
        corner2();

color("blue")
    translate([w / 4 * 3 - Do, 0, Do])
        rotate([0, 0, 180])
            corner2();

color("blue")
    translate([w / 4 + Do, 0, h - Do])
        rotate([180, 0, 0])
            corner2();

color("blue")
    translate([w / 4 * 3 - Do, 0, h - Do])
        rotate([180, 0, 180])
            corner2();

all = 4 * w + 6 * h + 4 * d;

translate([w / 4 + Do, 0, Ln])
    cylinder(h - Ln * 2, Di / 2, Di / 2);
all1 = all + h - Ln * 2;

translate([w / 4 * 3 - Do, 0, Ln])
    cylinder(h - Ln * 2, Di / 2, Di / 2);
all2 = all1 + h - Ln * 2;

translate([w / 4 + Ln, 0, Do])
    rotate([0, 90, 0])
        cylinder(w / 2 - Ln * 2, Di / 2, Di / 2);
all3 = all2 + w / 2 - Ln * 2;

translate([w / 4 + Ln, 0, h - Do])
    rotate([0, 90, 0])
        cylinder(w / 2 - Ln * 2, Di / 2, Di / 2);
all4 = all3 + w / 2 - Ln * 2;

echo("All length: ", all4 / 1000 , "m");

color("magenta")
    translate([w / 4, 0, h - Do * 2 - Ln])
        door();

color("magenta")
    translate([w / 4, 0, Do * 2 + Ln])
        door();

color("magenta")
    translate([w / 4 * 3 - Do, 0, h / 2])
        rotate([0, 0, 270])
        door();
