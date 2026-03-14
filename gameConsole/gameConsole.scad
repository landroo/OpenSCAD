
$fa = 1;
$fs = 0.4;

uppart = false;
sideview = false;

module rcylinder(h, r1, r2, e = 2) {

  translate([0, 0, e])
    rotate_extrude(convexity = 10)
      translate([r1 - e, 0, 0])
        circle(r = e, $fn = 50);

  translate([0, 0, h - e])
    rotate_extrude(convexity = 10)
      translate([r2 - e, 0, 0])
        circle(r = e, $fn = 50);

  translate([0, 0, e])
    cylinder(h - e * 2, r1, r2);
  
  cylinder(h, r1 - e, r2 - e);
}

module rcube(x, y, z, e = 2){
  
  //translate([e, e, e]) cube([x - e * 2, y - e * 2, z - e * 2]);
 
  rwall(x, y, z, e);
  translate([0, y - e, 0])
    rwall(x, y, z, e);
  
  translate([e, 0, 0])
    rotate([0, 0, 90])
      rwall(y, x, z, e);
  translate([x, 0, 0])
    rotate([0, 0, 90])
      rwall(y, x, z, e);

  translate([0, 0, e])
    rotate([270, 0, 0])
      rwall(x, z, y, e);
  translate([0, 0, z])
    rotate([270, 0, 0])
      rwall(x, z, y, e);
}

module rwall(x, y, z, e = 2){
  
  translate([e / 2, 0, e / 2])
    cube([x - e, e, z - e]);
  
  translate([e / 2, e / 2, e / 2])
    cylinder(z - e, e / 2, e / 2);
  translate([x - e / 2, e / 2, e / 2])
    cylinder(z - e, e / 2, e / 2);

  translate([e / 2, e / 2, e / 2])
    rotate([0, 90, 0])
      cylinder(x - e, e / 2, e / 2);
  translate([e / 2, e / 2, z - e / 2])
    rotate([0, 90, 0])
      cylinder(x - e, e / 2, e / 2);
    
  translate([e / 2, e / 2, z - e / 2])
    sphere(e / 2);
  translate([x - e / 2, e / 2, e / 2])
    sphere(e / 2);
  translate([e / 2, e / 2, e / 2])
    sphere(e / 2);
  translate([x - e / 2, e / 2, z - e / 2])
    sphere(e / 2);
  
}

module body(part){

  difference() {
    
      // outside
      union() {
         translate([0, -24, 0]) rcube(100, 54, 22, 4);
         rcylinder(22, 30, 30, 2);
         translate([100, 0, 0]) rcylinder(22, 30, 30, 2);
      }

      // inside
      translate([0, 0, 2]) cylinder(18, 28, 28, 2);
      translate([100, 0, 2]) cylinder(18, 28, 28, 2);
      translate([0, -22, 2]) cube([100, 50, 18]);

      // left X
      translate([-12.5, -4.5, 10]) cube([25, 9, 20]);
      translate([-4.5, -12.5, 10]) cube([9, 25, 20]);

      // right button 1
      translate([110, 2, 10]) cylinder(20, 5, 5);
      // right button 2
      translate([100, -9, 10]) cylinder(20, 5, 5);
      // right button 3
      translate([100, 13, 10]) cylinder(20, 5, 5);
      // right button 4
      translate([90, 2, 10]) cylinder(20, 5, 5);
      
      // mid display
      translate([21.5, -16.5, 10]) cube([56, 41, 20]);
      
      // SD card
      translate([46, 24, 15]) cube([24, 8, 3.5]);
    
      // USB connector
      translate([-1, 0, 8]){
        translate([36, 24, 3]) cube([6, 8, 3]);
        translate([36, 34, 4.5]) 
           rotate([90, 0, 0])
              cylinder(8, 1.5, 1.5);
        translate([42, 34, 4.5]) 
           rotate([90, 0, 0])
              cylinder(8, 1.5, 1.5);
      }
      
      // Power connector
      translate([32, -52, 9]){
        translate([36, 24, 3]) cube([6, 8, 3]);
        translate([36, 34, 4.5]) 
           rotate([90, 0, 0])
              cylinder(8, 1.5, 1.5);
        translate([42, 34, 4.5]) 
           rotate([90, 0, 0])
              cylinder(8, 1.5, 1.5);
      }
      
      //Speaker
      translate([34, 2, 0]) cylinder(4, 17, 17);
            
      // switch
      translate([49.5, -25, 12.5]) cube([7, 8, 3.5]);

      // upper part
      if(part == 1) {
         translate([-40, -30, -30]) cube([200, 80, 40]);
      }
      // bottom part
      if(part == 2) {
         translate([-40, -30, 10]) cube([200, 80, 40]);
      }
  }

