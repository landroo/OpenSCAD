$fa = 1;
$fs = .4;
$fn = 100;

xs = 18;
ys = 18;
h = 6;

module rounded_cube(size,r,center=false)
{
  s = is_list(size) ? size : [size,size,size];
  translate(center ? -s/2 : [0,0,0])
    hull() {
      translate([    r,    r,    r]) sphere(r=r);
      translate([    r,    r,s.z-r]) sphere(r=r);
      translate([    r,s.y-r,    r]) sphere(r=r);
      translate([    r,s.y-r,s.z-r]) sphere(r=r);
      translate([s.x-r,    r,    r]) sphere(r=r);
      translate([s.x-r,    r,s.z-r]) sphere(r=r);
      translate([s.x-r,s.y-r,    r]) sphere(r=r);
      translate([s.x-r,s.y-r,s.z-r]) sphere(r=r);
    }
}

module button() {
  difference(){
    rounded_cube([xs, ys, h], 1);
    cube([xs, ys, h -4]);
    translate([2, 2, 0])
      cube([xs - 4, ys - 4, h - 2]);
  }

  difference(){
    union() {
      translate([xs / 2, ys / 2, -4])
        cylinder(h + 2, 3, 3);
      translate([xs / 2, ys / 2, -6])
        cylinder(h / 2 - 1, 2, 3.4);
    }

    translate([xs / 4, ys / 2 - 1, -9])
      cube([10, 2, 10]);
  }
  
}

module foot(){
  difference(){
    translate([xs / 2, ys / 2, -6])
      cylinder(h - 1, 4.2, 4.2);

    translate([xs / 2, ys / 2, -7])
      cylinder(h + 2, 3.2, 3.2);
  }

  difference(){
    translate([-1, -1, -6])
      cube([xs + 2, ys + 2, 1]);

    translate([xs / 2, ys / 2, -7])
      cylinder(h + 1, 4.2, 4.2);
  }
  
  translate([xs / 2, ys / 2, -5])
    spring(d = 11.5, windings=2, height=8, wireDiameter=2);
}

module line(start, end, d, fn=4) {
  hull() {
    node(start,d, fn);
    node(end,d, fn);
  }      
}

module node(pos, d, fn=4) {
  if (pos[0]!=undef && pos[1] != undef && pos[2] != undef){ 
    translate(pos) sphere(d=d, $fn = fn);    
  }
}

module spring(d, dBottom=6, dTop=6, windings=2, height=10, steps=10, wireDiameter=1,fn=10) {
    // we use either d or dBottom&dTop
    r0 = d != undef ? d/2 : dBottom/2;
    r1 = d != undef ?d/2 : dTop/2;
    
    rx = (r0-r1) / (360.0*windings);    
    heightPerDegree = height/windings/360;
    
    for ( angle = [steps : steps : 360*windings] ){
        r = r0 - (angle * rx); 
        x0=r*cos(angle-steps);
        y0=r*sin(angle-steps);
        z0=(angle-steps)*heightPerDegree;
        x=r*cos(angle);
        y=r*sin(angle);
        z=angle*heightPerDegree;

        line([x0,y0,z0],[x,y,z],d=wireDiameter,fn=fn);        
    }
}

//translate([0, 0, -2])
  button();

//foot();


