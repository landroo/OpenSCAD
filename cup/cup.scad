$fa = 1;
$fs = .4;

height = 100;
width = 100;

difference(){
    translate([0, 0, height - 20])
        resize([width, width, height * 2])
            sphere(50);
    
    translate([0, 0, height - 20])
        resize([width - 4, width - 4, height * 2 - 4])
            sphere(50);
            
    translate([-width / 2, -width / 2, -80])        
        cube([width, width, 80]);

    translate([-width / 2, -width / 2, height])
        cube([width, width, width]);
}

intersection(){
    
    translate([0, 0, height - 20])
        resize([width, width, height * 2])
            sphere(50);

    cylinder(2, width / 2, width / 2);

}

difference(){
    translate([0, 45 / 100 * width, 50 / 100 * height])
    scale([2, 3 / 100 * width, 2  / 100 * height])
    rotate([-20, 0, 0])
    rotate([0, 90, 0])
    difference(){
        scale([2, 1, 1])
            rotate_extrude(angle = 360, convexity = 10)
                translate([10, 0, 0])
                    resize([2, 8, 1])
                        circle(r = 5);

        translate([0, -2, 0])
            rotate([0, 0, 10])
                translate([-30, -10, -5])
                    cube([60, 10, 10]);
    }    
    translate([0, 0, height - 20])
        resize([width - 4, width - 4, height * 2 - 4])
            sphere(50);
                
}