  if(part == 1) {
    // right button 1
    difference(){
      translate([110, 2, 10]) cylinder(10, 7, 7);
      translate([110, 2, 2]) cylinder(20, 5, 5);
    }
    // right button 2
    difference(){
      translate([100, -9, 10]) cylinder(10, 7, 7);
      translate([100, -9, 2]) cylinder(20, 5, 5);
    }
    // right button 3
    difference(){
      translate([100, 13, 10]) cylinder(10, 7, 7);
      translate([100, 13, 2]) cylinder(20, 5, 5);
    }
    // right button 4
    difference(){
      translate([90, 2, 10]) cylinder(10, 7, 7);
      translate([90, 2, 2]) cylinder(20, 5, 5);
    }

    // display case
    difference(){
      translate([14, -18, 16]) cube([71, 44, 4]);
      translate([15.5, -16.5, 8]) cube([68, 41, 16]);
      
      // SD card
      translate([45, 24, 13]) cube([26, 12, 7]);
      
      // switch
      translate([46.5, -24, 10.5]) cube([13, 12, 7]);
      
      // xbutton
      translate([12, -10, 8]) cube([60, 25, 16]);
    }
    translate([14, -18, 16]) cube([3, 8, 2]);
    translate([14, 15, 16]) cube([3, 11, 2]);
    
    // switch
    difference(){
      translate([44.5, -22, 10]) cube([17, 5, 8]);
      translate([46.5, -26, 10.5]) cube([13, 12, 7]);
    }
    
    // Power
    difference(){
      translate([60, -23, 10]) cube([23, 6, 10]);
      translate([62, -23, 11]) cube([18, 6, 5]);
    }

  }

  if(part == 2) {
   // button 1
   translate([105, -3, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6.1, 6.1, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }
   // button 2
   translate([95, -14, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6.1, 6.1, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }
   // button 3
   translate([95, 8, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6, 6, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }
   // button4
   translate([85, -3, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6.1, 6.1, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }

    // X button
    translate([0, 0, 8.5]) {
       // button 1
       translate([4, -5, 4.5])
          difference(){
             cube([10, 10, 3.5]);
             translate([2, 2, 0]) cube([6.1, 6.1, 5]);
             translate([4, 0, 0]) cube([2, 10, 5]);
             //translate([4, 0, 0]) cube([2, 10, 5]);
          }
       // button 2
       translate([-5, -14, 4.5])
          difference(){
             cube([10, 10, 3.5]);
             translate([2, 2, 0]) cube([6.1, 6.1, 5]);
             translate([0, 4, 0]) cube([10, 2, 5]);
             //translate([4, 0, 0]) cube([2, 10, 5]);
          }
       // button 3
       translate([-5, 4, 4.5])
          difference(){
             cube([10, 10, 3.5]);
             translate([2, 2, 0]) cube([6, 6, 5]);
             translate([0, 4, 0]) cube([10, 2, 5]);
             //translate([4, 0, 0]) cube([2, 10, 5]);
          }
       // button4
       translate([-14, -5, 4.5])
          difference(){
             cube([10, 10, 3.5]);
             translate([2, 2, 0]) cube([6.1, 6.1, 5]);
             translate([4, 0, 0]) cube([2, 10, 5]);
             //translate([4, 0, 0]) cube([2, 10, 5]);
          }
       
          // middle X
          difference() {
            translate([0, 0, 2]) cylinder(6, 4, 4);
            translate([0, 0, 9]) sphere(3);
          }
      }
      
      // X cutton base
      translate([0, 0, 0]) cylinder(13, 16, 16);
      
      // speaker
      difference() {
         translate([34, 2, 0]) cylinder(4, 20, 20);
         translate([34, 2, 0]) cylinder(4, 18.5, 18.5);
         translate([46, -18, 2]) cube([20, 40, 5]);
      }
      for(i = [0: 4: 34]) {
         translate([16, -14 + i, 0])
            cube([36, 2, 2]);
      }
   }
}

//innerEdge();
module innerEdge() {
  difference(){
    union() {
      translate([0, 0, 6]) cylinder(10, 29, 29, 2);
      translate([80, 0, 6]) cylinder(10, 29, 29, 2);
      translate([0, -18, 6]) cube([100, 47, 8]);
    }
    
    translate([0, 0, 5]) cylinder(12, 28, 28, 2);
    translate([100, 0, 5]) cylinder(12, 28, 28, 2);
    translate([0, -17, 5]) cube([100, 45, 12]);
    
  }
}

module outerEdge() {
  difference(){
    union() {
      translate([0, 0, 8]) cylinder(8, 30, 30, 2);
      translate([100, 0, 8]) cylinder(8, 30, 30, 2);
      translate([0, -24, 8]) cube([100, 54, 4]);
    }

    translate([0, 0, 5]) cylinder(12, 29, 29, 2);
    translate([100, 0, 5]) cylinder(12, 29, 29, 2);
    translate([0, -23, 5]) cube([100, 52, 12]);
  }
}

module buttonX(){
  include<buttonX.scad>;
}

if(sideview) {
   difference() {
     union() {
       body(1);
       body(2);
       translate([0, 0, 17.75]) buttonX();  
     }
     translate([-40, -50, -10]) cube([180, 50, 50]);
   }  
}
else{
   if(uppart){
     body(1);
     outerEdge();
   }
   else{
     difference() {
        body(2);
        outerEdge();
     }
   }
}
   





  
  
  

