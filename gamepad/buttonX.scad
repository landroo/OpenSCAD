$fa = 4;
$fs = 0.4;




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

module regular_polygon(height = 2, order = 4, r=1){
  angles=[ for (i = [0:order-1]) i*(360/order) ];
  coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
  linear_extrude(height) polygon(coords);
}


difference() {
  union() {
    translate([-12, -4, 0]) rcube(24, 8, 6, 1);
    translate([-4, -12, 0]) rcube(8, 24, 6, 1);

    cylinder(2, 15, 15);
    
    sphere(2);
  }

  translate([-8, 0, -2]) cylinder(2.5, 3, 3);
  translate([8, 0, -2]) cylinder(2.5, 3, 3);
  translate([0, 8, -2]) cylinder(2.5, 3, 3);
  translate([0, -8, -2]) cylinder(2.5, 3, 3);
  
  translate([0, 0, 8]) sphere(3);
  
  translate([8, 0, 5.5]) regular_polygon(10, 3, 2.5);
  translate([-8, 0, 5.5]) 
    rotate([0, 0, 60]) regular_polygon(10, 3, 2.5);
  translate([0, -8, 5.5]) 
    rotate([0, 0, 30]) regular_polygon(10, 3, 2.5);
  translate([0, 8, 5.5]) 
    rotate([0, 0, 90]) regular_polygon(10, 3, 2.5);
}




