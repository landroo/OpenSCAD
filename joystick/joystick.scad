$fa = 1;
$fs = 0.4;
   
translate([0, 0, 22])
  scale([1, 1, .6])
    rotate_extrude(convexity = 10)
      translate([5, 0, 0])
        circle(r = 3, $fn = 100);

//color([1,0,0, .5]) translate([-9,-9,5]) cube([18,18,18]);

translate([0, 0, 14])
  cylinder(9, 4, 4);

difference() {
  translate([0, 0, 0])
    sphere(15);

  translate([-15, -15, -25])
    cube([30,30,30]);
  
  translate([0, 0, 0])
    sphere(14);
  
}

//color([1,0,0, .5]) translate([-14,-14,5]) cube([28,28,18]);

difference(){
  translate([0, 0, 7])
    cylinder(7, 3, 4);

  translate([-1.2,-.7,5])
    cube([2.4,1.4,8]);
}
