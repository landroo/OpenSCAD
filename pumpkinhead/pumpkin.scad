$fa = 4;
$fs = 0.4;

eyes = 3;   // 1-6
nose = 1;   // 1-2
mouth = 3;  // 1-6
stem = 0;   // 1

pumpkinhead(eyes, nose, mouth);

/*
for(i = [1:1:6])
  for(j = [1:1:2])
    for(k = [1:1:6]) {
      translate([i * 40, k * 40, j * 40])
      pumpkinhead(i, j, k);
    }
*/

module regular_polygon(height = 2, order = 4, r=1){
  angles=[ for (i = [0:order-1]) i*(360/order) ];
  coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
  linear_extrude(height) polygon(coords);
}

module pumpkinhead(eyes, nose, mouth) {
  color([1, .5, 0, 1])
  difference(){

    pumpkin();
    
    if(eyes == 1) eyes1();
    if(eyes == 2) eyes2();
    if(eyes == 3) eyes3();
    if(eyes == 4) eyes4();
    if(eyes == 5) eyes5();
    if(eyes == 6) eyes6();
    
    if(nose == 1) nose1();
    if(nose == 2) nose2();
    
    if(mouth == 1) mouth1();
    if(mouth == 2) mouth2();
    if(mouth == 3) mouth3();
    if(mouth == 4) mouth4();
    if(mouth == 5) mouth5();
    if(mouth == 6) mouth6();

    resize([22, 22, 18])
    sphere(22);          

  }

  stem();
}

module pumpkin(){
  for(i = [0: 30: 360])
    rotate([0, 0, i])
    translate([0, 3, 0])
    resize([15, 20, 20])
    sphere(20);
}

module stem() {
  color([0.5, 1, .1, 1]) {
  translate([0, 0, 9]) {
    resize([4, 6, 6])
    cylinder(20, 5, 3);
    resize([6, 4, 6])
    cylinder(10, 5, 3);
  }
  if(stem == 1) {
    hull(){
      translate([0, 0, 15])
      sphere(1.6);
      translate([0, 1, 17])
      sphere(1.5);
    }
    hull(){
      translate([0, 1, 17])
      sphere(1.5);
      translate([0, 4, 19])
      sphere(1);
    }
    }
  }
}

module eyes1() {
  translate([0, 0, 3])
  rotate([0, 0, 30])
  rotate([0, 90, 0])
  rotate([0, 0, 60])
  hull(){
    regular_polygon(20, 3, 2);
    cylinder(1, 3, 3);
  }

  translate([0, 0, 3])
  rotate([0, 0, -30])
  rotate([0, 90, 0])
  rotate([0, 0, 60])
  hull(){
    regular_polygon(20, 3, 2);
    cylinder(1, 3, 3);
  }
}

module eyes2(){
  translate([15, -9, 3])
  rotate([0, 0, -30])
  rotate([0, 270, 0])
  resize([3, 8, 8])
  difference(){
    cylinder(10, 5, 5);
    translate([-4, 0, -1])
      cylinder(20, 5, 5); 
  }

  translate([15, 9, 3])
  rotate([0, 0, 30])
  rotate([0, 270, 0])
  resize([3, 8, 8])
  difference(){
    cylinder(10, 5, 5);
    translate([-4, 0, -1])
      cylinder(20, 5, 5); 
  }
}

module eyes3(){
  translate([5, 2, 5]){
  rotate([0, 0, 30])
  difference(){
    rotate([0, 90, 0])
    cylinder(10, 3, 3);

    translate([-1, -4, -2])
    rotate([45, 0, 0])
    cube([12, 8, 4]);
    
    translate([-1, -1, 0])
    rotate([0, 90, 0])
    cylinder(12, 1.5, 1.5);
    
    }
  }

  translate([5, -2, 5]){
  rotate([0, 0, -30])
  difference(){
    rotate([0, 90, 0])
    cylinder(10, 3, 3);

    translate([-1, 4, -2])
    rotate([45, 0, 0])
    cube([12, 4, 8]);
    
    translate([-1, 1, 0])
    rotate([0, 90, 0])
    cylinder(12, 1.5, 1.5);
    }
  }
}

module eyes4(){
  translate([5, 2, 5]){
  rotate([0, 0, 30])
  difference(){
    rotate([0, 90, 0])
    cylinder(10, 3, 3);

    translate([-1, -2, -1])
    rotate([0, 90, 0])
    cylinder(12, 1.5, 1.5);
    
    }
  }

  translate([5, -2, 5]){
  rotate([0, 0, -30])
  difference(){
    rotate([0, 90, 0])
    cylinder(10, 3, 3);
    
    translate([-1, 2, -1])
    rotate([0, 90, 0])
    cylinder(12, 1.5, 1.5);
    }
  }
}

module eyes5(){
  translate([0, -5, 0]){
     difference(){
       rotate([45, 0, 0])
       cube([20, 5, 5]);

       translate([-1, -4, -4])
       cube([22, 8, 8]);
     }
    
   }

