$fa = 1;
$fs = 0.4;

a=[[0,0],[0,10],[10,0]];

module wing(){
    rotate([0,90,0])
        difference(){
            union(){
                resize([14, 200, 2])
                    linear_extrude(2)
                        polygon(a);

                translate([7, 0, 0])        
                    cylinder(4, 7, 7);        
                

            }
            
            translate([7, 0, -1])        
                cylinder(6, 5.2, 5.2); 
     
            translate([-1, 180, -2])
                cube([10, 40, 10]);
            
        }

    translate([0, 30, -2])    
        cube([45, 150, 2]);    
        
    difference(){    
        translate([0, 30, 0])
            cube([45, 10, 6]);
        
        translate([-1, 32, 0])
            cube([12, 12, 6]);
        
    }   
        
    translate([0, 30, 6])    
        cube([45, 14, 2]);
}

wing();
//mirror([1, 0, 0]) wing();