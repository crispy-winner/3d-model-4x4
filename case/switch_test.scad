module socket(l=13.9, wall=2, height=4)
{
        difference()
        {
                difference(){
                        cube([l+wall*2, l+wall*2, height]);
                        translate([wall, wall, -1])
                                cube([l, l, height+2]);
                }
                translate([wall-0.5, (l+wall*2-5)/2, -(1.3)])
                        cube([l+1, 5, height]);
        }
}


module keypad_matrix(count_x=6, count_y=6, socket=[13.9, 2.5, 2], wall=2, height=8)
{
        transp=(socket[0]+2*socket[1]);
        for(x=[0:count_x-1])
        {

                for(y=[0:count_y-1])
                {
                        translate([x*transp, y*transp, 0])
                                socket(socket[0],socket[1],socket[2]);
                }
        }
        translate([0,0,-(height-socket[2])])
        difference()
        {
        translate([-socket[1],-socket[1],0])
        cube([(count_x)*transp+wall*2, (count_y)*transp+wall*2, height]);
        translate([0,0,-0.1])
        cube([(count_x)*transp, (count_y)*transp, height+0.2]);
        }


}

keypad_matrix(count_x=6, count_y=5);
