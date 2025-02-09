$fa = 1;
$fs = 0.4;

// 70*90

h=18;
l=90;
w=70;
wl=4;


module side(x, y, z, l1, r1, r2){
    rotate([r2, r1, 0])
        translate([x, y, z]){
            sphere(wl/2);
            cylinder(l1, wl/2, wl/2);
            translate([0, 0, l1])
                sphere(wl/2);
        }
}

module rbox(sx, sy, sz) {
    side(0, 0, 0, sz, 0, 0);
    side(sx, 0, 0, sz, 0, 0);
    side(sx, sy, 0, sz, 0, 0);
    side(0, sy, 0, sz, 0, 0);

    side(0, 0, 0, l, 90, 0);
    side(0, sy, 0, l, 90, 0);
    side(-sz, 0, 0, l, 90, 0);
    side(-sz, sy, 0, l, 90, 0);

    side(0, 0, 0, sy, 0, -90);
    side(sx, 0, 0, sy, 0, -90);
    side(sx, -sz, 0, sy, 0, -90);
    side(0, -sz, 0, sy, 0, -90);

    translate([0, -wl/2, 0])
        cube([sx, wl, sz]);
    translate([0, sy - wl/2, 0])
        cube([sx, wl, sz]);
    
    translate([-wl/2, 0, 0])
        cube([wl, sy, sz]);
    translate([sx - wl/2, 0, 0])
        cube([wl, sy, sz]);
        
    translate([0, 0, - wl/2])
        cube([sx, sy, wl]);
    translate([0, 0, sz - wl/2])
        cube([sx, sy, wl]);
        
}

difference(){
    difference(){
        rbox(l, w, h);
        cube([l, w, h]);
    }
    
    // display
    translate([3, 7, 15])
        cube([40, 55, 10]);
    
    // SD
    translate([-5, 31, 11])
        cube([10, 27, 5]);
    
    // Joy
    translate([65, 13, 15])
        cylinder(10, 4, 4);
    
    // Bt3
    translate([52, 7, 15])
        cylinder(10, 2, 2);

    // Bt4
    translate([52, 18, 15])
        cylinder(10, 2, 2);
    
    // Bt1
    translate([55, 53, 15])
        cylinder(10, 4, 4);
    
    // Bt2
    translate([65, 43, 15])
        cylinder(10, 4, 4);
        
    // USB1
    translate([35, 63, 5])
        cube([9, 10, 4]);
        
    // USB2
    translate([55, 63, 5])
        cube([9, 10, 4]);

    // Switch
    translate([75, 63, 5])
        cube([9, 10, 4]);
    
    // half 1
    //translate([-5,  -5, h / 2])
        //cube([l + 10, w + 10, h + 10]);

    // half 2
    //translate([-5, -5, -3])
        //cube([l + 10, w + 10, h / 2 + 3]);

}

// add or remove
difference() {
    translate([-1, -1, h/2])
        cube([l + 2, w + 2, 4]);
    
    translate([0, 0, h/2 - 1])
        cube([l , w , 7]);
    
}


//color([1, 0, 0, .2]) cube([l, w, h]);
