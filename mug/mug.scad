$fa = 1;
$fs = .4;

text = "MyMug";
rad = 40;
height = 90;
txtang = 120;
txtbeg = 10;


difference() {
cylinder(height, rad, rad);

for (i=[0:len(text)])
    rotate([90, 0, i * (txtang / len(text)) + 90 - txtang / 2 + txtbeg])
        translate([rad - 1, height / 2, 0])
            rotate([0, 90, 0])
                linear_extrude(3)
                    text(text[i], size=18, halign = "center");

    translate([0, 0, 2])
        cylinder(height, rad - 2, rad - 2);
}


translate([0, 0, height])
    rotate_extrude(convexity = 10, $fn = 100)
        translate([rad - 1, 0, 0])
            circle(r = 1, $fn = 100);

translate([6, -rad + 1, height / 3])
rotate([0, 270, 0])
scale([.7 * height / 100, 1, 1])
handler();

module handler(){
difference(){
    hull(){
        translate([37, -5, 0])
            cylinder(10, 35, 35);
        translate([37, -5, -1])
            cylinder(12, 34.5, 34.5);
        translate([37, -5, -2])
            cylinder(14, 33, 33);
        
        translate([75, -25, 0])
            cylinder(10, 5, 5);
        translate([75, -25, -1])
            cylinder(12, 4.5, 4.5);
        translate([75, -25, -2])
            cylinder(14, 3, 3);
        
        translate([0, 0, 0])
            cylinder(10, 20, 20);
        translate([0, 0, -1])
            cylinder(12, 19.5, 19.5);
        translate([0, 0, -2])
            cylinder(14, 18, 18);
    }
    
    hull(){
        translate([35, -3, -10])
            cylinder(30, 30, 30);
        
        translate([72, -23, -10])
            cylinder(30, 2, 2);
        
        translate([5, 3, -10])
            cylinder(30, 20, 20);
    }
    
    translate([-20, 0, -10])
        cube([100, 50, 30]);    
}

difference(){
    translate([-25, -6, 0])
        cube([10, 6, 10]);

    translate([-27, -7, -1])
        cylinder(14, 8, 8);
}


difference(){
    translate([55, -7, -2])
        cube([14, 7, 14]);

    translate([58, -10, -3])
        cylinder(16, 11, 11);
}

}