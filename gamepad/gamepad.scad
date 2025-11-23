
$fa = 1;
$fs = 0.4;

uppart = false;

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
         translate([0, -22, 0]) rcube(80, 52, 22, 4);
         rcylinder(22, 30, 30, 2);
         translate([80, 0, 0]) rcylinder(22, 30, 30, 2);
      }

      // inside
      translate([0, 0, 2]) cylinder(18, 28, 28, 2);
      translate([80, 0, 2]) cylinder(18, 28, 28, 2);
      translate([0, -20, 2]) cube([80, 48, 18]);

      // left joystick
      translate([-.5, -.5, 10]) cylinder(20, 13, 13);

      // left cross
      //translate([-12, -5, 10]) cube([24, 8, 20]);
      //translate([-4, -13, 10]) cube([8, 24, 20]);

      // right button 1
      translate([90, 2, 10]) cylinder(20, 5, 5);
      // right button 2
      translate([80, -9, 10]) cylinder(20, 5, 5);
      // right button 3
      translate([80, 13, 10]) cylinder(20, 5, 5);
      // right button 4
      translate([70, 2, 10]) cylinder(20, 5, 5);
      
      // mid display
      translate([34, 13, 10]) cube([12, 8, 20]);
    
      // USB connector
      translate([36, 24, 3]) cube([7, 8, 3]);
      translate([36, 34, 4.5]) 
         rotate([90, 0, 0])
            cylinder(8, 1.5, 1.5);
      translate([43, 34, 4.5]) 
         rotate([90, 0, 0])
            cylinder(8, 1.5, 1.5);
            
      // switch
      translate([36, -24, 15.5]) cube([7, 8, 3.5]);

      // upper part
      if(part == 1) {
         translate([-40, -30, -30])cube([200, 80, 40]);
      }
      // bottom part
      if(part == 2) {
         translate([-40, -30, 10])cube([200, 80, 40]);
      }
  }

  if(part == 1) {
    // right button 1
    difference(){
      translate([90, 2, 10]) cylinder(10, 7, 7);
      translate([90, 2, 2]) cylinder(20, 5, 5);
    }
    // right button 2
    difference(){
      translate([80, -9, 10]) cylinder(10, 7, 7);
      translate([80, -9, 2]) cylinder(20, 5, 5);
    }
    // right button 3
    difference(){
      translate([80, 13, 10]) cylinder(10, 7, 7);
      translate([80, 13, 2]) cylinder(20, 5, 5);
    }
    // right button 4
    difference(){
      translate([70, 2, 10]) cylinder(10, 7, 7);
      translate([70, 2, 2]) cylinder(20, 5, 5);
    }

    // mid display
    difference(){
      translate([32, 11, 19]) cube([16, 12, 3]);
      translate([34, 13, 10]) cube([12, 8, 20]);
    }
    
    // controller case
    difference(){
      translate([27.5, -1, 15]) cube([25, 29, 5]);
      translate([29.5, 1, 8]) cube([21, 27, 16]);
      translate([31.5, -10, 8]) cube([16, 27, 16]);
    }
    
      // switch
    difference(){
      translate([31.5, -20, 13]) cube([17, 5, 8]);
      translate([33.5, -24, 13.5]) cube([13, 12, 7]);
    }

  }

  if(part == 2) {
   // button 1
   translate([85, -3, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6.2, 6.2, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }
   // button 2
   translate([75, -14, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6.2, 6.2, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }
   // button 3
   translate([75, 8, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6.2, 6.2, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }
   // button4
   translate([65, -3, 2])
      difference(){
         cube([10, 10, 3.5]);
         translate([2, 2, 0]) cube([6.2, 6.2, 5]);
         translate([0, 4, 0]) cube([10, 2, 5]);
         //translate([4, 0, 0]) cube([2, 10, 5]);
      }

   // joystick
   //translate([0, 0, 0]) cylinder(12, 10, 10);
   translate([-11.5, -17, 0]) 
      difference(){
         cube([24.5, 29.5, 11]);
         translate([2, 2, 0]) cube([20.5, 25.5, 14]);
         translate([2, 12, 0]) cube([25, 8, 14]);
         translate([8, 22, 0]) cube([7, 8, 14]);
      }

      // controller case
      translate([28, 0, 0])   
         difference() {
            translate([0, 13, 0]) cube([24, 15, 10]);
            translate([3, 12, 0]) cube([18, 17, 8]);
         }
      
      // controller base
      translate([33, 13, 10]) cube([14, 15, 4]);
   }
   
}

module innerEdge() {
  difference(){
    union() {
      translate([0, 0, 6]) cylinder(10, 29, 29, 2);
      translate([80, 0, 6]) cylinder(10, 29, 29, 2);
      translate([0, -18, 6]) cube([80, 47, 8]);
    }
    
    translate([0, 0, 5]) cylinder(12, 28, 28, 2);
    translate([80, 0, 5]) cylinder(12, 28, 28, 2);
    translate([0, -17, 5]) cube([80, 45, 12]);
    
  }
}

module outerEdge() {
  difference(){
    union() {
      translate([0, 0, 6]) cylinder(10, 30, 30, 2);
      translate([80, 0, 6]) cylinder(10, 30, 30, 2);
        translate([0, -22, 6]) cube([80, 52, 8]);
    }
    
    translate([0, 0, 5]) cylinder(12, 29, 29, 2);
    translate([80, 0, 5]) cylinder(12, 29, 29, 2);
    translate([0, -21, 5]) cube([80, 50, 12]);
    
  }
}

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

   
//innerEdge();


