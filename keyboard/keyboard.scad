$fa = 1;
$fs = 0.4;

include <rwall.scad>

// ESP32 Micro


xKeys = 10 - 1;
yKeys = 5 - 1;
head = 8;

Body = false;
Bottom = true;
Top = false;
Keys = false;
Side = false;

// draw box
module drawBody() {
   difference(){
      translate([0, 0, -2])
         rcube((xKeys + 2) * 12, (yKeys + 2) * 12 + head, 12, 4);
    
      translate([2, 2, 0])
         cube([(xKeys + 2) * 12 - 4, (yKeys + 2) * 12 + head - 4, 8]);
    
      // buttons
      translate([7, 7, 0])
         for(i = [0: 1: xKeys])
            for(j = [0: 1: yKeys])
               if(i == 4 && j == 0)
                  translate([i * 12, j * 12, 8]) cube([10 * 2, 10, 5]);
               else   
                  translate([i * 12, j * 12, 8]) cube([10, 10, 5]);
/*          
      difference(){
         translate([1, 1, 1])
            cube([(xKeys + 2) * 12 - 2, (yKeys + 2) * 12 + head - 2, 6]);
         translate([2, 2, 1])
            cube([(xKeys + 2) * 12 - 4, (yKeys + 2) * 12 + head - 4, 6]);
      }*/
   }

   // swich
   translate([7, 7, 0])
      for(i = [0: 1: xKeys])
         for(j = [0: 1: yKeys])
            translate([i * 12, j * 12, 0])
               difference(){
                  cube([10, 10, 3.5]);
                  translate([2, 2, 0]) cube([6.1, 6.1, 5]);
                  translate([0, 4, 0]) cube([10, 2, 5]);
                  translate([4, 0, 0]) cube([2, 10, 5]);
               }
}
//drawBody();

// draw buttons
module drawKeys() {
   translate([7, 7, 0])
      for(i = [0: 1: xKeys])
         for(j = [0: 1: yKeys])
            translate([i * 12 + .5, j * 12 + .5, 5.5]){
            if(i == 4 && j == 0)
               rcube(9 * 2, 9, 7);
            else
               rcube(9, 9, 7);
            translate([-1.3, -1.3, 0]) cube([11.6, 11.6, 2]);
      }
}

//
module drawBottom() {
   difference(){
      drawBody();
      translate([-5, -5, 4]) cube([200, 200, 10]);
   }

   difference(){
      translate([1, 1, 1]) cube([(xKeys + 2) * 12 - 2, (yKeys + 2) * 12 + head - 2, 6]);
      translate([2, 2, 1]) cube([(xKeys + 2) * 12 - 4, (yKeys + 2) * 12 + head - 4, 6]);
    }
}

//
module drawTop() {
   difference(){
      drawBody();
      translate([-5, -5, -6]) cube([200, 200, 10]);
      difference(){
         translate([1, 1, 1]) cube([(xKeys + 2) * 12 - 2, (yKeys + 2) * 12 + head - 2, 6]);
         translate([2, 2, 1]) cube([(xKeys + 2) * 12 - 4, (yKeys + 2) * 12 + head - 4, 6]);
       }
    }
}

if(Keys) drawKeys();
if(Body) drawBody();
if(Bottom) drawBottom();
if(Top) drawTop();
if(Side) {
   difference(){
      union() {
         drawBody();
         drawKeys();
      }
      translate([-5, -5, -5]) cube([200, 16, 20]);
   }
}
    
    