$fa = 1;
$fs = 0.4;

module part(size = 10, pos = 0) {
    difference() {
        translate([pos * 20 + 10, 0, 2 + size / 2])
            rotate([90, 90, 0])
                cylinder(10, size / 2 + 2, size / 2 + 2);
            
        translate([pos * 20 + 10, 0, 2 + size / 2])
            rotate([90, 90, 0])
                cylinder(10, size / 2, size / 2);        
        
        translate([ pos * 20 -10 * sqrt(2) + 10, -10, 22])
            rotate([0, 45, 0])      
                cube([20, 20, 20]);
    }
    translate([pos * 20, 0 -15, 0])
        cube([20 , 20, 2]);
}

// 10x3, 12x2, 14x1
part(10, 0);
part(10, 1);
part(10, 2);
part(12, 3);
part(12, 4);
part(14, 5);

