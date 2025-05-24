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
  
    difference() {
    translate([-2, -68, 3])
      cube([104, 71, 10]);
    translate([-1, -67, 3])
      cube([102, 69, 10]);
  }
}

if(downPart){
  
  difference(){
    case();
    translate([-5, -90, 5])
      cube([110, 110, 30]);
  }
  
  difference() {
    translate([-1, -67, 0])
      cube([102, 69, 10]);
    translate([0, -66, 0])
      cube([100, 67, 10]);
  }
}

if(downPart2){

  difference(){
    case();
    translate([-5, -90, 5])
      cube([110, 110, 30]);
  }
  
  translate([0, 0, 18])
  difference() {
    translate([-1, -67, 0])
      cube([102, 69, 10]);
    translate([0, -66, 0])
      cube([100, 67, 10]);
  }
  
  translate([0, 0, 5])
  difference() {
    translate([-2, -68, 0])
      cube([104, 71, 18]);
    translate([0, -66, 0])
      cube([100, 67, 18]);
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
  translate([0, -69, 0])
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
  translate([62, -68, 16])
    cube([40, 71, 2]);
      
  translate([14, -68, 16])
    cube([48, 16, 2]);
  translate([14, -53, 16])    
    cube([48, 2, 12]);    
      
  translate([14, -13, 16])
    cube([48, 16, 2]);
  translate([14, -13, 16])    
    cube([48, 2, 12]);
      
  translate([42, -53, 16])
  difference(){
    union() {
      translate([20, 0, 0])
        cube([2, 42, 12]);
      translate([-28, 0, 10])
        cube([50, 42, 2]);
      }  
      // poles
      translate([5, 8, 2])
        cube([34, 2, 12]);
      translate([5, 20, 2])
        cube([34, 2, 12]);
      translate([5, 32, 2])
        cube([34, 2, 12]);
      // connector
      translate([-2, 21, 6])
        rotate([0, 90, 0])
          cylinder(30, 4, 4);
      // upper
      translate([-10, 14, 4])
        cube([10, 10, 10]);
      translate([-5, 23, 4])
        cylinder(10, 5, 5);
        
  }
  // rail
  translate([14, -11, 24])
    cube([50, 4, 4]);
  translate([14, -57, 24])
    cube([50, 4, 4]);
      

  // front
  translate([100, -68, 0])    
      cube([2, 71, 18]);

  //back
  translate([-2, -68, 0])    
      cube([2, 71, 18]);
  difference() {
    translate([-2, -68, 18])
      cube([27, 71, 14]);
    
    translate([-4, 10, 12])
      rotate([45, 0, 0])
        cube([30,30,30]);

    translate([-4, -74, 12])
      rotate([45, 0, 0])
        cube([30,30,30]);

    translate([-30, -74, 33])
      rotate([0, 45, 0])
        cube([30,80,30]);
    // right
    translate([13, -74, 31])
      rotate([0, 45, 0])
        cube([30,80,30]);
    // bottom
    translate([12, -51, 10])
        cube([50, 38, 16]);
    // top
    translate([5, -74, 30])
        cube([10, 80, 10]);
  }
}

