$fa = 1;
$fs = 0.4;

//hori();
vert();

module hori() {
   difference() {
      union() {
         difference() {
            cylinder(12, 15, 15);
            cylinder(15, 7.5, 7.5);
         }

         translate([8, 0, 0])
            rotate([0, 0, -15])
               cube([25, 10, 12]);

         translate([10, -10, 0])
            rotate([0, 0, 15])
               cube([25, 10, 12]);

         translate([30, 0, 0])
            cylinder(12, 7.5, 7.5);
      }
      
      translate([30, 0, 0])
            cylinder(3.5, 7.5, 7.5);

      translate([30, 0, 8.5])
            cylinder(3.5, 7.5, 7.5);

      translate([30, 0, 0])
            cylinder(12, 3.5, 3.5);

   }
}

module vert() {
   difference() {
      union() {
         difference() {
            cylinder(12, 15, 15);
            cylinder(15, 7.5, 7.5);
         }

         translate([8, 0, 0])
            rotate([0, 0, -15])
               cube([25, 10, 12]);

         translate([10, -10, 0])
            rotate([0, 0, 15])
               cube([25, 10, 12]);

      }
      
      translate([33, 8, 6])
         rotate([90, 0, 0])
            cylinder(16, 8, 8);
   }
   
   difference(){
      translate([33, 2.5, 6])
         rotate([90, 0, 0])
            cylinder(5, 8, 8);
      
      translate([33, 4, 6])
         rotate([90, 0, 0])
            cylinder(8, 3.5, 3.5);
      
   }
}

