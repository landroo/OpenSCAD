$fa = 2;
$fs = 1;

// Orange Pi Win case
// http://www.orangepi.org/orangepiwiki/index.php/Orange_Pi_Win_Plus

opiwin = false;

back = true;
base = true;
front = true;
lside = true;
rside = true;
top = false;

display = false;
displayfront = false;

module OPiWin() {

   // body
   cube([93.5, 60, 20]);
   color([1,0,0,1]) {
   
      // Jack
      translate([11.5, 65, 4.55]) rotate([90, 0, 0]) cylinder(20, 3, 3);
   
      // HDMI
      translate([54.5, 45, 2.5])
         rotate([0, 270, 0]) 
         {   
         translate([0, 0, 4.5]) cube([2.5, 20, 12]);
         translate([2, 0, 2.5]) cube([4, 20, 16]);
         translate([0, 0, 4.6]) rotate([0, 45, 0]) cube([3, 20, 3]);
         translate([0, 0, 16.4]) rotate([0, 45, 0]) cube([3, 20, 3]);
         }   
         
      // SD card
      translate([56, 45, -3]) cube([13, 20, 4]);
      
            
      // USB 1
      translate([79, 1, 2.5]) cube([20, 15.5, 16]);
      
      // UTP
      translate([79, 21, 2.5]) cube([20, 17.5, 14]);

      // USB 2
      translate([79, 43.5, 2.5]) cube([20, 15.5, 16]);
      
      
      // Infra
      translate([67, -4, 2.5]) cube([4, 10, 8]);


      // Power
      translate([-4, 9, 2.5]) cube([20, 8.5, 6.5]);
      
      // switch 1
      translate([-4, 20.5, 4.5]) rotate([0, 90, 0]) cylinder(20, 2, 2);

      // switch 2
      translate([-4, 34.5, 4.5]) rotate([0, 90, 0]) cylinder(20, 2, 2);
     
      // USB
      translate([0, 9, 0]) {
         translate([-4, 35.5, 1.5]) cube([20, 7, 4]);
         translate([-4, 35.5, 3.5]) rotate([0, 90, 0]) cylinder(20, 2, 2);
         translate([-4, 42.5, 3.5]) rotate([0, 90, 0]) cylinder(20, 2, 2);
      }
   }      
}

module Front() {
   difference() {
      translate([-3, -3, -6]) cube([100, 2, 30]);
      
      OPiWin();

      translate([0, -6, 7])
         for(i = [1: 2: 30])
            translate([i * 2, 0, 0])
               cube([2, 10, 10]);
    }
}

module Base() {
color([1,0,0,1])
   difference() {
      translate([-1, -1, -6]) cube([96, 63, 2]);
      translate([6, 10, -10])
         for(i = [1: 2: 40])
            translate([i * 2, 0, 0])
               cube([2, 40, 10]);
      }
   
  // base
  translate([3, 3, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
  translate([3, 56, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
  translate([75, 3, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
  translate([75, 56, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
}

module Back() {
   difference() {
      translate([-3, 62, -6]) cube([100, 2, 30]);
      OPiWin();

      translate([52, 57, 7])
         for(i = [1: 2: 20])
            translate([i * 2, 0, 0])
               cube([2, 10, 10]);

     }
}

module LSide() {
   difference() {
      translate([-3, -1, -6]) cube([2, 63, 30]);
      
      OPiWin();      
      
      translate([-4, 20, 7])
         for(i = [1: 2: 15])
            translate([0, i * 2, 0])
               cube([10, 2, 10]);
    }
}

module RSide() {
  difference() {
    translate([95, -1, -6]) cube([2, 63, 30]);
    OPiWin();
  }
}

module Top() {
  color([1,0,0,1]) {
  difference() {
    translate([-1, -1, 19]) cube([96, 63, 5]);
    translate([0, 0, 19]) cube([94, 61, 5]);
    }
  difference() {  
    translate([-3, -3, 24]) cube([100, 67, 2]);    
    
    translate([6, 10, 22])
      for(i = [1: 2: 40])
         translate([i * 2, 0, 0])
            cube([2, 40, 10]);
    }
    }
}

module Display() {

   // slot
  difference() {
    translate([-1, -1, 19]) cube([96, 63, 5]);
    translate([0, 0, 19]) cube([94, 61, 5]);
    }

   // base
   difference() {
      translate([-10, -3, 24]) cube([113, 67, 2]);
      translate([0, 0, 24]) cube([88, 60, 10]);
   }

   // left side
   difference() {
      translate([-10, 60, 26])
         rotate([120, 0, 0]) cube([2, 66, 66]);
      translate([-17, -20, -10]) cube([10, 80, 35]);
      translate([-17, -33, 10]) cube([10, 30, 60]);
   }

   // right side
   translate([111, 0, 0])
      difference() {
         translate([-10, 60, 26])
            rotate([120, 0, 0]) cube([2, 66, 66]);
      
         translate([-17, -20, -10]) cube([10, 80, 35]);
    
         translate([-17, -33, 10]) cube([10, 30, 60]);
      }

   // back
   difference() {
      translate([-10, -3, 26]) cube([111, 2, 40]);
      translate([-7, -5, 30])
         for(i = [1: 2: 52])
            translate([i * 2, 0, 0]) cube([2, 10, 30]);      
   }
    
   // top
   translate([-10, 28, 81.5])
      rotate([120, 0, 0]) {
         difference() {
            cube([112, 2, 34.5]);
            translate([30, 0, 2]) cube([27, 10, 3]);
         }
         translate([2, -2, 2]) cube([27, 2, 3]);
         translate([58, -2, 2]) cube([54, 2, 3]);
      }
    
}

module DisplayFront() {
   // front
   translate([-10, 62, 25])
      rotate([-60, 0, 0])
         difference() {
            translate([0, -66, 0]) cube([113, 65, 2]); 
            translate([8, -64, 0]) cube([95, 61, 2]); 
         }

}

if(opiwin) OPiWin();
if(back) Back();
if(base) Base();
if(front) Front();
if(lside) LSide();
if(rside) RSide();
if(top) translate([0, 0, 2]) Top();
if(display) translate([0, 0, 2]) Display();
if(displayfront) translate([0, 0, 2]) DisplayFront();
