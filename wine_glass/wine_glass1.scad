$fa = 1;
$fs = .4;
$fn = 100;

scale([8, 8, 8]){
difference(){  
    translate([0,0,14.2])
        resize([10, 10, 20])
            sphere(10);
    
    translate([0,0,14.2])
        resize([9.5, 9.5, 19.5])
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