   translate([0, 5, 0]){
     difference(){
       rotate([45, 0, 0])
       cube([20, 5, 5]);

       translate([-1, -4, -4])
       cube([22, 8, 8]);
     }
    
   }
}

module eyes6(){
  translate([0, -5, 2]){
     difference(){
       rotate([45, 0, 0])
       cube([20, 5, 5]);

       translate([-1, -4, 3])
       cube([22, 8, 8]);
     }
    
   }

   translate([0, 5, 2]){
     difference(){
       rotate([45, 0, 0])
       cube([20, 5, 5]);

       translate([-1, -4, 3])
       cube([22, 8, 8]);
     }
    
   }
}

module nose1() {
  translate([0, 0, 0])
  rotate([0, 90, 0])
  rotate([0, 0, 60])
  hull(){
    regular_polygon(20, 3, 2);
    cylinder(1, 3, 3);
  }
}

module nose2() {
  translate([10, 0, -5]){
     difference(){
       rotate([45, 0, 0])
       cube([20, 5, 5]);

       translate([-1, -4, -4])
       cube([22, 8, 8]);
     }
    
   }
}

module mouth1(){
  difference(){
    resize([20, 20, 7])
    rotate([0, 90, 0])
    difference(){
      cylinder(10, 10, 10);
      translate([-4, 0, -1])
      cylinder(20, 10, 10); 
    }

    translate([-1, -6, -4])
    cube([22, 2, 2]);
    translate([-1, 4, -4])
    cube([22, 2, 2]);
    translate([-1, -1, -6])
    cube([22, 2, 2]);
  }     
}

module mouth2(){
  difference(){
    resize([20, 20, 7])
    rotate([0, 90, 0])
    difference(){
      cylinder(10, 10, 10);
      translate([-4, 0, -1])
      cylinder(20, 10, 10); 
    }

    translate([-1, -6, -3.8])
    rotate([24, 0, 0])
    cube([22, 2, 2]);
    
    translate([-1, 6, -3.8])
    rotate([66, 0, 0])
    cube([22, 2, 2]);
    
    translate([-1, 0, -7.2])
    rotate([45, 0, 0])
    cube([22, 2, 2]);
  }    
}

module mouth3(){
  difference(){
    resize([20, 20, 7])
    rotate([0, 90, 0])
    difference(){
      cylinder(10, 10, 10);
      translate([-4, 0, -1])
      cylinder(20, 10, 10); 
    }

    translate([-1, -2.2, -4.6])
    rotate([36, 0, 0])
    cube([22, 2, 2]);
    
    translate([-1, 2.2, -4.6])
    rotate([48, 0, 0])
    cube([22, 2, 2]);
    

    translate([-1, -4.5, -6.8])
    rotate([36, 0, 0])
    cube([22, 2, 2]);
    
    translate([-1, 4.5, -6.8])
    rotate([48, 0, 0])
    cube([22, 2, 2]);
    

    translate([-1, -6, -3.4])
    rotate([24, 0, 0])
    cube([22, 2, 2]);
    
    translate([-1, 6, -3.4])
    rotate([60, 0, 0])
    cube([22, 2, 2]);
    
    
    translate([-1, -8.5, -5.4])
    rotate([24, 0, 0])
    cube([22, 2, 2]);
    
    translate([-1, 8.5, -5.4])
    rotate([60, 0, 0])
    cube([22, 2, 2]);
    
    
    translate([-1, 0, -7.2])
    rotate([45, 0, 0])
    cube([22, 2, 2]);
  }    
}

module mouth4(){
  difference(){
    translate([6, 0, -4])
    resize([10, 15, 3])
    rotate([0, 90, 0])
    cylinder(10, 2, 2);
    
    translate([-1, -4, -4])
    cube([22, 2, 2]);
    translate([-1, 2, -4])
    cube([22, 2, 2]); 
    translate([-1, -1, -6])
    cube([22, 2, 2]);
    }
}

module mouth5(){
  difference(){
    translate([6, 0, -4])
    resize([10, 15, 3])
    rotate([0, 90, 0])
    cylinder(10, 2, 2);
    
    translate([-1, -4, -4])
    rotate([45, 0, 0])
    cube([22, 2, 2]);
    translate([-1, 3.5, -4])
    rotate([45, 0, 0])
    cube([22, 2, 2]); 
    translate([-1, 0, -7])
    rotate([45, 0, 0])
    cube([22, 2, 2]);
    }
}

module mouth6(){
  translate([6, 0, -5]) {
    translate([0, .7, 0])
    rotate([45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);

    translate([0, -.7, 0])
    rotate([-45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);

    translate([0, 2.1, 0])
    rotate([-45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);

    translate([0, 5.1, 1])
    rotate([-45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);

    translate([0, 7.1, 2])
    rotate([-45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);

    translate([0, -2.1, 0])
    rotate([45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);

    translate([0, -5.1, 1])
    rotate([45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);

    translate([0, -7.1, 2])
    rotate([45, 0, 0])
    translate([-1, -1, -2])
    cube([10, 2, 4]);
  }
}