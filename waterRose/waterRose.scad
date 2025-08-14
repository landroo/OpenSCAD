$fa = 2;
$fs = 1;


difference() {
   scale([1, 1, .2])
      difference(){
         sphere(50);

         for(i = [-70: 20: 90])
            rotate([0, 0, i])
               for(j = [-55: 5: 55])
                  rotate([0, j, 0])
                     if(j < -5 || j > 5 )
                        cylinder(100, .75, .75);
               
         sphere(46);
      }

   translate([-100, -100, -196])
      cube([200, 200, 200]);
      
}


/*
translate([0, 0, -46])
difference(){
   cylinder(50, 12.5, 46);
   cylinder(50, 10.5, 44);
}
*/


translate([-40, 0, -52])
difference(){
   scale([.87, 1, 1])
      rotate([0, 30, 0])
         difference(){
            cylinder(100, 17, 58);
            cylinder(100, 14, 56);
         }

   translate([-20, -80, 56])
      cube([150, 150, 150]);
}

translate([-53, 0, -74])
   rotate([0, 30, 0])
      difference() {
         cylinder(30, 15, 17);
         cylinder(30, 12.75, 12.75);
      }
