$fa = 2;
$fs = 1;

// Orange Pi RV2 NAS
// Orange Pi RV2 2GB RAM Single Board Computer DDR4 8-Core RISC-V 2TOPS AI CPU WiFi BT5.0 BLE M2 PCIE SSD Mini PC Support Ubuntu OS
// https://www.aliexpress.com/item/1005008592397549.html
// SATA to M.2 Adapter NVME to SATA 2 Port Converter M2 PCIe Key M+B 6Gbps SSD SATA3.0 Adapter Expansion Card For Desktop
// https://www.aliexpress.com/item/1005005787940840.html
// DC-DC 24V/12V To 5V 5A Step Down Power Supply Buck Converter Replace LM2596S Adjustable USB Step-down Charging Module For Phone
// https://www.aliexpress.com/item/1005007715701799.html
// (7+15) 22-pin 2.5 "and 3.5" HDD SSD SATA Power Cord Male To Female Power Supply Cable Power Splitter Cable Connector
// https://www.aliexpress.com/item/1005005453396524.html

//hdd
//color([1,0,0,.5])translate([24,0,8])cube([102,146,26]);
//color([1,0,0,1])translate([-2,-8,34])cube([100,70,10]);
//color([1,0,0,1])translate([-2,-8,46])cube([100,70,10]);

opi = false;
pwr = false;
back = true;
base = true;
lside = true;
rside = true;
front = true;
hdd = true;
hdd2 = false;
hddtop = true;
opitop = false;

// Power module
module PWR(){
  cube([28, 64, 15]);
  color([1,0,0,1]){
    translate([22, 5, 8])
      rotate([90, 0, 0])
         cylinder(10, 4.5, 4.5);
      
    translate([12, 64, 2])
      cube([14.5, 3, 6]);
  }
}


// OPiRV2 
module OPiRV2(){
cube([89, 56, 24]);
color([1,0,0,1]){
  // USB
  translate([2, -4, 2.5]) cube([14.5, 20, 16]);
  // HDMI
  translate([23, -4, 4.5]) 
      cube([2.5, 20, 12]);
  translate([25, -4, 2.5]) 
      cube([3.5, 20, 16]);
  translate([23, -4, 4.6]) 
    rotate([0, 45, 0]) 
      cube([3, 20, 3]);
  translate([23, -4, 16.4]) 
    rotate([0, 45, 0]) 
      cube([3, 20, 3]);
  
  // TPU
  translate([31, -4, 1.5]) cube([31.5, 20, 14.5]);
  // USB
  translate([63.5, -4, 2.5]) cube([15, 20, 16]);
  // Type-C
  translate([84, -4, 3.5]) 
   cube([4, 20, 7]);
  translate([86, 6, 3.5])
    rotate([90, 0, 0])
      cylinder(10, 2, 2);
  translate([86, 6, 10.5])
    rotate([90, 0, 0])
      cylinder(10, 2, 2);
  
  // SD
  translate([-4, 16, -1]) cube([16, 11, 2]);
  
  // switch
  translate([7, 66, 5])
    rotate([90, 0, 0])
      cylinder(10, 2, 2);
  
  // speaker
  translate([30, 66, 5])
    rotate([90, 0, 0])
      cylinder(10, 4, 4);
      
  // LED
  translate([80, 66, 5])
    rotate([90, 0, 0])
      cylinder(10, 2, 2);
}
}


module Base() {
difference() {
   translate([0, -2, -8]) cube([119, 64, 2]);
   translate([4, 14, -10])
      for(i = [1: 2: 40])
         translate([i * 2, 0, 0])
            cube([2, 30, 10]);
   }
   translate([90, -2, -8]) cube([1, 64, 10]);
   translate([91, 13, -8]) cube([28, 35, 8]);
   
