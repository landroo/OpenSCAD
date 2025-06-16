$fa = 1;
$fs = .4;

upPart = true;
downPart = false;
downPart2 = false;

// batteries
//color([1, 0, 0, .9]) batteries();

// case
//case();

if(upPart){

  difference(){
    case();
    translate([-5, -90, -22])
      cube([110, 110, 30]);
  }
  
  // edge
  difference() {
    translate([-2, -70, 3])
      cube([104, 73, 10]);
    translate([-1, -69, 3])
      cube([102, 71, 10]);
  }
}

if(downPart){
  
  difference(){
    case();
    translate([-5, -90, 5])
      cube([110, 110, 30]);
  }
  
  // edge
  difference() {
    translate([-1, -69, 0])
      cube([102, 71, 10]);
    translate([0, -68, 0])
      cube([100, 69, 10]);
  }
}

if(downPart2){

  difference(){
    case();
    translate([-5, -90, 5])
      cube([110, 110, 30]);
  }
  
  // edge
  translate([0, 0, 18])
  difference() {
    translate([-1, -69, 0])
      cube([102, 71, 10]);
    translate([0, -68, 0])
      cube([100, 69, 10]);
  }
  
  // taller
  translate([0, 0, 5])
  difference() {
    translate([-2, -70, 0])
      cube([104, 73, 18]);
    translate([0, -68, 0])
      cube([100, 69, 18]);
  }

}

// batteries
module batteries(){
  translate([10, 0, 0])
  rotate([90, 0, 0])
  hull(){
    translate([0,0,0])
      cylinder(65, 10, 10);
    translate([80,0,0])
      cylinder(65, 10, 10);
  }

  //panel
  translate([10, -64, 6])
    cube([86, 62, 10]);
  // plug
  translate([25, -50, 16])
    cube([26, 36, 10]);
  // spring
  translate([6,-30,0])
    cylinder(19, 2.5, 2.5);
}


module case() {
  // sides
  side();
  translate([0, -71, 0])
    side();
  module side(){
    translate([10, 3, 0])
    rotate([90, 0, 0])
    hull(){
      translate([0, 0, 0])
        cylinder(2, 12, 12);
      translate([80,0,0])
        cylinder(2, 12, 12);
    }

    translate([-2, 1, 0])
      cube([104, 2, 18]);
  }

  // bottom
  translate([9, -68, -12])
    cube([82, 71, 2]);
  rotate([90, 0, 0])
    translate([10, 0, -3])
      difference() {
        cylinder(71, 12, 12);
        cylinder(71, 11, 11);
        translate([-12, 0, 0])
          cube([24, 12, 72]);
        translate([0, -12, 0])
          cube([24, 12, 72]);
      }
  rotate([90, 0, 0])    
    translate([90, 0, -3])
      difference() {
        cylinder(71, 12, 12);
        cylinder(71, 11, 11);
        translate([-12, -12, 0])
          cube([12, 24, 72]);
        translate([-12, 0, 0])
          cube([24, 12, 72]);
      }

      
   // top
   top();
   module top(){
      translate([62, -68, 16])
        cube([40, 71, 2]);

      // left
      translate([14, -68, 16])
         cube([48, 9, 2]);
      difference(){
         translate([12, -59, 16])
            cube([66, 2, 16]);
         translate([71, -63, 33])
            rotate([0, 45, 0])
               cube([10, 10, 10]);
      }

      // right
      translate([14, -7, 16])
        cube([48, 8, 2]);
      difference(){
         translate([12, -9, 16])    
            cube([66, 2, 16]);
         translate([71, -10, 33])
            rotate([0, 45, 0])
               cube([10, 10, 10]);
      }

      // top  
      translate([42, -60, 16])
         difference(){
           union() {
             translate([20, 1, 0])
               cube([2, 52, 16]);
             translate([-30, 1, 14])
               cube([52, 52, 2]);
          }
          
          // poles
          translate([-6, 6, 2])
            cube([34, 2, 16]);
          translate([10, 13, 2])
            cube([34, 2, 16]);
          translate([-6, 46, 2])
            cube([34, 2, 16]);
          
          // connector
          translate([-2, 31, 10])
            rotate([0, 90, 0])
              cylinder(30, 4, 4);          
          translate([15, 27, 3])
            cube([10, 8, 8]);
      }
      
      // rails
      difference(){
         translate([12, -7, 24])
           cube([58, 4, 8]);
         translate([70, -7, 20])
            rotate([0, 0, 45])
               cube([6, 6, 20]);
      }
      difference(){
         translate([12, -63, 24])
            cube([58, 4, 8]);      
         translate([70, -67.5, 20])
            rotate([0, 0, 45])
               cube([6, 6, 20]);
      }
       
   }
   
  // front
  translate([100, -68, 0])    
      cube([2, 71, 18]);

  //back
  translate([-2, -68, 0])    
      cube([2, 71, 18]);
  
  // shoulder
  shoulder();
  module shoulder() {
      difference() {
         translate([-2, -68, 18])
            cube([35, 71, 15]);
        
         //side
         translate([-4, 3, 10])
            rotate([14, 0, 0])
               cube([40,40,40]);
         //side
         translate([-4, -72, 2])
            rotate([76, 0, 0])
               cube([40,40,40]);

         // back
         translate([-30, -70, 33])
            rotate([0, 45, 0])
               cube([30,80,30]);
         // right
         translate([18, -70, 40])
            rotate([0, 60, 0])
               cube([50,100,50]);
         // bottom
         translate([12, -58, 10])
            cube([50, 52, 16]);
        // top
        //translate([5, -74, 30])
          //  cube([10, 80, 10]);
      }
  }
}

