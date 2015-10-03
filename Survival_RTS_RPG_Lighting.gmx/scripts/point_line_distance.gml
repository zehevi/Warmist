///point_line_distance(x1,y1,x2,y2,pointx,pointy)
{
    var x0,y0,x1,y1,x2,y2,x3,y3,dx,dy,t;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    x3 = argument4;
    y3 = argument5;
    dx = x2 - x1;
    dy = y2 - y1;
    
    t = median(0,1, ((x3 - x1) * dx + (y3 - y1) * dy) / (dx * dx + dy * dy) );
    global._tx = x1+t*dx;
    global._ty = y1+t*dy;
    return point_distance(x3,y3,global._tx,global._ty);
}
