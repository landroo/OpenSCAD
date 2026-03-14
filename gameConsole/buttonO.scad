$fa = 1;
$fs = 0.4;
/*
difference(){
  translate([90, 2, 10]) cylinder(10, 7, 7);
  translate([90, 2, 2]) cylinder(20, 5, 5);
}

translate([85, -3, 2])
  difference(){
     cube([10, 10, 3.5]);
     translate([2, 2, 0]) cube([6.1, 6.1, 5]);
     translate([0, 4, 0]) cube([10, 2, 5]);
     //translate([4, 0, 0]) cube([2, 10, 5]);
  }
*/

difference() {
   union() {
     cylinder(17, 4.8, 4.8);
     cylinder(2, 6, 6);
       
     translate([0, 0, 17])
       rotate_extrude(convexity = 10)
         translate([4.8 - 1, 0, 0])
           circle(1, $fn = 50);  
       
     translate([0, 0, 16]) cylinder(2, 3.8, 3.8);  
   }

/*
   translate([-2, -2, 17])
     scale([.5,.5,.5])
       linear_extrude(4) text("4");
*/   
}