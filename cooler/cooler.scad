$fa = 2;
$fs = 1;

include <rwall.scad>

s = 200;
wing = true;
box = true;
side = false;

// engine
//color([1,0,0,.5]) translate([0, 0, 0]) cylinder(13.8, 12.1, 12.1);
//color([1,0,0,.5]) translate([0, 0, -5]) cylinder(19, 1, 1);

//
module wing() {
  translate([s / 2 + 10, 0, 5])
  difference() {
    resize([s, s / 2, 20])
      difference() {
        sphere(10);
        sphere(9);
      }

    translate([-s / 2, 0, -15]) cube([s, s, 30]);
    translate([-s / 2, -s / 2, 0]) cube([s, s, 30]);
    translate([0, -s / 2, -15]) cube([s, s, 30]);
  }
}
//wing();

//
module wings(){

  difference() {
    // wings
    translate([0, 0, 3])  
    for(i = [1: 45: 360])
       rotate([0, 0, i])
         scale([1, 1, 1.5])
            wing();

    // outer ring
    translate([0, 0, -5])
      difference() {
        cylinder(20, s / 2 + 10,  s / 2 + 50);
        cylinder(20, s / 2 - 2,  s / 2 - 2);
      }
    
    // middle hole  
    translate([0, 0, -5]) cylinder(20, 13, 13);
  }
  
  // middle
  translate([0, 0, -4])
  difference() {
    rcylinder(19, 15, 15);
    translate([-20, -20, 14.5]) cube([40, 40, 40]);
    translate([0, 0, 4]) cylinder(15, 12.5, 12.5);
    translate([0, 0, 0]) cylinder(15, 1.2, 1.2);
  }
  
  //translate([-s/2, -s/2, -15]) cube([s, s, 10]);
}

//
module box() {

  difference(){
    translate([0, 0, -5]) rpoly(4, 20, s - 2.9, 5);
    
    // 
    translate([0, 0, -10])  cylinder(30, s / 2 - 1,  s / 2 - 1);
    
    // holes
    translate([-s / 2 + 5, -s / 2 + 5, -10]) cylinder(30, 2, 2);
    translate([-s / 2 + 5, s / 2 - 5, -10]) cylinder(30, 2, 2);
    translate([s / 2 - 5, s / 2 - 5, -10]) cylinder(30, 2, 2);
    translate([s / 2 - 5, -s / 2 + 5, -10]) cylinder(30, 2, 2);    
  }

  // outer ring
  translate([0, 0, -5])
    difference() {
      cylinder(19, s / 2,  s / 2);
      cylinder(19, s / 2 - 1,  s / 2 - 1);
    }
  
  // X
  difference() {
    union() {
      translate([-s / 2, -3, 11]) cube([s, 6, 4]);
      translate([-3, -s / 2, 11]) cube([6, s, 4]);
    }
    cylinder(20, 13, 13);
  }
  
  // holder ring
  translate([0, 0, 11])
  difference(){
    cylinder(4, 16, 16);
    cylinder(4, 12.25, 12.25);
  }
}

if(side) {
   difference() {
      union() {
         wings();
         box();
      }
      translate([-s / 2 - 10, 0, -s / 2]) cube([s + 20, s + 20, s + 20]);
   }
}
else {
   if(wing) wings();
   if(box) box();
}
