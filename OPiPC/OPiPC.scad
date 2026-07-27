$fa = 2;
$fs = 1;

// Orange Pi PC case
// https://www.aliexpress.com/item/1005007425310127.html


opipc = false;
back = true;
base = true;
front = true;
lside = true;
rside = true;
top = false;
display = true;
displayfront = treu;

module OPiPC() {
   cube([86, 57, 20]);
   color([1,0,0,1]) {
   
      // HDMI
      translate([48.5, -4, 2.5])
      rotate([0, 270, 0]) 
      {   
      translate([0, 0, 4.5]) 
         cube([2.5, 20, 12]);
      translate([2, 0, 2.5]) 
         cube([4, 20, 16]);
      translate([0, 0, 4.6]) 
         rotate([0, 45, 0]) 
            cube([3, 20, 3]);
      translate([0, 0, 16.4]) 
         rotate([0, 45, 0]) 
            cube([3, 20, 3]);
      }   
      
      // Power
      translate([8, -4, 2.5])
         cube([8.5, 20, 6.5]);
         
      // Jack
      translate([65.5, 16, 5])
         rotate([90, 0, 0]) 
            cylinder(20, 3, 3);
            
      // USB 1
      translate([72, 7, 2.5]) cube([20, 15.5, 16]);
      
      // USB 2
      translate([72, 43.5, 2.5]) cube([20, 7, 14]);
      
      // UTP
      translate([72, 25, 2.5]) cube([20, 16.5, 14]);
      
      // Infra
      translate([64, 51, 2.5]) cube([4, 10, 8]);
      
      // switch
      translate([-4, 9.5, 4.5]) 
        rotate([0, 90, 0])
          cylinder(20, 2, 2);
     
      // SD card
      translate([-4, 16, -3]) 
        cube([20, 12, 4]);
        
      // USB
      translate([-4, 35.5, 1.5]) 
        cube([20, 7, 4]);
      translate([-4, 35.5, 3.5]) 
        rotate([0, 90, 0])
          cylinder(20, 2, 2);
      translate([-4, 42.5, 3.5]) 
        rotate([0, 90, 0])
          cylinder(20, 2, 2);
      
   }      
}

module Back() {
   difference() {
      translate([-3, -3, -6]) cube([94, 2, 30]);
         OPiPC();
     }
}


module Base() {
color([1,0,0,1])
difference() {
   translate([-1, -1, -6]) cube([90, 59, 2]);
   translate([6, 10, -10])
      for(i = [1: 2: 36])
         translate([i * 2, 0, 0])
            cube([2, 36, 10]);
   }
   
  // base
  translate([3, 3, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
  translate([3, 53, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
  translate([83, 3, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
  translate([83, 53, -4])
  difference(){
    cylinder(4, 3, 3);
    cylinder(4, 1.5, 1.5);
  }
}

module Front() {
   difference() {
      translate([-3, 58, -6]) cube([94, 2, 30]);
      OPiPC();
         
      translate([0, 57, 7])
         for(i = [1: 2: 30])
            translate([i * 2, 0, 0])
               cube([2, 10, 10]);
         
     }
}

module LSide() {
   difference() {
      translate([-3, -1, -6]) cube([2, 59, 30]);
      
      OPiPC();      
      
      translate([-4, 7, 7])
         for(i = [1: 2: 20])
            translate([0, i * 2, 0])
               cube([10, 2, 10]);
    }
}

module RSide() {
  difference() {
    translate([89, -1, -6]) cube([2, 59, 30]);
    OPiPC();
  }
}

module Top() {
  color([1,0,0,1]) {
  difference() {
    translate([-1, -1, 19]) cube([90, 59, 5]);
    translate([0, 0, 19]) cube([88, 57, 5]);
    }
  difference() {  
    translate([-3, -3, 24]) cube([94, 63, 2]);    
    
    translate([6, 10, 22])
      for(i = [1: 2: 36])
         translate([i * 2, 0, 0])
            cube([2, 36, 10]);
    }
    }
}

module Display() {

   // slot
   difference() {
      translate([-1, -1, 19]) cube([90, 59, 5]);
      translate([0, 0, 19]) cube([88, 57, 5]);
   }

   // base
   difference() {
      translate([-13, -3, 24]) cube([113, 63, 2]);
      translate([0, 0, 24]) cube([88, 57, 10]);
   }

   // left side
   difference() {
      translate([-13, 60, 26])
         rotate([120, 0, 0]) cube([2, 66, 66]);
      translate([-17, -20, -10]) cube([10, 80, 35]);
      translate([-17, -33, 10]) cube([10, 30, 60]);
   }

   // right side
   translate([111, 0, 0])
      difference() {
         translate([-13, 60, 26])
            rotate([120, 0, 0]) cube([2, 66, 66]);
      
         translate([-17, -20, -10]) cube([10, 80, 35]);
    
         translate([-17, -33, 10]) cube([10, 30, 60]);
      }

   // back
   difference() {
      translate([-13, -3, 26]) cube([111, 2, 40]);
      translate([-10, -5, 30])
         for(i = [1: 2: 52])
            translate([i * 2, 0, 0]) cube([2, 10, 30]);      
   }
    
   // top
   translate([-13, 28, 81.5])
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
   translate([-13, 62, 25])
      rotate([-60, 0, 0])
         difference() {
            translate([0, -66, 0]) cube([113, 68, 2]); 
            translate([8, -64, 0]) cube([95, 61, 2]); 
         }

}

if(opipc) OPiPC();
if(back) Back();
if(base) Base();
if(front) Front();
if(lside) LSide();
if(rside) RSide();
if(top) translate([0, 0, 2]) Top();
if(display) translate([0, 0, 2]) Display();
if(displayfront) translate([0, 0, 2]) DisplayFront();
