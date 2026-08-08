$fa = 1;
$fs = 0.4;

include <rwall.scad>

// RP2040-Zero 23.6x18 (21x13.4)
// https://github.com/TuriSc/RP2040-Keypad-Matrix
// ESP32-C3 Micro bluetooth (2.4x1.8x4)
// USB Battery charger (29.5x17.5, 4.5)
// Battery 52x7.8x20 1000mAh 3.7V
//translate([30, 56, 0]) color([1,0,0,.5]) cube([52, 20, 7.8]);


// long button
line = 20;
col = 20;
siz = 2;

xKeys = 4;
yKeys = 3;
head = 14;

// ▬ ↑ ↓ → ← ∟ ↔ ▲ ▼ ↕ ◄ ► ☼ ☺ ☻

letters =  [ 
   ["7", "8", "9", "/", "*"],
   ["4", "5", "6", "-", "+"], 
   ["1", "2", "3", "▲ ", "← "],
   ["0", ".", "◄ ", "▼ ", "► "]
];
/*
xKeys = 9;
yKeys = 4;
head = 14;
letters =  [ 
   ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
   ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"], 
   ["a", "s", "d", "f", "g", "h", "j", "k", "l", "←"],
   ["z", "x", "c", "v", "b", "n", "m ", ":", "▲ ", "← "],
   ["fn", "↑", "alt", "ct", "", "", ".", "◄ ", "▼ ", "► "]
];
*/
Body = false;
Bottom = false;
Top = false;
Keys = true;

Side = false;

RP2040 = true;

display = false;

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
               if(i == col && j == line)
                  translate([i * 12, j * 12, 8]) cube([10 * siz, 10, 5]);
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
                  translate([0, 3, 0]) cube([10, 4, 5]);
                  translate([0, 0, 0]) cube([3, 10, 5]);
               }
}
//drawBody();

// draw buttons
module drawKeys() {
   translate([7, 7, 0])
      for(i = [0: 1: xKeys])
         for(j = [0: 1: yKeys])
            if(letters[yKeys - j][i]) {
               difference() {    
                  drawButton(i, j);    
                  translate([i * 12 + .25 + 4 - len(letters[yKeys - j][i]) *1.4, j * 12 + .25 + 2.5, 11.5]) 
                     scale([.5,.5,.5]) 
                        linear_extrude(4) 
                           text(letters[yKeys - j][i]);
               }
            }
            else {
               drawButton(i, j);
            }
}

