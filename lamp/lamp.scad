$fa = 1;
$fs = 0.4;

/*
difference() {
      union() {
      cube([5, 5, 2]);
      translate([0, 2.4, 2]) rotate([0, 90, 0]) cylinder(5, .8, .8);
      }
   translate([0, 2.4, 2]) rotate([0, 90, 0]) cylinder(5, .4, .4);
   }
   
*/

/*
translate([0, 0, 40])
difference() {
   cylinder(70, 80, 20);
   cylinder(70, 78, 18);
   }
*/

module pipe (r1, r2, h) {
   difference() {
      cylinder(h, r1, r1);
      cylinder(h, r2, r2);
   }
}

module pipe2(r1, r2, part) {
   difference() {
      rotate_extrude(convexity = 10)
         translate([r2, 0, 0]) circle(r = r1);

      //rotate_extrude(convexity = 10)
         //translate([r2, 0, 0]) circle(r = r1 - 1);

      if(part == 1) {
         translate([-40, 0, -20]) cube([40, 40, 40]);
         translate([0, 0, -20]) cube([40, 40, 40]);
         translate([-40, -40, -20]) cube([40, 40, 40]);
      }
      if(part == 2){
         translate([-40, 0, -20]) cube([40, 40, 40]);
         translate([0, 0, -20]) cube([40, 40, 40]);
         translate([0, -40, -20]) cube([40, 40, 40]);
      }
      if(part == 3){
         translate([-40, 0, -20]) cube([40, 40, 40]);
         translate([-40, -40, -20]) cube([40, 40, 40]);
         translate([0, -40, -20]) cube([40, 40, 40]);
      }
      if(part == 4){
         translate([0, 0, -20]) cube([40, 40, 40]);
         translate([-40, -40, -20]) cube([40, 40, 40]);
         translate([0, -40, -20]) cube([40, 40, 40]);
      }
   }
}


module ball() {
   translate([0,0, 34])scale([1, 1, .5])
   difference() {
      translate([0, 0, -30]) sphere(100);
      translate([0, 0, -30]) sphere(98);
      translate([-150, -150, -340]) cube([300, 300, 300]);
   }

   difference() {
      translate([23, 0, 20]) pipe(3, 0, 50);
      translate([15, -10, 68]) rotate([0, 5, 0]) cube([20, 20, 20]);
   }
   difference() {
      translate([-23, 0, 20]) pipe(3, 0, 50);
      translate([-35, -10, 66]) rotate([0, -6, 0]) cube([20, 20, 20]);
   }

}
difference() {
   ball();
   translate([-150, 0, 0]) cube([300, 300, 300]);
}

module base() {
   translate([13, 0, 0]) rotate([90, 0, 0]) pipe2(4, 10, 1);
   translate([23, 0, 0]) pipe(4, 3, 30);

   translate([-13, 0, 0]) rotate([90, 90, 0]) pipe2(4, 10, 1);
   translate([-23, 0, 0]) pipe(4, 3, 30);

   translate([0, 0, -5])
   difference() {
      translate([0, 0, -20]) cylinder(20, 15, 15);
      translate([0, 0, -20]) cylinder(20, 13, 13);
   }
   difference() {
      translate([0, 0, -7]) cylinder(2, 15, 15);
      translate([0, 0, -7]) cylinder(2, 12.5, 12.5);
   }
}
//base();
