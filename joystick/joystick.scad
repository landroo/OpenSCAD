$fa = 1;
$fs = 0.4;


difference() {
  union() {
    translate([0, 0, 20])
      rotate_extrude(convexity = 10)
        translate([6, 0, 0])
          circle(r = 3, $fn = 100);

    translate([0, 0, 17])
      cylinder(6, 5, 5);
  }


  translate([-9, -9, 10])
    cube([18,18,10]);
  
  translate([0, 0, 38])
    sphere(16);
  
}
/*
translate([-9,-9,2])
  cube([18,18,18]);
*/



translate([0, 0, 14])
  cylinder(6, 4, 4);

difference() {
  translate([0, 0, 0])
    sphere(15);

  translate([-15, -15, -25])
    cube([30,30,30]);
  
  translate([0, 0, 0])
    sphere(14);
  
}
/*
translate([-14,-14,5])
  cube([28,28,18]);
*/

difference(){
  translate([0, 0, 6])
    cylinder(8, 3, 4);

  translate([-1.5,-1,5])
    cube([3,2,8]);
}
