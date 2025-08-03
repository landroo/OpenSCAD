$fa = 2;
$fs = 1;

//hdd
//color([1,0,0,.5])translate([24,0,8])cube([102,146,26]);
//color([1,0,0,.5])translate([40,0,16])cube([70,100,10]);

// front panel   
difference(){
   cube([150, 5, 42]);

   for(i=[10:10:30])
      for(j=[10:10:140])
         translate([j, 10, i])
            rotate([90, 0, 0])
               cylinder(20, 2, 2);
}

// left
difference(){
   union(){
      translate([1, 0, 0])   
         cube([36, 102, 2]);
      translate([1, 0, 0])
         cube([2, 102, 30]);
   }
   
   translate([-2, 55, 15])
      scale([1, 4, 1])
         rotate([0, 90, 0])
            cylinder(6, 10, 10);      
   translate([20, 55, -2])
      scale([1.5, 4, 1])
         rotate([0, 0, 90])
            cylinder(6, 10, 10);      
}

//right
difference(){
   union(){
      translate([112, 0, 0])   
         cube([37, 102, 2]);
      translate([147, 0, 0])
         cube([2, 102, 30]);
   }
   translate([146, 55, 15])
      scale([1, 4, 1])
         rotate([0, 90, 0])
            cylinder(6, 10, 10);      
   translate([130, 55, -2])
      scale([1.5, 4, 1])
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
