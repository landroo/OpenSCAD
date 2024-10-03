$fa = 1;
$fs = .4;
$fn = 100;


// 62x37x21
// 14
// 10
// 35
// 22
// 44 /2
// 96x26
/*
color([.5,.5,.5,.5])
  translate([-10, -35, 0])
    cube([10, 96, 26]);

color([.5,.5,.5,.5])
  translate([0, 61, 0])
    cube([37, 10, 26]);
*/
difference(){
  union(){
    difference(){
      hull(){
        cube([37, 60, 10]);
         
        difference(){
          translate([19, 32, 0])
            cylinder(20, 20, 20);

          translate([37, 15, 0])
            cube([10, 40, 24]);        

          translate([-10, 15, 0])
            cube([10, 40, 24]);        
          }
        }
      
        translate([-1, 46, 0])
          cube([40, 40, 24]);        
      }

    difference(){
      translate([0, -35, -4])
        cube([37, 35, 14]);        

      translate([0, -15, -6])
        cylinder(20, 7, 7);
      
      translate([-1, -42, -5])
        cube([8, 27, 18]);

      translate([37.5, -15, -6])
        cylinder(20, 7, 7);

      translate([30.5, -42, -5])
        cube([7, 27, 18]);
          
      translate([0, -36, -5])
        cube([35, 4, 4]);
      
      translate([0, -36, 9])
        cube([35, 2, 2]);

      }
      
    translate([7, -32, -1])
      rotate([0, 90, 0])
        cylinder(2.5, 3, 3);

    translate([28, -32, -1])
      rotate([0, 90, 0])
        cylinder(2.5, 3, 3);
      
    translate([7, -34, 9])
      rotate([0, 90, 0])
        cylinder(23.5, 1, 1);
  }
  
  translate([9.5, -36, -6])
    cube([18.5, 50, 14]);
 
  translate([0, -29, 3])
    rotate([0, 90, 0])
      cylinder(35, 1.7, 1.7);

  translate([-1, 58, -80 ])
    rotate([0, 90, 0])
      cylinder(40, 100, 100);
}

difference(){
  union(){
    translate([18.5, 42, 16])
      cylinder(9, 37/2, 37/2);

    translate([18.5, 42, 16])
      cylinder(11, 16, 16);

    translate([18.5, 42, 25])
      rotate_extrude(convexity = 10)
        translate([16.5, 0, 0])
          circle(r = 2, $fn = 100);
    
    translate([18.5, 42, 16])
      cylinder(2, 22, 22);
    
  }

  translate([0, 61, 0])
    cube([37, 10, 26]);
}

translate([18.5, -3, 3])
  cylinder(5, 4.5, 4.5);

translate([18.5, -3, 3])
  sphere(3.5);

translate([18.5, -14, 3])
  cylinder(5, 4.5, 4.5);

translate([14, -14, 3])
  cube([9, 12, 5]);



