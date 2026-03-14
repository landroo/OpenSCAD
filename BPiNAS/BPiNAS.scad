$fa = 2;
$fs = 1;

//hdd
//color([1,0,0,.5])translate([-3,-1.5,33])cube([146, 102, 26]);

bpif3 = false;
back = false;
base = false;
front = false;
lside = false;
rside = false;
bpitop = false;
hdd = false;
hddtop = true;
hdd2 = true;

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
      translate([6, 0, 4.5])
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
      translate([120, 90, 2]) cube([11, 16, 2]);
      
      // speaker
      translate([138, 106, 4])
         rotate([90, 0, 0])
            cylinder(10, 3, 3);

      // Switch
         translate([103, 90, 2]) cube([11, 16, 6]);
         
      // LED
         translate([101, 106, 4]) 
            rotate([90, 0, 0])
               cylinder(10, 1.5, 1.5);
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
               cube([10, 2, 10]);
    }
}

module RSide() {
   difference() {
      translate([168, -2, -8]) cube([2, 103, 40]);
      translate([168, 10, 6])
         for(i = [1: 2: 40])
            translate([0, i * 2, 0])
               cube([10, 2, 10]);
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
   }
   translate([0, 43, 32]) cube([152, 11, 2]);
   
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
      cube([173, 2, 27]);

      for(i = [4: 2: 76])
         translate([i * 2 + 12, 0, 2])
            cube([2, 4, 19]);
            
      for(i = [1: 2: 15])
        translate([i * 10 + 3, -8, 25])
            cube([10, 10, 10]);
            
      translate([-7, 10, 23])
         rotate([90, 0, 0])
            cylinder(10, 24, 24);
    }

   // left
   translate([-3, 101, 34])
      difference() {
         cube([173, 2, 27]);

         for(i = [4: 2: 76])
               translate([i * 2 + 12, 0, 2])
                  cube([2, 4, 19]);
                  
      for(i = [1: 2: 15])
        translate([i * 10 + 3, -8, 25])
            cube([10, 10, 10]);                  

         translate([-7, 10, 23])
            rotate([90, 0, 0])
               cylinder(10, 24, 24);
      }

   //back
   translate([168, -4, 34])    
      difference() {
         cube([2, 106, 27]);
            for(i = [4: 2: 48])
               translate([0, i * 2, 2])
                  cube([2, 2, 19]);
            
            for(i = [1: 2: 14])
               translate([0, i * 10 - 20, 25])
                  cube([10, 10, 10]);            
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
color([1,0,0,1])
  translate([-3, -4, 59])
    difference() {
      cube([173, 107, 2]);
      
      // mid
      for(i = [1: 2: 72])
        translate([i * 2 + 10, 10, 0])
            cube([2, 87, 10]);
      // right
      for(i = [1: 2: 15])
        translate([i * 10 + 13, -8, 0])
            cube([10, 10, 10]);
      // left     
      for(i = [1: 2: 15])
        translate([i * 10 + 13, 105, 0])
            cube([10, 10, 10]);
      // back
      for(i = [1: 2: 14])
        translate([171, i * 10 - 10, 0])
            cube([10, 10, 10]);

      if(hdd2)      
         translate([159, 4, -2]) cube([11, 98, 8]);
   }
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

if(bpif3) BPiF3();
if(back) Back();
if(base) Base();
if(front) Front();
if(lside) LSide();
if(rside) RSide();
if(bpitop) BPiTop();
if(hdd) HDD(true);
if(hddtop) HDDTop(true);
if(hdd2) translate([0, 0, 27]) HDD(false, false);
