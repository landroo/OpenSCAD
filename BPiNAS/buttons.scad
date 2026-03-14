$fa = 2;
$fs = 1;




difference() {
   union() {
      translate([0, 0, 0]) cube([3, 6, 10]);
      translate([4, 0, 0]) cube([3, 6, 10]);
      translate([8, 0, 0]) cube([3, 6, 10]);
   }

   translate([-2, 7, 0])
      rotate([30, 0, 0])
         cube([20, 20, 20]);
}      

translate([0, 0, 0]) cube([3, 6, 10]);
translate([4, 0, 0]) cube([3, 6, 10]);
translate([8, 0, 0]) cube([3, 6, 10]);
      