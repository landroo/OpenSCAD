$fa = 2;
$fs = 1;



module buttons() {
difference() {
   union() {
      translate([0, 0, 0]) cube([2, 6, 6]);
      translate([3, 0, 0]) cube([2, 6, 6]);
      translate([6, 0, 0]) cube([2, 6, 6]);
   }

   translate([-2, 7, 0])
      rotate([50, 0, 0])
         cube([30, 30, 30]);
}      


translate([0, 0, -1]) cube([2, 1, 1]);
translate([3, 0, -1]) cube([2, 1, 1]);
translate([6, 0, -1]) cube([2, 1, 1]);
      
translate([0, -1, 4]) cube([2, 1, 2]);
translate([3, -1, 4]) cube([2, 1, 2]);
translate([6, -1, 4]) cube([2, 1, 2]);

difference() {
   translate([-3, 0, -3]) cube([14, 3, 12]);
   
   translate([-1, 0, -1]) cube([10, 3, 8]);
   
   translate([-3, 1, -4]) cube([17, 3, 2]);
   translate([-3, 1, 8]) cube([17, 3, 2]);
   
   translate([-3, 1, -2]) cube([1, 2, 14]);
   translate([10, 1, -2]) cube([1, 2, 14]);
}

}

buttons();
