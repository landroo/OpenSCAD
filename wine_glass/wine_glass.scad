$fa = 1;
$fs = .4;
$fn = 100;

scale([8, 8, 8]){
difference(){  
    translate([0,0,12.5])
        resize([12, 12, 16])
            sphere(10);
    
    translate([0,0,12.2])
        resize([11.8, 11.8, 15])
            sphere(10);
        
    translate([-8, -8, 15])
        cube([16,16,16]);
}

difference(){  
    translate([0,0,-5])
        cylinder(10, 2, 2);

    rotate_extrude(convexity = 2)
        translate([2, 0, 0])
            resize([3, 10])
                circle(r = 1);  
}

translate([0,0,-6])
    cylinder(1, 5, 2); 
translate([0,0,-6.2])
    cylinder(.2, 5, 5); 


}