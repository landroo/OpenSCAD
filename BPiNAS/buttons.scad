$fa = 2;
$fs = 1;


module buttons() {
   difference() {
      union() {
         translate([0, 0, 0]) cube([3, 10, 6]);
         translate([4, 0, 0]) cube([3, 10, 6]);
         translate([8, 0, 0]) cube([3, 10, 6]);
      }

      translate([-2, 11, 0])
         rotate([56, 0, 0])
            cube([30, 30, 30]);
         }


   translate([0, 0, -1]) cube([3, 1.5, 1]);
   translate([4, 0, -1]) cube([3, 1.5, 1]);
   translate([8, 0, -1]) cube([3, 1.5, 1]);
         
   translate([0, -2, 3]) cube([3, 2, 3]);
   translate([4, -2, 3]) cube([3, 2, 3]);
   translate([8, -2, 3]) cube([3, 2, 3]);

   difference() {
      translate([-2.5, 0, -3]) cube([16, 3, 11.5]);
      
      translate([-.5, 0, -1]) cube([12, 3, 7.5]);
      
      translate([-3, 1, -4]) cube([18, 3, 2]);
      translate([-3, 1, 7.5]) cube([18, 3, 2]);
      
      translate([-3, 1, -2]) cube([1.5, 2, 14]);
      translate([12.5, 1, -2]) cube([2, 2, 14]);
   }
}

buttons();

//cube([11, 2, 2]);
//cube([2, 7, 2]);