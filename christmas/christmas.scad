$fa = 4;
$fs = 0.4;

module regular_polygon(height = 2, order = 4, r = 1){
  angles=[ for (i = [0:order-1]) i*(360/order) ];
  coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
  linear_extrude(height) polygon(coords);
}


//translate([0, 0, -.5])cylinder(1, 25, 25);

/*
linear_extrude(height = 60, twist = 90, slices = 60) {
   difference() {
     offset(r = 10) {
      square(20, center = true);
     }
     offset(r = 8) {
       square(20, center = true);
     }
   }
 }
*/
/*
// sphere
difference(){
union(){
  resize([36, 36, 15])
  difference(){
    sphere(18);
    sphere(16);
    
    //translate([0, 0, -20])
    //cylinder(50, 10, 10);
  }

  translate([16, 0, 0])
  rotate([0, 90, 0])
  cylinder(5, 3, 3);
}

  translate([14, 0, 0])
  rotate([0, 90, 0])
  cylinder(10, 2.6, 2.6);

  
  //translate([0, 0, -2])
  //cylinder(20, 10, 10);
}
*/

/*
// 5 angle
difference(){
  
  union(){
  hull() {
    regular_polygon(height = 8, order = 5, r = 18);
    translate([0, 0, -1])
      regular_polygon(height = 10, order = 5, r = 17);
  }
  translate([13, 0, 4])
  rotate([0, 90, 0])
  cylinder(8, 3, 3);
  }
  
  regular_polygon(height = 8, order = 5, r = 16);

  translate([12, 0, 4])
  rotate([0, 90, 0])
  cylinder(10, 2.6, 2.6);
  
  //translate([0, 0, -2])
  //cylinder(20, 10, 10);
}
*/

/*
// star 6
difference(){
star6();
translate([18, 0, 4])
  rotate([0, 90, 0])
  cylinder(10, 2.6, 2.6);
}
*/
module star5() {

  translate([13, 0, 4])
  rotate([0, 90, 0])
  cylinder(8, 3, 3);

  for(i = [0: 360/5:360])
  rotate([0, 0, i])
  translate([11.2, 0, 0])
  difference(){
    regular_polygon(height = 8, order = 3, r = 7);
    translate([-.5, 0, -1])
    regular_polygon(height = 10, order = 3, r = 6.5);
  }

  translate([0, 0, -1])
  for(i = [0: 360/5:360])
  rotate([0, 0, i])
  translate([11.2, 0, 0])
  regular_polygon(height = 1, order = 3, r = 7);
  
  translate([0, 0, -1])
  regular_polygon(height = 1, order = 5, r = 12);

  translate([0, 0, 8])
  for(i = [0: 360/5:360])
  rotate([0, 0, i])
  translate([11.2, 0, 0])
  regular_polygon(height = 1, order = 3, r = 7);
  
  translate([0, 0, 8])
  regular_polygon(height = 1, order = 5, r = 12);
  
}

module star6() {

  translate([19, 0, 4])
  rotate([0, 90, 0])
  cylinder(8, 4, 4);

  for(i = [0: 360/6:360])
  rotate([0, 0, i])
  translate([17, 0, 0])
  difference(){
    regular_polygon(height = 8, order = 3, r = 9);
    translate([-.5, 0, -1])
    regular_polygon(height = 10, order = 3, r = 8.2);
  }

  translate([0, 0, -1])
  for(i = [0: 360/6:360])
  rotate([0, 0, i])
  translate([17, 0, 0])
  regular_polygon(height = 1, order = 3, r = 9);
  
  translate([0, 0, -1])
  regular_polygon(height = 1, order = 6, r = 17);

  translate([0, 0, 8])
  for(i = [0: 360/6:360])
  rotate([0, 0, i])
  translate([17, 0, 0])
  regular_polygon(height = 1, order = 3, r = 9);
  
  translate([0, 0, 8])
  regular_polygon(height = 1, order = 6, r = 17);
}



// star 2 
//difference(){
difference(){
   //star2(6, 0);
   //star2(7, 38);
   //star2(8, 0);
   //star2(9, 10);
   //star2(10, 0);
   //translate([0, 0, 13]) cylinder(15, 2.6, 2.6);
}
//translate([-30, -10, -30])cube([60, 10, 60]);//
//}

module star2(num = 6, rot = 0) {
translate([0, 0, 14])
  cylinder(13, 3.4, 3.4);

difference(){
for(i = [0: 360/num:360])
  rotate([0, i, 0])
  translate([0, 0, 8])
   hull(){
      cylinder(20, 5, 0);
      translate([-5, -5, 0]) cube([10, 10, 1]);
   }

for(i = [0: 360/num:360])
  rotate([0, i, 0])
  translate([0, 0, 6])
   hull(){
      cylinder(20, 5, 0);
      translate([-5, -5, 0]) cube([10, 10, 1]);
   }
}
   
translate([0, -4.5, 0])   
   rotate([90, rot, 0])
      regular_polygon(height = 1, order = num, r = 10);
   
translate([0, 5.5, 0])   
   rotate([90, rot, 0])
      regular_polygon(height = 1, order = num, r = 10);
}


//resize([50, 20, 50]) pine();

module pine() {
  translate([0, 0, 30]) cylinder(15 , 10, 0);
  translate([0, 0, 20]) cylinder(20 , 15, 0);
  translate([0, 0, 10]) cylinder(25 , 20, 0);
  translate([0, 0, 0]) cylinder(30 , 25, 0);
}
/*
difference(){
   cylinder(50, 5, 5);
   cylinder(45, 4.4, 4.2);
}
translate([0, 0, 50])sphere(5);
*/


/*
hull(){
   cylinder(20, 5, 0);
   regular_polygon(height = 1, order = 6, r = 6);
}
*/


topstar();
mirror([0, 0, 1]) topstar();
rotate([0, 90, 36]) translate([0, 0, 10]) difference() {
   cylinder(80, 5, 10);
   cylinder(80, 3, 8);
}

module topstar() {
   hull(){
      cylinder(10, 20, .1);
      translate([100, 0, 0]) sphere(.1);
   }

   rotate([0, 0, 360 / 5]) hull(){
      cylinder(10, 20, .1);
      translate([100, 0, 0]) sphere(.1);
   }
   
   rotate([0, 0, 360 / 5 * 2]) hull(){
      cylinder(10, 20, .1);
      translate([100, 0, 0]) sphere(.1);
   }
   
   rotate([0, 0, 360 / 5 * 3]) hull(){
      cylinder(10, 20, .1);
      translate([100, 0, 0]) sphere(.1);
   }

   rotate([0, 0, 360 / 5 * 4]) hull(){
      cylinder(10, 20, .1);
      translate([100, 0, 0]) sphere(.1);
   }
   
}
