$fa = 1;
$fs = 0.4;



difference() {
    cube([144, 68, 45]);

    translate([2, 2, 2])
            cube([140, 64, 46]);
    
    translate([9, 70, 15])    
        rotate([90, 0, 0])
            cylinder(10, 3.5, 3.5);   
    
    translate([1, 1, 44])
        cube([142, 66, 1]);
    
    
    translate([21, 70, 15])    
        rotate([90, 0, 0])
            cylinder(10, 3.5, 3.5);    
    
    translate([34, 70, 14])    
        rotate([90, 0, 0])
            cylinder(10, 5, 5);    
    translate([56, 70, 14])    
        rotate([90, 0, 0])
            cylinder(10, 5, 5);    
    translate([34, 60, 9])     
        cube([23, 10, 10]);    
        
    translate([68, 70, 13])    
        rotate([90, 0, 0])
            cylinder(10, 5, 5);    
    translate([98, 70, 13])    
        rotate([90, 0, 0])
            cylinder(10, 5, 5);    
    translate([68, 60, 8])     
        cube([30, 10, 10]);    

    translate([106, 60, 7])     
        cube([17, 10, 8]);    

    translate([130, 60, 7])     
        cube([10, 10, 11]);    
            
    translate([26, -2, 19])
        cube([8, 10, 8]);
    translate([51, -2, 19])
        cube([8, 10, 8]);
    translate([66, -2, 19])
        cube([8, 10, 8]);
    translate([81, -2, 19])
        cube([8, 10, 8]);
    translate([96, -2, 19])
        cube([8, 10, 8]);
    translate([111, -2, 19])
        cube([8, 10, 8]);
    translate([39, 5, 23])
        rotate([90, 0, 0])
            cylinder(10, 1.5, 1.5);
}

translate([22, 16, 2])
    difference() {
        cylinder(4, 3, 3);
        cylinder(5, 1, 1);
    }
translate([16, 44, 2])
    difference() {
        cylinder(4, 3, 3);
        cylinder(5, 1, 1);
    }    
translate([127, 17, 2])
    difference() {
        cylinder(4, 3, 3);
        cylinder(5, 1, 1);
    }    
translate([128, 45, 2])
    difference() {
        cylinder(4, 3, 3);
        cylinder(5, 1, 1);
    }    

//translate([20, 3, 16])
    //cube([104, 8, 22]);

translate([29.5, 7, 29.5])
    rotate([90, 0, 0])    
        difference() {
            cylinder(5, 2, 2);
            cylinder(5, .75, .75);
        }
        
        
translate([113.5, 7, 29.5])
    rotate([90, 0, 0])    
        difference() {
            cylinder(5, 2, 2);
            cylinder(5, .75, .75);
        }        
        
translate([-4, 20, 25])
    rotate([0, 90, 0])
        cylinder(4, 5, 5);        
        
translate([144, 20, 25])
    rotate([0, 90, 0])
        cylinder(4, 5, 5);        
        
        
        
        

        