module drawButton(i, j) {
   translate([i * 12 + .25, j * 12 + .25, 5.5]){
      if(i == col && j == line)
         rcube(9.5 * siz, 9.5, 7);
      else
         rcube(9.5, 9.5, 7);
      translate([-1.3, -1.3, 0]) cube([11.6, 11.6, 3]);
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

// Type-C
module USB() {
   translate([-4, 35.5, 1.5]) cube([10, 7, 4]);
   translate([-4, 35.5, 3.5]) rotate([0, 90, 0]) cylinder(10, 2, 2);
   translate([-4, 42.5, 3.5]) rotate([0, 90, 0]) cylinder(10, 2, 2);
}

//
module Display(thumbs = false, half = 1) {
  
  difference() {
    //body
    union() {
      translate([0, 0, 12]) 
         rcube((xKeys + 2) * 12, (yKeys + 2) * 12 + head - 10, 6, 4);
      translate([10, 0, 12])          
         rcube((xKeys + 2) * 12 - 20, (yKeys + 2) * 12 + head, 6, 4);
      translate([10, (yKeys + 2) * 12 - 20, 12])          
         rcube((xKeys + 2) * 12 - 20, 33, 15, 4);
      
      //
      translate([10, (yKeys + 2) * 12 + head - 5, 17]) sphere(2);
      translate([(xKeys + 2) * 12 - 10, (yKeys + 2) * 12 + head - 5, 17])
        sphere(2);
    }
    
    // half
    if(half == 1)
      translate([0, 0, 12]) 
        cube([(xKeys + 2) * 12, (yKeys + 2) * 12 + head, 3]);

    if(half == 2)
      translate([0, 0, 15]) 
        cube([(xKeys + 2) * 12, (yKeys + 2) * 12 + head, 10]);
    
    // border
    translate([2, 2, 14])  
      cube([(xKeys + 2) * 12 - 4, (yKeys + 2) * 12 + head - 14, 2]);
    translate([12, 2, 14])  
      cube([(xKeys + 2) * 12 - 24, (yKeys + 2) * 12 + head - 4, 2]);
    translate([12, (yKeys + 2) * 12 - 18, 14])  
      cube([(xKeys + 2) * 12 - 24, 29, 12]);
  
    translate([4, 4, 12])  
      cube([(xKeys + 2) * 12 - 8, (yKeys + 2) * 12 + head - 18, 2]);

    if(half == 2)  
      // edge
      difference() {
        union() {
          translate([1, 1, 13])  
            cube([(xKeys + 2) * 12 - 2, (yKeys + 2) * 12 + head - 12, 3]);
          translate([11, 2, 13])  
            cube([(xKeys + 2) * 12 - 22, (yKeys + 2) * 12 + head - 3, 3]);
        }
        translate([2, 2, 13])  
          cube([(xKeys + 2) * 12 - 4, (yKeys + 2) * 12 + head - 14, 3]);
        translate([12, 4, 13])  
          cube([(xKeys + 2) * 12 - 24, (yKeys + 2) * 12 + head - 6, 3]);
      }
  }
  
  // edge
  if(half == 1)  
    difference() {
      union() {
        translate([1, 1, 13])  
          cube([(xKeys + 2) * 12 - 2, (yKeys + 2) * 12 + head - 12, 3]);
        translate([11, 2, 13])  
          cube([(xKeys + 2) * 12 - 22, (yKeys + 2) * 12 + head - 3, 3]);
      }
      translate([2, 2, 13])  
        cube([(xKeys + 2) * 12 - 4, (yKeys + 2) * 12 + head - 14, 3]);
      translate([12, 4, 13])  
        cube([(xKeys + 2) * 12 - 24, (yKeys + 2) * 12 + head - 6, 3]);
    }
  
  // thumbs
  if(thumbs) {
    difference() {
      translate([0, (yKeys + 2) * 12 + 5, 6])
         rcube(10, head - 5, 14, 4);
         
      translate([10, (yKeys + 2) * 12 + head - 5, 17])
        sphere(2);         
         
      translate([0, (yKeys + 2) * 12 + 5, 6]) cube([10, head - 5, 2]);
    }
    difference() {
      translate([(xKeys + 2) * 12 - 10, (yKeys + 2) * 12 + 5, 6])
         rcube(10, head - 5, 14, 4);

      translate([(xKeys + 2) * 12 - 10, (yKeys + 2) * 12 + head - 5, 17])
        sphere(2);
         
      translate([(xKeys + 2) * 12 - 10, (yKeys + 2) * 12 + 5, 6])
        cube([10, head - 5, 2]);
    }
  }
}

// HDMI
module HDMI() {
  // HDMI
  rotate([0, 270, 0]) 
  {   
  translate([0, -4, 4.5]) 
     cube([2.5, 20, 12]);
  translate([2, -4, 2.5]) 
     cube([4, 20, 16]);
  translate([0, -4, 4.6]) 
     rotate([0, 45, 0]) 
        cube([3, 20, 3]);
  translate([0, -4, 16.4]) 
     rotate([0, 45, 0]) 
        cube([3, 20, 3]);
  }
}

if(display)
difference() {
  Display(true, 0);
  translate([(xKeys + 2) * 12 - 20, (yKeys + 2) * 12, 18]) HDMI();
  //cube([(xKeys + 2) * 12 + 8, 34, 50]);
}

if(Side) {
   difference(){
      union() {
         drawBody();
         drawKeys();
      }
      translate([-5, -5, -5]) cube([200, 16, 20]);
   }
}
else if(RP2040){
   difference(){
      union() {
         if(Bottom) drawBottom();
         if(Top) drawTop();
         if(Keys) drawKeys();
         //translate([2, 65, 0]) cube([ 23.6, 18, 1]);
         if(Bottom)
          translate([2, (yKeys + 2) * 12 -4, 0]) cube([ 21, 13.4, 1]);
      }
      translate([0, (yKeys + 2) * 5 - 1, 1]) USB();
   }
}
else
{
   if(Keys) drawKeys();
   if(Body) drawBody();
   if(Bottom) drawBottom();
   if(Top) drawTop();
}
    

    
    