  // base
  translate([19, 3, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
  translate([81, 3, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
  translate([4, 53, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
  translate([87, 53, -8])
  difference(){
    cylinder(8, 3, 3);
    cylinder(8, 1.5, 1.5);
  }
}

module LSide() {
   difference() {
      translate([-2, -2, -8]) cube([2, 64, 40]);
      
      // SD
      translate([-4, 15, -1]) cube([16, 12, 2]);      
      translate([-1, 21, -1]) scale([1, 1, .5]) sphere(4);

      translate([-4, 10, 6])
         for(i = [1: 2: 20])
            translate([0, i * 2, 0])
               cube([10, 2, 10]);
      
   }

}

module RSide() {
   difference() {
      translate([119, -2, -8]) cube([2, 64, 40]);
      
      translate([112, 10, 6])
         for(i = [1: 2: 20])
            translate([0, i * 2, 0])
               cube([10, 2, 10]);
   }
}

module Front() {
   difference() {
      translate([-2, 62, -8]) cube([123, 2, 40]);
      
     // switch
     translate([10, 66, 5])
       rotate([90, 0, 0])
         cylinder(10, 2, 2);
     
     // speaker
     translate([33, 66, 4])
       rotate([90, 0, 0])
         cylinder(10, 4, 4);
         
     // LED
     translate([83, 66, 2])
       rotate([90, 0, 0])
         cylinder(10, 2, 2);

     // USB
     translate([103, 60, 1])
         cube([14.5, 13, 6]);
   }   

   difference() {
   translate([10, 64, 5])
     rotate([90, 0, 0])
       cylinder(4, 4, 4);

   translate([10, 64, 5])
     rotate([90, 0, 0])
       cylinder(4, 2, 2);
   }
   
}

module Back() {
   difference() {
     translate([-2, -4, -8])cube([123, 2, 40]);
     OPiRV2();
     translate([90, -2, 0]) PWR();
     }
}

module HDD(slot = false, bottom = true) {
   if(bottom) {
     //bottom
     difference() {
       translate([-2, -11, 32]) 
         cube([123, 75, 2]);
       translate([110, -1, 32])   
         cube([9, 46, 2]);
         
      translate([4, 11, 32])
         for(i = [1: 2: 40])
            translate([i * 2, 0, 0])
               cube([2, 31, 10]);
     }
   }
  //color([1,0,0,1])translate([98, 2, 34])cube([12, 46, 6]);

  translate([98, -3, 34]) cube([22, 2, 7]);
  difference() {
    union() {
      translate([105.5, 1, 34]) cylinder(7, 2, 2);
      translate([103.5, -3, 34]) cube([4, 4, 7]);
    }
    translate([105.5, 1, 34]) cylinder(7, 1, 1);
  }
  translate([98, -3, 40]) cube([6, 2.5, 1]);
  
  translate([98, 45, 34]) cube([22, 2, 7]);
  difference() {
    union() {
      translate([105.5, 43, 34]) cylinder(7, 2, 2);
      translate([103.5, 43, 34]) cube([4, 4, 7]);
    }
    translate([105.5, 43, 34]) cylinder(7, 1, 1);
  }
  translate([98, 44.5, 40]) cube([6, 2.5, 1]);
 
 
   // walls
  translate([10, -11, 34])
    difference() {
      cube([111, 2, 13]);
      for(i = [4: 2: 52])
         translate([i * 2, 0, 2])
            cube([2, 4, 5]);
            
      for(i = [1: 2: 11])
        translate([i * 10 - 14, -8, 11])
            cube([10, 10, 10]);
    }

  translate([10, 62, 34])
    difference() {
      cube([111, 2, 13]);
      for(i = [4: 2: 52])
         translate([i * 2, 0, 2])
            cube([2, 4, 5]);

      for(i = [1: 2: 11])
        translate([i * 10 - 14, 0, 11])
            cube([10, 10, 10]);
      
    }

  translate([119, -9, 34])    
    difference() {
      cube([2, 71, 13]);
      for(i = [4: 2: 30])
         translate([0, i * 2, 2])
            cube([2, 2, 5]);
            
      for(i = [1: 2: 10])
        translate([0, i * 11 - 12, 11])
            cube([10, 10, 10]);            
    }
    
    if(slot) {
      translate([0, -2, 27]) 
        difference() {
          cube([119, 64, 5]);
          translate([1, 1, 0])
            cube([117, 62, 5]);
      }
    }
}

module HDDTop(hdd2 = false) {
color([1,0,0,1])
  translate([-2, -11, 45])
    difference() {
      cube([123, 75, 2]);
      
      for(i = [1: 2: 48])
        translate([i * 2 + 10, 10, 0])
            cube([2, 55, 10]);
            
      for(i = [1: 2: 11])
        translate([i * 10 + 8, -8, 0])
            cube([10, 10, 10]);
            
      for(i = [1: 2: 11])
        translate([i * 10 + 8, 73, 0])
            cube([10, 10, 10]);

      for(i = [1: 2: 10])
        translate([121, i * 11, 0])
            cube([10, 12, 10]);

      if(hdd2)      
         translate([110, 10, -2])   
            cube([9, 46, 8]);
    }
}

module OpiTop() {
  translate([0, -2, 27]) 
    difference() {
      cube([119, 64, 5]);
      translate([1, 1, 0])
        cube([117, 62, 5]);
  }
  
  translate([-2, -4, 32]) 
    difference() {
      cube([123, 68, 2]);
      
      for(i = [1: 2: 52])
        translate([i * 2 + 9, 10, 0])
            cube([2, 50, 10]);
    }
}

if(opi) OPiRV2();
if(pwr) translate([90, -2, 0]) PWR();
if(back) Back();
if(base) Base();
if(lside) LSide();
if(rside) RSide();
if(front) Front();
if(hdd) HDD(true);
if(hddtop) HDDTop(hdd2);
if(opitop) OpiTop();
if(hdd2) translate([0, 0, 13]) HDD(false, false);
