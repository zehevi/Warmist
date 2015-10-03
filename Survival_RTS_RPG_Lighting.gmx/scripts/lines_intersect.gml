///lines_intersect(x1,y1,x2,y2,x3,y3,x4,y4)
{
    var x1,y1,x2,y2,x3,y3,x4,y4,ud,ua,ub;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    x3 = argument4;
    y3 = argument5;
    x4 = argument6;
    y4 = argument7;
    ua = 0;
    ud = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1);
    if (ud != 0) {
        ua = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)) / ud;
        ub = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / ud;
        if(ub<0||ub>1) return -1;
    }
    return ua;
}
