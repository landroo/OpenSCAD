$fa = 2;
$fs = 1;

// Banana Pi BPI-F3 NAS
// https://www.aliexpress.com/item/1005006921744822.html
// Mini PCI-E To SATA3.0 Expansion Card
// https://www.aliexpress.com/item/1005007226116507.html
// SATA cable
// https://www.aliexpress.com/item/1005006133443717.html

//hdd
//color([1,0,0,.5])translate([-3,-1.5,33])cube([146, 102, 26]);

bpif3 = false;

back = true;
base = true;
front = true;
lside = true;
rside = true;
bpitop = true;

hdd = false;
hddtop = false;
hdd2 = false;
hddhalf = false;

button = false;
cool = false;

module BPiF3() {
   cube([148, 100, 24]);
   color([1,0,0,1]) {
   
      // HDMI
      translate([30.5 , 0, 2.5])
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
      
      // USB
      translate([30, -4, 2]) cube([16, 20, 17]);
      translate([55, -4, 2]) cube([16, 20, 17]);
   
      // TPU
      translate([77, -4, 1.5]) cube([16.5, 20, 14.5]);
      translate([102, -4, 1.5]) cube([16.5, 20, 14.5]);
      
      // PWR
      translate([132, -4, 1.5]) cube([11, 20, 11]);
      
      // Type-C
      translate([5, 0, 5])
      rotate([0, 90, 0]) {
         translate([0, 96, 3.5]) 
            cube([4, 10, 7]);
        translate([2, 106, 3.5])
            rotate([90, 0, 0])
               cylinder(10, 2, 2);
        translate([2, 106, 10.5])
            rotate([90, 0, 0])
               cylinder(10, 2, 2);
      }
               
      // SD
      translate([117, 90, 2]) cube([12, 16, 2]);
      translate([123, 110, 3]) 
         rotate([90, 0, 0])
            scale([2, 1.3, 1])
               cylinder(10, 2, 2);
      
      // speaker
      translate([136, 106, 4])
         rotate([90, 0, 0])
            cylinder(10, 3, 3);

      // Switch
         translate([99, 90, 2]) cube([14, 17, 10]);
         
      // LED
         translate([97, 106, 4]) 
            rotate([90, 0, 0])
               cylinder(10, 1, 1);
   }
}

module Back() {
   difference() {
      translate([-3, -4, -8]) cube([173, 2, 40]);
         BPiF3();
     }
}

module Base() {
color([1,0,0,1])
difference() {
   translate([-1, -2, -8]) cube([169, 103, 2]);
   translate([6, 14, -10])
      for(i = [1: 2: 66])
         translate([i * 2, 0, 0])
            cube([2, 70, 10]);
   }
   
