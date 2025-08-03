$fa = 1;
$fs = 0.4;

//hdd
/*
color([1, 0, 0, .5])
   translate([24, -2, 8])
      cube([102, 146, 26]);
      */
      
/*
color([1, 0, 0, .5])
   translate([24, -2, 8])
      cube([70, 100, 96]);
      */
      

// front panel   
difference(){
   cube([150, 5, 42]);
   
   translate([24, -2, 8])
      cube([102, 10, 26]);

translate([75, 7, 21])
   scale([1.5, 1, 1])
      rotate([90, 0, 0])
         cylinder(10, 18, 18);
}

// left
difference(){
   union(){
      translate([24, 0, 6])
         cube([8, 148, 2]);
      translate([22, 0, 0])
         cube([2, 148, 20]);
      translate([1, 0, 0])   
         cube([22, 148, 2]);
      translate([1, 0, 0])
         cube([2, 148, 30]);
      translate([24, 146, 8])   
         cube([8, 2, 6]);
   }
   translate([-2, 40, 15])
      scale([1, 3, 1])
         rotate([0, 90, 0])
            cylinder(6, 10, 10);      

   translate([-2, 110, 15])
      scale([1, 3, 1])
         rotate([0, 90, 0])
            cylinder(6, 10, 10);      
   
   translate([13, 40, -2])
      scale([.8, 3, 1])
         rotate([0, 0, 90])
            cylinder(6, 10, 10);      
   
   translate([13, 110, -2])
      scale([.8, 3, 1])
         rotate([0, 0, 90])
            cylinder(6, 10, 10);      
}

//right
difference(){
   union(){
      translate([118, 0, 6])
         cube([8, 148, 2]);
      translate([126, 0, 0])
         cube([2, 148, 20]);
      translate([127, 0, 0])   
         cube([22, 148, 2]);
      translate([147, 0, 0])
         cube([2, 148, 30]);
      translate([118, 146, 8])   
         cube([8, 2, 6]);
   }
   translate([146, 40, 15])
      scale([1, 3, 1])
         rotate([0, 90, 0])
            cylinder(6, 10, 10);      

   translate([146, 110, 15])
      scale([1, 3, 1])
         rotate([0, 90, 0])
            cylinder(6, 10, 10);      
   
   translate([137, 40, -2])
      scale([.8, 3, 1])
         rotate([0, 0, 90])
            cylinder(6, 10, 10);      
   
   translate([137, 110, -2])
      scale([.8, 3, 1])
         rotate([0, 0, 90])
            cylinder(6, 10, 10);      
}
     
/*
translate([-2, 53.5,10])
rotate([0, 90, 0])
cylinder(6, 2, 2);

translate([-2, 132.5,10])
rotate([0, 90, 0])
cylinder(6, 2, 2);
*/
