$fa = 1;
$fs = 1;

size = 9;

box0 = false;
box1 = false;
box2 = false;
box3 = false;
pyr0 = false;
pyr1 = false;
pyr2 = false;
pyr3 = false;
pyr4 = false;
bul1 = false;
bul2 = false;
bul3 = false;
pip1 = false;
pip2 = false;
pip3 = true;

//
if(box0) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10, j * 10, 0])
        hull() {
          cube([10, 10, 1]);
          translate([1, 1, 1]) cube([8, 8, 1]);
        }
}
//
if(box1) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10, j * 10, 0])
        cube([10, 10, rands(0, 10, 1)[0]]);
}
//
if(box2) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10, j * 10, 0])
        hull() {
          cube([10, 10, 1]);
          translate([1, 1, rands(0, 2, 1)[0]]) cube([8, 8, 1]);
        }

}
//
if(box3) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10, j * 10, 0])
        hull() {
          cube([10, 10, 1]);
          translate([1, 1, 5]) cube([8, 8, 1]);
        }
}
//
if(pyr0) {
  difference() {
    for(i = [0: 1: size])
      for(j = [0: 1: size])
        translate([i * 10, j * 10, 0])
          hull() {
            cube([10, 10, 1]);
            translate([5, 5, rands(2, 15, 1)[0]]) cube([1, 1, 1]);
          }
    translate([0, 0, 5]) cube([(size *10) + 10, (size *10) + 10, 20]);        
  }
}
//
if(pyr1) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10, j * 10, 0])
        hull() {
          cube([10, 10, 1]);
          translate([5, 5, 10]) cube([1, 1, 1]);
        }
}
//
if(pyr2) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10, j * 10, 0])
        hull() {
          cube([10, 10, 1]);
          translate([5, 5, rands(0, 15, 1)[0]]) cube([1, 1, 1]);
        }
}
//
if(pyr3) {
  difference() {
    for(i = [0: 1: size])
      for(j = [0: 1: size])
        translate([i * 10, j * 10, 0])
          hull() {
            cube([10, 10, 1]);
            translate([5, 5, 5]) cube([1, 1, 1]);
          }
    translate([0, 0, 3]) cube([(size *10) + 10, (size *10) + 10, 20]);        
  }
}
//
if(pyr4) {
  difference() {
    translate([0, 0, 0]) cube([(size *10) + 10, (size *10) + 10, 5]);   

    for(i = [0: 1: size])
      for(j = [0: 1: size])
        translate([i * 10, j * 10, -5])
          hull() {
            translate([5, 5, 6]) cube([1, 1, 1]);
            translate([0, 0, 10]) cube([10, 10, 1]);
          }
  }
}
//
if(bul1) {
  difference() {
    for(i = [0: 1: size])
      for(j = [0: 1: size])
        translate([i * 10 + 5, j * 10 + 5, 0])
          sphere(5);
    
    translate([0, 0, -10]) cube([(size *10) + 10, (size *10) + 10, 10]); 
  }
  cube([(size *10) + 10, (size *10) + 10, 1]);     
}
//
if(bul2) {
  difference() {
    for(i = [0: 1: size])
      for(j = [0: 1: size])
        translate([i * 10 + 5, j * 10 + 5, 0])
          resize([10, 10, rands(0, 15, 1)[0]])
            sphere(5);
    
    translate([0, 0, -10]) cube([(size *10) + 10, (size *10) + 10, 10]); 
  }
  cube([(size *10) + 10, (size *10) + 10, 1]);     
}
//
if(bul3) {
  difference() {
    translate([0, 0, 0]) cube([(size *10) + 10, (size *10) + 10, 5]);   
    
    for(i = [0: 1: size])
      for(j = [0: 1: size])
        translate([i * 10 + 5, j * 10 + 5, 6])
          sphere(5);
  }
  cube([(size *10) + 10, (size *10) + 10, 1]);     
}
//
if(pip1) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10 + 5, j * 10 + 5, 0])
        cylinder(rands(1, 10, 1)[0], 5, 5);
   cube([(size *10) + 10, (size *10) + 10, 1]);             
}
//
if(pip2) {
  for(i = [0: 1: size])
    for(j = [0: 1: size])
      translate([i * 10 + 5, j * 10 + 5, 1])
        cylinder(rands(1, 10, 1)[0], 5, 2);
   cube([(size *10) + 10, (size *10) + 10, 1]);             
}
//
if(pip3) {
  difference() {
    translate([0, 0, 0]) cube([(size *10) + 10, (size *10) + 10, 5]);
    for(i = [0: 1: size])
      for(j = [0: 1: size])
        translate([i * 10 + 5, j * 10 + 5, 1])
          cylinder(5, 1, 5);
  }
  cube([(size *10) + 10, (size *10) + 10, 1]);
}
