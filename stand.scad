$fa = 1;
$fs = 0.4;

use <threads.scad>


//clamp(30);
//screw(80, 16);
//nut(20);
//bolt(50);
//base();

// nail
//cylinder(10, 2.5, 2.5);

// vise
vise(110);
translate([100, 0, 0]) visehead();
translate([0, 40, 0]) rotate([0, 0, -90]) screw(170);
//difference(){cylinder(10, 9, 7.5);cylinder(10, 7.5, 7.5);}

module vise(ln = 130) {
  AugerHole(16, 10, 60, 5, [60, 15, 10], [90,0,0]){
    translate([40, 0, 0])
    hull(){
      cube([ln, 20, 20]);
      translate([0, 20, -10]) cube([ln, 1, 40]);
    }
  }

  translate([0, 0, -10]) 
    difference() {
      
      hull(){
        cube([40, 50, 40]);
        translate([30, 0, -10])
          cube([10, 50, 60]);
      }

      translate([0, 0, 30])
        rotate([30, 0, 0])
          cube([40, 40, 20]);

      translate([0, 0, 10])
        rotate([-30, 0, 0])
          translate([0, 0, -20])
          cube([40, 40, 20]);
          
      rotate([0, 0, 75])
         translate([-10, -40, 0])
            cube([20, 80, 40]);
          
      translate([0, 30, 20]) 
        rotate([0, 90, 0]) 
          cylinder(60, 7.5, 7.5);
    }

    difference(){
      hull() {
        translate([30, 40, -20]) cube([20, 20, 60]);
        translate([0, 50, -10]) cube([1, 1, 40]);
      }
  
      translate([50, 30, -20]) 
        rotate([0, 0, 45])
          cube([15, 15, 60]);
    }
}


module visehead() {
  translate([0, 0, -10]) 
  AugerHole(16, 10, 60, 5, [0, 30, 20], [0,90,0]){
    difference() {
      hull() {
        cube([30, 50, 40]);
        translate([0, 40, -10]) cube([10, 1, 60]);  
        }

      translate([0, 0, 10])
      //scale([1.005, 1.005, 1.005])
      hull(){
        cube([30, 20, 20]);
        translate([0, 20, -10]) cube([30, 1, 40]);
      }
        
    } 
  }

  difference() {
    hull() {
      translate([-10, 40, -20]) cube([20, 20, 60]);
      translate([29, 50, -10]) cube([1, 1, 40]);
    }

    translate([-10, 30, -20]) 
      rotate([0, 0, 45])
        cube([15, 15, 60]);
  }

}

module clamp(hg = 50) {
   AugerHole(16, 10, 60, 5, [10, 30, 10], [90,0,0]){
       cube([60, 20, 20]);
       translate([60, 10, 0])
           cylinder(20, 10, 10);
       translate([0, 10, 0])
           cylinder(20, 10, 10);
   }

   translate([50, 10, 0])
       cube([20, hg + 30, 20]);
/*
   translate([0, 80, 0])
       cube([60, 20, 20]);
   translate([60, 90, 0])
       cylinder(20, 10, 10);
   translate([0, 90, 0])
       cylinder(20, 10, 10);
*/   
   translate([0, hg + 30, 0])
      AugerHole(16, 10, 60, 5, [10, 30, 10], [90,0,0]){
         cube([60, 20, 20]);
            translate([60, 10, 0])
            cylinder(20, 10, 10);
         translate([0, 10, 0])
            cylinder(20, 10, 10);
      }

}

module screw(h = 50, wd = 20) {
   difference(){
      
      union(){
      translate([10, -16, 10])
         rotate([-90, 0, 0])
            AugerThread(15, 10, h, 5);

      translate([10, 0, 10])
          rotate([90, 0, 0])
              cylinder(wd, 16, 16);
          
      for (x =[0:10:360])
         translate([10 + sin(x) * 16, 0, 10 + cos(x) * 16])
            rotate([90, 0, 0])
               cylinder(wd, 1, 1);
      }
   
      translate([10, 0, 10])
         edge();

      translate([10, -wd, 10])
         mirror([0, 1, 0])
            edge();
   }
}

module nut(wd = 20) {
   
   difference(){

      AugerHole(16, 10, 60, 5, [10, 30, 10], [90,0,0]){
         translate([10, 0, 10])
            rotate([90, 0, 0])
               cylinder(wd, 16, 16);

         for (x =[0:10:360])
            translate([10 + sin(x) * 16, 0, 10 + cos(x) * 16])
               rotate([90, 0, 0])
                  cylinder(wd, 1, 1);

      }
   
      translate([10, 0, 10])
         edge();

      translate([10, -wd, 10])
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


