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
                    cylinder(2, 7, 7);        
            }
            
            translate([7, 0, -1])        
                cylinder(4, 5.1, 5.1); 
     
            translate([-1, 180, -2])
                cube([10, 40, 10]);
            
        }

    translate([0, 30, -2])    
        cube([45, 20, 2]);    
        
    translate([0, 170, -2])    
        cube([45, 10, 2]);        
        
    translate([0, 80, -2])    
        cube([45, 10, 2]);        
        
    translate([0, 125, -2])    
        cube([45, 10, 2]);        
        
    translate([35, 30, -2])    
        cube([10, 150, 2]);            
    
}

//wing();
mirror([1, 0, 0]) wing();