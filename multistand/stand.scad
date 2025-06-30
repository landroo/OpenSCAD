$fa = 1;
$fs = 0.4;

use <threads.scad>

vise();
//screw();
//nut();
//bolt(50);
//base();

// nail
//cylinder(10, 2.5, 2.5);

module vise() {
   AugerHole(16, 10, 60, 5, [10, 30, 10], [90,0,0]){
       cube([60, 20, 20]);
       translate([60, 10, 0])
           cylinder(20, 10, 10);
       translate([0, 10, 0])
           cylinder(20, 10, 10);
   }

   translate([50, 10, 0])
       cube([20, 80, 20]);
/*
   translate([0, 80, 0])
       cube([60, 20, 20]);
   translate([60, 90, 0])
       cylinder(20, 10, 10);
   translate([0, 90, 0])
       cylinder(20, 10, 10);
*/   
   translate([0, 80, 0])
      AugerHole(16, 10, 60, 5, [10, 30, 10], [90,0,0]){
         cube([60, 20, 20]);
            translate([60, 10, 0])
            cylinder(20, 10, 10);
         translate([0, 10, 0])
            cylinder(20, 10, 10);
      }

}

module screw(h = 50) {
   difference(){
      
      union(){
      translate([10, -16, 10])
         rotate([-90, 0, 0])
            AugerThread(15, 10, h, 5);

      translate([10, 0, 10])
          rotate([90, 0, 0])
              cylinder(16, 16, 16);
          
      for (x =[0:10:360])
         translate([10 + sin(x) * 16, 0, 10 + cos(x) * 16])
            rotate([90, 0, 0])
               cylinder(16, 1, 1);
   }
   
      translate([10, 0, 10])
         edge();

      translate([10, -16, 10])
         mirror([0, 1, 0])
            edge();
}
}

module nut() {
   
   difference(){

      AugerHole(16, 10, 60, 5, [10, 30, 10], [90,0,0]){
         translate([10, 0, 10])
            rotate([90, 0, 0])
               cylinder(16, 16, 16);

         for (x =[0:10:360])
            translate([10 + sin(x) * 16, 0, 10 + cos(x) * 16])
               rotate([90, 0, 0])
                  cylinder(16, 1, 1);

      }
   
      translate([10, 0, 10])
         edge();

      translate([10, -16, 10])
         mirror([0, 1, 0])
            edge();

   }


}

//translate([10, 0, 10])edge();
module edge() {
rotate([90, 0, 0])
   difference(){
         cylinder(20, 18, 18);
         cylinder(20, 12, 12);

         translate([0, 0, -12])   
            cylinder(18, 0, 20);

         translate([-20, -20, 4])
            cube([40, 40, 40]);         
   }
}

module base() {
   cylinder(2, 50, 50);

   AugerHole(16, 10, 60, 5){
      cylinder(20, 30, 0);
   }
}

module bolt(h = 50){
   difference() {
      AugerThread(15, 10, h, 5);
      translate([0, 0, -6])
         cylinder(12, 2.5, 2.5);
      translate([0, 0, h - 6])
         cylinder(12, 2.5, 2.5);
      
   }
}