  // base
  translate([3, 22, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
  translate([3, 96, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
  translate([144, 22, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
  translate([144, 96, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
}

module Front() {
   difference() {
      translate([-3, 101, -8]) cube([173, 2, 40]);
         BPiF3();

     }
}

module LSide() {
   difference() {
      translate([-3, -2, -8]) cube([2, 103, 40]);
      translate([-4, 10, 6])
         for(i = [1: 2: 40])
            translate([0, i * 2, 0])
               cube([10, 2, 15]);
    }
}

module RSide() {
   difference() {
      translate([168, -2, -8]) cube([2, 103, 40]);
      translate([168, 10, 6])
         for(i = [1: 2: 40])
            translate([0, i * 2, 0])
               cube([10, 2, 15]);
   }
}

module HDD(slot = false, bottom = true) {
   // base
   if(bottom) {
     //bottom
      difference() {
         translate([-3, -4, 32]) cube([173, 107, 2]);
         translate([156, 0, 32]) cube([11, 99, 2]);
         
         translate([4, 11, 32])
            for(i = [1: 2: 68])
               translate([i * 2, 0, 0])
                  cube([2, 78, 10]);
      }
      translate([0, 43, 32]) cube([152, 11, 2]);
   }

   
   // plug
   //color([1,0,0,1])translate([146, 9, 34])cube([12, 46, 6]);

   // connector
   translate([144, 2, 34]) cube([12, 2, 7]);
   difference() {
      union() {
         translate([151.5, 7, 34]) cylinder(6, 1.4, 1.4);
         translate([150, 3, 34]) cube([3, 4, 6]);
      }
      translate([151.5, 7, 34]) cylinder(7, .8, .8);
   }
   translate([144, 2.5, 40]) cube([6, 2.5, 1]);
  
   translate([144, 51, 34]) cube([12, 2, 7]);
   difference() {
      union() {
         translate([151.5, 48, 34]) cylinder(6, 1.4, 1.4);
         translate([150, 48, 34]) cube([3, 4, 6]);
      }
      translate([151.5, 48, 34]) cylinder(7, .8, .8);
   }
   translate([144, 50, 40]) cube([6, 2.5, 1]);
 
 
   // walls
   // right
  translate([-3, -4, 34])
    difference() {
      cube([173, 2, 30]);

      for(i = [4: 2: 76])
         translate([i * 2 + 12, 0, 2])
            cube([2, 4, 21]);
            
      for(i = [1: 2: 15])
        translate([i * 10 + 3, 0, 28]) 
          union() {
            cube([10, 1, 2]);
            translate([1, 1, 0]) cube([8, 1, 2]);
          }
            
      translate([-7, 10, 23])
         rotate([90, 0, 0])
            cylinder(10, 24, 24);
    }

   // left
   translate([-3, 101, 34])
      difference() {
         cube([173, 2, 30]);

         for(i = [4: 2: 76])
               translate([i * 2 + 12, 0, 2])
                  cube([2, 4, 21]);
                  
      for(i = [1: 2: 15])
        translate([i * 10 + 3, 0, 28])
          union() {
            translate([1, 0, 0]) cube([8, 1, 2]);
            translate([0, 1, 0]) cube([10, 1, 2]);
          }

         translate([-7, 10, 23])
            rotate([90, 0, 0])
               cylinder(10, 24, 24);
      }


   //back
   translate([168, -4, 34])    
      difference() {
         cube([2, 106, 30]);
            for(i = [4: 2: 48])
               translate([0, i * 2, 2])
                  cube([2, 2, 21]);
            
            for(i = [1: 2: 10])
               translate([0, i * 10 - 2, 28])
                union() {
                  translate([0, 1, 0])cube([1, 8, 2]);
                  translate([1, 0, 0]) cube([1, 10, 2]);
                }
      }
      
    
    if(slot) {
      color([1,0,0,1])
      translate([-1, -2, 27]) 
        difference() {
          cube([169, 103, 5]);
          translate([1, 1, 0])
            cube([167, 101, 5]);
      }
   }
}

module HDDTop(hdd2 = false) {

  translate([-3, -4, 62])
    difference() {
      cube([173, 107, 2]);
      
      // mid
      for(i = [1: 2: 72])
        translate([i * 2 + 10, 10, 0])
            cube([2, 87, 10]);
            
      // right
      for(i = [1: 2: 15])
        translate([i * 10 + 13, 0, 0])
          union() {
            translate([0, 0, 0]) cube([10, 1, 2]);
            translate([-1, 1, 0]) cube([12, 1, 2]);
          }
          
      // left     
      for(i = [1: 2: 15])
        translate([i * 10 + 13, 105, 0])
          union() {
            translate([0, 1, 0]) cube([10, 1, 2]);
            translate([-1, 0, 0])cube([12, 1, 2]);
          }

      // back
      for(i = [1: 2: 12])
        translate([171, i * 10 - 12, 0])
          union() {
            translate([1, 0, 0]) cube([1, 10, 2]);
            translate([0, -1, 0]) cube([1, 12, 2]);
          }

      if(hdd2)      
         translate([159, 4, -2]) cube([11, 98, 8]);
   }
   
   translate([0, 43, 62]) cube([152, 11, 2]);
}

module BPiTop() {
color([1,0,0,1])
  translate([-3, -4, 32])
    difference() {
      cube([173, 107, 2]);
      
      // mid
      for(i = [1: 2: 72])
        translate([i * 2 + 10, 10, 0])
            cube([2, 87, 10]);
   }
   translate([0, 43, 32]) cube([152, 11, 2]);
   
   color([1,0,0,1])
      translate([-1, -2, 27]) 
        difference() {
          cube([169, 103, 5]);
          translate([1, 1, 0])
            cube([167, 101, 5]);
   }
}

module Button() {
   include <buttons.scad>
}

module HDDHalf(slot = false, bottom = true) {
   // base
   if(bottom) {
     //bottom
      difference() {
         translate([-3, -4, 32]) cube([173, 107, 2]);
         translate([156, 0, 32]) cube([11, 99, 2]);
         
         translate([4, 11, 32])
            for(i = [1: 2: 68])
               translate([i * 2, 0, 0])
                  cube([2, 78, 10]);
      }
      translate([0, 43, 32]) cube([152, 11, 2]);
   }

   
   // plug
   //color([1,0,0,1])translate([146, 9, 34])cube([12, 46, 6]);

   // connector
   translate([144, 2, 34]) cube([12, 2, 7]);
   difference() {
      union() {
         translate([151.5, 7, 34]) cylinder(6, 1.4, 1.4);
         translate([150, 3, 34]) cube([3, 4, 6]);
      }
      translate([151.5, 7, 34]) cylinder(7, .8, .8);
   }
   translate([144, 2.5, 40]) cube([6, 2.5, 1]);
  
   translate([144, 51, 34]) cube([12, 2, 7]);
   difference() {
      union() {
         translate([151.5, 48, 34]) cylinder(6, 1.4, 1.4);
         translate([150, 48, 34]) cube([3, 4, 6]);
      }
      translate([151.5, 48, 34]) cylinder(7, .8, .8);
   }
   translate([144, 50, 40]) cube([6, 2.5, 1]);
 
 
   // walls
   // right
  translate([-3, -4, 34])
    difference() {
      cube([173, 2, 13]);

      for(i = [4: 2: 76])
         translate([i * 2 + 12, 0, 2])
            cube([2, 4, 7]);
            
      for(i = [1: 2: 15])
        translate([i * 10 + 3, 0, 11]) 
          union() {
            cube([10, 1, 2]);
            translate([1, 1, 0]) cube([8, 1, 2]);
          }
            
      translate([-7, 10, 23])
         rotate([90, 0, 0])
            cylinder(10, 24, 24);
    }

   // left
   translate([-3, 101, 34])
      difference() {
         cube([173, 2, 13]);

         for(i = [4: 2: 76])
               translate([i * 2 + 12, 0, 2])
                  cube([2, 4, 7]);
                  
      for(i = [1: 2: 15])
        translate([i * 10 + 3, 0, 11])
          union() {
            translate([1, 0, 0]) cube([8, 1, 2]);
            translate([0, 1, 0]) cube([10, 1, 2]);
          }

         translate([-7, 10, 23])
            rotate([90, 0, 0])
               cylinder(10, 24, 24);
      }


   //back
   translate([168, -4, 34])    
      difference() {
         cube([2, 106, 12]);
            for(i = [4: 2: 48])
               translate([0, i * 2, 2])
                  cube([2, 2, 7]);
            
            for(i = [1: 2: 10])
               translate([0, i * 10 - 2, 11])
                union() {
                  translate([0, 1, 0])cube([1, 8, 2]);
                  translate([1, 0, 0]) cube([1, 10, 2]);
                }
      }
      
    
    if(slot) {
      color([1,0,0,1])
      translate([-1, -2, 27]) 
        difference() {
          cube([169, 103, 5]);
          translate([1, 1, 0])
            cube([167, 101, 5]);
      }
   }
}

module cooler() {
  //color([1,0,0,.5]) translate([170, 9, 00]) cube([25, 80, 80]);
  translate([170, 07, 5]) 
    difference() {
      cube([28, 85, 85]);
      translate([0, 2, 2]) cube([28, 81, 81]);
  }
  
  translate([196, 07, 5])
   difference() {
      union(){
         difference() {
            cube([2, 84, 84]);
            translate([0, 42, 42]) 
               rotate([0, 90, 0]) 
                  cylinder(6, 38, 38);
      }
      
      for(i = [1: 4: 76])
         translate([0, i + 4, 0])
         cube([2, 2, 84]);  
      }
      
      translate([0, 6, 6]) 
        rotate([0, 90, 0]) 
          cylinder(6, 2, 2);
          
      translate([0, 79, 6]) 
        rotate([0, 90, 0]) 
          cylinder(6, 2, 2);
          
      translate([0, 79, 79]) 
        rotate([0, 90, 0]) 
          cylinder(6, 2, 2);
          
      translate([0, 6, 79]) 
        rotate([0, 90, 0]) 
          cylinder(6, 2, 2);
   }

  translate([170, -6, 38]) cube([2, 14, 15]);
  translate([153, -6, 38]) cube([18, 2, 15]);
  translate([153, -4, 38]) cube([2, 2, 15]);
  hull() {
    translate([170, 7, 44]) cube([22, 2, 2]);
    translate([170, -6, 44]) cube([2, 12, 2]);
  }

  translate([0, 99, 91])
    rotate([180, 0, 0]) {
     translate([170, -6, 38]) cube([2, 14, 15]);
     translate([153, -6, 38]) cube([18, 2, 15]);
     translate([153, -4, 38]) cube([2, 2, 15]);
     hull() {
       translate([170, 7, 44]) cube([22, 2, 2]);
       translate([170, -6, 44]) cube([2, 12, 2]);
     }
  }

}

if(bpif3) BPiF3();
if(back) Back();
if(base) Base();
if(front) Front();
if(lside) LSide();
if(rside) RSide();
if(bpitop) BPiTop();
if(hdd) HDD(true);
if(hddtop) color([1,0,0,1]) HDDTop(true);
if(hdd2) translate([0, 0, 30]) HDD(false, false);
if(hddhalf) translate([0, 0, 30]) HDDHalf(false, false);
if(button) color([1,0,0,1]) translate([111.5, 104, 4]) rotate([0, 0, 180]) Button();
if(cool) cooler();


