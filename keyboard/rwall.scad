
//
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

//
module rcube(x, y, z, e = 2){
  
  //translate([e, e, e]) cube([x - e * 2, y - e * 2, z - e * 2]);
 
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

//
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

//
module rounded_ngon(num, r, rounding = 0) {
  function v(a) = let (d = 360/num, v = floor((a+d/2)/d)*d) (r-rounding) * [cos(v), sin(v)];
  polygon([for (a=[0:360-1]) v(a) + rounding*[cos(a),sin(a)]]);
}        

// rpoly();
module rpoly(side = 4, h = 10, w = 10, e = 2) {
   rotate([0, 0, 180 / side])
      linear_extrude(height = h)
         rounded_ngon(num = side, r = w / sqrt(2), rounding = e);
}

