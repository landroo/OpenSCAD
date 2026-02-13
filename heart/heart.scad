$fa = 2;
$fs = 1;

up = true;
addsvg = false;
rose = true;
cake = false;

module rcylinder(h, r1, r2, e = 2) {

  translate([0, 0, e])
    rotate_extrude(convexity = 10)
      translate([r1 - e, 0, 0])
        circle(r = e, $fn = 50);

  translate([0, 0, h - e])
    rotate_extrude(convexity = 10)
      translate([r2 - e, 0, 0])
        circle(r = e, $fn = 50);

  translate([0, 0, e])
    cylinder(h - e * 2, r1, r2);
  
  cylinder(h, r1 - e, r2 - e);
}

module rcube(x, y, z, e = 2, fill = false){
  
  if(fill) {
    translate([e, e, e]) 
      cube([x - e * 2, y - e * 2, z - e * 2]);
  }
 
  rwall(x, y, z, e);
  translate([0, y - e, 0])
    rwall(x, y, z, e);
  
  translate([e, 0, 0])
    rotate([0, 0, 90])
      rwall(y, x, z, e);
  translate([x, 0, 0])
    rotate([0, 0, 90])
      rwall(y, x, z, e);

  translate([0, 0, e])
    rotate([270, 0, 0])
      rwall(x, z, y, e);
      
  translate([0, 0, z])
    rotate([270, 0, 0])
      rwall(x, z, y, e);
}

module rwall(x, y, z, e = 2){
  
  translate([e / 2, 0, e / 2])
    cube([x - e, e, z - e]);
  
  translate([e / 2, e / 2, e / 2])
    cylinder(z - e, e / 2, e / 2);
  translate([x - e / 2, e / 2, e / 2])
    cylinder(z - e, e / 2, e / 2);

  translate([e / 2, e / 2, e / 2])
    rotate([0, 90, 0])
      cylinder(x - e, e / 2, e / 2);
  translate([e / 2, e / 2, z - e / 2])
    rotate([0, 90, 0])
      cylinder(x - e, e / 2, e / 2);
    
  translate([e / 2, e / 2, z - e / 2])
    sphere(e / 2);
  translate([x - e / 2, e / 2, e / 2])
    sphere(e / 2);
  translate([e / 2, e / 2, e / 2])
    sphere(e / 2);
  translate([x - e / 2, e / 2, z - e / 2])
    sphere(e / 2);
  
}


module heart(h = 22, r = 30, c = 1) {
  rcylinder(h, r, r, 5);

  translate([r + r / 3, 0, 0])
    rcylinder(h, r, r, 5);

  translate([r / 2 * sqrt(2) - c, -c, 0])
    rotate([0, 0, 45])
      translate([-r / 2, -r /2 , 0])
        rcube(r * 2, r * 2, h, 10, true);
}

module heartBox() {
difference(){
  heart(30, 40, 1.6);
  translate([1, 1, 1]) heart(28, 38, 1.6);
  

  if(up) translate([-70, -70, 0]) cube([170, 170, 15]);
  else translate([-70, -70, 15]) cube([170, 170, 15]);

  if(addsvg == false && rose)
  translate([122, 28, 25])
    rotate([0, 0, 140])
      scale([.4,.4,1])
        linear_extrude(height = 10)
          import(file = "rose.svg");

  if(addsvg == false && cake)
  translate([72, 55, 25])
    rotate([0, 0, 180])
      scale([.25,.25,1])
        linear_extrude(height = 10)
          import(file = "cake.svg");
        }    
  
  if(addsvg && rose)
  translate([122, 28, 30])
    rotate([0, 0, 140])
      scale([.4,.4,1])
        linear_extrude(height = 1)
          import(file = "rose.svg");

  if(addsvg && cake)
  translate([72, 55, 30])
    rotate([0, 0, 180])
      scale([.25,.25,1])
        linear_extrude(height = 1)
          import(file = "cake.svg");

}

if(up) {
  heartBox();
  outer();
}
else {
difference() {
  heartBox();
  outer();
  }
}

module outer() {
difference(){
  heart(30, 40, 1.6);
  translate([1, 1, 1]) heart(29, 39, 1.6);
  
  translate([-70, -70, 17.5]) cube([170, 170, 15]);
  translate([-70, -70, -2.5]) cube([170, 170, 15]);
}    

}