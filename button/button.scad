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

module button1() {
  difference(){
    translate([0, 0, -2])
      rounded_cube([xs, ys, h], 1);
    
    translate([0, 0, -3])
      cube([xs, ys, h - 4]);
    
    translate([2, 2, -2])
      cube([xs - 4, ys - 4, h - 2]);
  }

  difference(){
    union() {
      translate([xs / 2, ys / 2, -4])
        cylinder(h, 3, 3);
      
      translate([xs / 2, ys / 2, -6])
        cylinder(h / 2 - 1, 2, 3.4);
    }

    translate([xs / 4, ys / 2 - 1, -9])
      cube([10, 2, 10]);
  }
  
}

module button2() {
  difference(){
    union(){
      translate([2, 2, 0])
        rounded_cube([xs - 4, ys - 4, h], 1);
      
      translate([1, 1, 2])
        cube([xs - 2, ys - 2, 1]);
    }
    cube([xs, ys, h -4]);
    
    translate([4, 4, 0])
      cube([xs - 8, ys - 8, h - 2]);
  }
  
  translate([xs / 2, ys / 2, 1])
    cylinder(4, 2.5, 2.5);
}

module foot1(){
  difference(){
    translate([xs / 2, ys / 2, -6])
      cylinder(h - 2, 4.2, 4.2);

    translate([xs / 2, ys / 2, -7])
      cylinder(h + 2, 3.2, 3.2);
  }

  difference(){
    translate([0, 0, -6])
      cube([xs, ys, 1]);

    translate([xs / 2, ys / 2, -7])
      cylinder(h + 1, 4.2, 4.2);
    
    translate([3, 3, -9])
      cylinder(5, 1, 1);
    
    translate([3, ys - 3, -9])
      cylinder(5, 1, 1);

    translate([xs - 3, ys - 3, -9])
      cylinder(5, 1, 1);
    
    translate([xs - 3, 3, -9])
      cylinder(5, 1, 1);
    
  }
  
  translate([xs / 2 - 3.5, ys / 2, -6])
    cylinder(1, 1, 1);
  translate([xs / 2 + 3.5, ys / 2, -6])
    cylinder(1, 1, 1);
  
  //translate([xs / 2, ys / 2, -5])
  //  spring(d = 11.5, windings=2, height=8, wireDiameter=2);
}

module foot2(){
  difference(){
    translate([0, 0, -7])
      cube([xs, ys, 1]);
  
    translate([1.8, 1.8, -9])
      rounded_cube([xs - 3.5, ys - 3.5, h], 1);
  }

  difference(){
    translate([0, 0, -12])
      difference(){
        translate([-1, -1, 0])
          cube([xs + 2, ys + 2, 6]);
        cube([xs, ys, 8]);
        
      }
    
    translate([9, 20, -9.3])
      rotate([90, 0, 0])
        cylinder(ys / 2, .5, .5);

    translate([xs + 10, 9, -10.5])
      rotate([90, 0, -90])
        cylinder(xs + 6, .5, .5);      
  }
}

module tpu() {
  difference(){
    union(){
      translate([0, 0, -11])
        cube([xs, ys, 1]);
    
      translate([xs / 2, ys / 2, -11])
        cylinder(2, 6.2, 4.2);
    }
  
    translate([xs / 2, ys / 2, -11.5])
      cylinder(2, 5, 4);

    translate([9, 18, -9.3])
      rotate([90, 0, 0])
        cylinder(ys, .5, .5);
    
    translate([18, 9, -11])
      rotate([90, 0, -90])
        cylinder(xs + 1, .9, .9);
    
    translate([3, 3, -12])
      cylinder(3, 2, 2);
    
    translate([3, ys - 3, -12])
      cylinder(3, 2, 2);
    
    translate([xs - 3, ys - 3, -12])
      cylinder(3, 2, 2);
    
    translate([xs - 3, 3, -12])
      cylinder(3, 2, 2);
  
  }
  
}

module base(th) {
  
  translate([0, 0, -14])
    cube([xs, ys, 1]);
  
  translate([3, 3, -14])
    cylinder(th, 1.8, 1.8);
  
  translate([3, ys - 3, -14])
    cylinder(th, 1.8, 1.8);
  
  translate([xs - 3, ys - 3, -14])
    cylinder(th, 1.8, 1.8);
  
  translate([xs - 3, 3, -14])
    cylinder(th, 1.8, 1.8);

  if(th > 3) {
    translate([3, 3, -14])
      cylinder(th + 1, .8, .8);
      
    translate([3, ys - 3, -14])
      cylinder(th + 1, .8, .8);
      
    translate([xs - 3, ys - 3, -14])
      cylinder(th + 1, .8, .8);
      
    translate([xs - 3, 3, -14])
      cylinder(th + 1, .8, .8);
  }
  difference(){
    translate([18, 9, -13])
      rotate([90, 0, -90])
        cylinder(xs, .9, .9);
  
    translate([18, 9, -12.5])
      rotate([90, 0, -90])
        cylinder(xs + 1, .5, .5);
  }
  
}

module button(bt){
  difference(){
    union(){
      if(bt == 1){
        translate([0, 0, -3])
          button1();

        translate([0, 0, -1])
          foot1();
        
        translate([0, 0, 2])
          base(5);
        
      }
      else {
        translate([0, 0, -10])
          button2();

        foot2();  
        
        translate([0, 0, 2])
          base(3);
      }
      
      tpu();
      
    }
    
    translate([9, -5, -20]) cube([30,30,30]);
  }
}

button(2);

/*
for (px =[0:9])
  for (py =[0:3])
    translate([px * (xs + .2), py * (ys + .2), 0]) button();

*/