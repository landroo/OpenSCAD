$fa = 1;
$fs = .4;
$fn = 100;

scale([8, 8, 8]){
difference(){
    translate([0, 0, 8.8])
        hull(){
            resize([14, 14, 8])
                sphere(1);

            translate([0, 0, 4])
                sphere(6);
        }
        
    translate([0, 0, 9])
        hull(){
            resize([13.5, 13.5, 8])
                sphere(1);

            translate([0, 0, 4])
                sphere(5.8);
        }
        

    translate([-8, -8, 15.5])
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
